create or replace package casemgmt_si_1_0
as
/******************************************************************************
  NAME    :   casemgmt_si_1_0
  PURPOSE :   Register and update of cases
  REVISIONS:
  Ver        Date        Author           Description
  ---------  ----------  ---------------  ------------------------------------
  1.0        24-07-2014  R. van Mölken    Initial version
******************************************************************************/

procedure register_case
( p_register_i        in  cas_register_it_1_0
, p_register_o        out cas_register_ot_1_0
);
--
procedure update_case
( p_update_i          in  cas_update_it_1_0
, p_update_o          out cas_update_ot_1_0
);
--
procedure get_by_reference
( p_case_reference     in  number
, p_case_o            out cas_case_ot_1_0
);
end casemgmt_si_1_0;
/

create or replace package body casemgmt_si_1_0 
as

procedure register_case
( p_register_i        in  cas_register_it_1_0
, p_register_o        out cas_register_ot_1_0
) is
  --
  l_case_id           cases.id%type;
  l_case_ref          cases.case_ref%type;
  --
begin
  --
  l_case_id           := case_seq.nextval();
  l_case_ref          := p_register_i.case_reference;
  --  
  insert into cases
  ( id
  , case_ref
  , case_type
  , case_version
  , case_xml
  , intake_id
  , intake_date
  , has_docs
  ) values
  ( l_case_id
  , l_case_ref
  , p_register_i.case_type
  , p_register_i.case_version
  , p_register_i.case_xml
  , p_register_i.intake_id
  , nvl(p_register_i.intake_date, sysdate)
  , p_register_i.has_documents
  );
  
  p_register_o := cas_register_ot_1_0();
  p_register_o.case_id := l_case_id;
  p_register_o.case_reference := l_case_ref;
  
exception
  when others then
    raise_application_error( -20400, substr('Fault in procedure register_case:' ||SQLERRM,1,500) );    
end register_case;
--

procedure update_case
( p_update_i          in  cas_update_it_1_0
, p_update_o          out cas_update_ot_1_0
) is
  --
  l_case_id           cases.id%type;
  l_case_ref          cases.case_ref%type;
  l_case_exists       number;
  --
begin
  --
  l_case_ref          := p_update_i.case_reference;
  
  -- Check if case exists with given case reference
  select count(*) 
  into l_case_exists
  from cases 
  where case_ref = l_case_ref;
  if l_case_exists = 0 then
    raise_application_error( -20404, 'No case found with reference '||l_case_ref);
  end if;
  
  update cases
  set case_xml = p_update_i.case_xml
    , has_docs = p_update_i.has_documents
  where cases.case_ref = l_case_ref
  returning id into l_case_id;
  
  p_update_o := cas_update_ot_1_0();
  p_update_o.case_id := l_case_id;
  p_update_o.case_reference := l_case_ref;
  
exception
  when others then
    raise_application_error( -20400, substr('Fault in procedure update_case:' ||SQLERRM,1,500) );    
end update_case;
--

procedure get_by_reference
( p_case_reference    in  number
, p_case_o            out cas_case_ot_1_0
) is  
  --
  cursor c_case (b_case_ref in cases.case_ref%type)
  is
    select cas.id
    ,      cas.case_type
    ,      cas.case_version
    ,      cas.case_xml
    ,      cas.intake_id
    ,      cas.intake_date
    ,      cas.has_docs
    from   cases cas
    where ( b_case_ref is null
       or ( b_case_ref is not null and cas.case_ref = b_case_ref));
  --  
  r_case              c_case%rowtype;       
  l_case_ref          cases.case_ref%type;
begin
  --
  l_case_ref          := p_case_reference;
  
  -- controleer of er een zaak bestaat voor deze aanduiding
  open c_case (l_case_ref);
  fetch c_case
  into r_case;
  if c_case%notfound then
    close c_case;
    raise_application_error( -20404, 'No case found with reference '||l_case_ref);
  end if;
  close c_case;
  
  p_case_o := cas_case_ot_1_0();
  p_case_o.case_id := r_case.id;
  p_case_o.case_reference := l_case_ref;
  p_case_o.case_type := r_case.case_type;
  p_case_o.case_xml := r_case.case_xml;
  p_case_o.intake_id := r_case.intake_id;
  p_case_o.intake_date := r_case.intake_date;
  p_case_o.has_documents := r_case.has_docs;
  
exception
  when others then
    raise_application_error( -20400, substr('Fault in procedure get_by_reference:' ||SQLERRM,1,500) );    
end get_by_reference;
--
end casemgmt_si_1_0;
/
show err