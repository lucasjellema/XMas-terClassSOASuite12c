create or replace type cas_register_it_1_0 force as object
( case_reference   varchar2(50 char)
, case_type        varchar2(5 char)
, case_version     number
, case_xml         clob
, intake_id        number
, intake_date      timestamp
, has_documents    varchar2(1 char)
, constructor function cas_register_it_1_0 return self as result
)
/

create or replace type body cas_register_it_1_0 AS
--
constructor function cas_register_it_1_0
return self as result as
--
begin
  return;
end;
--
end;
/
show err