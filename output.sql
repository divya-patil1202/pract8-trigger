SQL> create table clientmaster(srno int, name varchar(20));

Table created.

SQL> create table Audit_t as select * from clientmaster;

Table created.

SQL> insert into clientmaster (srno,varchar) values (101,'Divya');
insert into clientmaster (srno,varchar) values (101,'Divya')
                               *
ERROR at line 1:
ORA-01747: invalid user.table.column, table.column, or column specification


SQL> insert into clientmaster (srno,name) values (101,'Divya');

1 row created.

SQL> insert into clientmaster (srno,name) values (102,'sanika');

1 row created.

SQL> insert into clientmaster (srno,name) values (102,'gayatri');

1 row created.

SQL> @C:\Users\Divya\Desktop\sqlplus\trigger\update.sql

Trigger created.

SQL> select * from clientmaster;

      SRNO NAME
---------- --------------------
       101 Divya
       102 sanika
       102 gayatri

SQL> update clientmaster set srno = 103 where name = 'gayatri';

1 row updated.

SQL> select * from clientmaster;

      SRNO NAME
---------- --------------------
       101 Divya
       102 sanika
       103 gayatri

SQL> select * from Audit_t;

      SRNO NAME
---------- --------------------
       102 sanika

SQL> delete from clientmaster where srno = 102;

1 row deleted.

SQL> select * from Audit_t;

      SRNO NAME
---------- --------------------
       102 sanika
       102 gayatri

SQL> commit;

Commit complete.


SQL> @C:\Users\Divya\Desktop\sqlplus\trigger\update.sql

Trigger created.

SQL> select * from clientmaster;

      SRNO NAME
---------- --------------------
       101 Divya
       103 gayatri

SQL> insert into cilentmaster (srno,name) values (103,'pooja');
insert into cilentmaster (srno,name) values (103,'pooja')
            *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> select * from Audit_t;

      SRNO NAME
---------- --------------------
       102 sanika
       102 gayatri

SQL> create table insertbackup as select * from clientmaster;

Table created.

SQL> @C:\Users\Divya\Desktop\sqlplus\trigger\insert.sql

Trigger created.

SQL> select * from insertbackup;

      SRNO NAME
---------- --------------------
       101 Divya
       103 gayatri

SQL> insert into clientmaster values(104,'divya');

1 row created.

SQL> select * from Audit_t;

      SRNO NAME
---------- --------------------
       102 sanika
       102 gayatri

SQL> select * from clientmaster;

      SRNO NAME
---------- --------------------
       101 Divya
       103 sanika
       104 divya

SQL> @C:\Users\Divya\Desktop\sqlplus\trigger\Audit_insert.sql

Trigger created.

SQL> @C:\Users\Divya\Desktop\sqlplus\trigger\Audit_update.sql

Trigger created.

SQL> select * from clientmaster;

      SRNO NAME
---------- --------------------
       101 Divya
       103 sanika
       104 divya

SQL> select * from Audit_t;

      SRNO NAME
---------- --------------------
       102 sanika
       102 gayatri

SQL> select * from insertbackup;

      SRNO NAME
---------- --------------------
       101 Divya
       103 sanika
       104 divya

SQL> commit;

Commit complete.

SQL>
