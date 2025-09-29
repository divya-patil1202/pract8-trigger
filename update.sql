create or replace trigger updatemaster
before update or delete on clientmaster
for each row
BEGIN
insert into Audit_t (srno, name) values (:old.srno, :old.name);
END;
/
