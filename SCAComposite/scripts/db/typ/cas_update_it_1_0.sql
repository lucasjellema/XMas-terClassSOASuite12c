create or replace type cas_update_it_1_0 force as object
( case_reference   varchar2(50 char)
, case_xml         clob
, has_documents    varchar2(1 char)
, constructor function cas_update_it_1_0 return self as result
)
/

create or replace type body cas_update_it_1_0 AS
--
constructor function cas_update_it_1_0
return self as result as
--
begin
  return;
end;
--
end;
/
show err