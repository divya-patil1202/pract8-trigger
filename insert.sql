CREATE OR REPLACE TRIGGER insertmaster
AFTER INSERT ON clientmaster
FOR EACH ROW
BEGIN
    INSERT INTO insertbackup (srno, name)
    VALUES (:NEW.srno, :NEW.name);
END;
/
