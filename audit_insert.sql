create or replace trigger Audit_insert
before delete or insert on Audit_t
begin 
if rtrim (upper(to_char(sysdate,'day')))='THURSDAY' then 
raise_application_error ( -200000,'cant delete');
end if;
end;
/
