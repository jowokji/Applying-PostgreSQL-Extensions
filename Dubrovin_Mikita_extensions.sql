
create extension pg_stat_statements;
create extension pgcrypto;


select * from pg_extension;


create table employees (
   id serial primary key,
   first_name varchar(255),
   last_name varchar(255),
   email varchar(255),
   encrypted_password text
);


insert into employees (first_name, last_name, email, encrypted_password) values
   ('bandarenka', 'uladzislau', 'bandarenka.uladzislau@student.ehu.lt', crypt('aboba1492', gen_salt('bf'))),
   ('mikita', 'dubrovin', 'mikita.dubrovin@student.ehu.lt', crypt('aboba1491', gen_salt('bf'))),
   ('taras', 'rybirn', 'taras.rybirn@student.ehu.lt', crypt('aboba1498', gen_salt('bf')));


select * from employees;


update employees set last_name = 'С#' where email = 'bandarenka.uladzislau@student.ehu.lt';

select * from employees;


delete from employees where email = 'bandarenka.uladzislau@student.ehu.lt';

select * from employees;


alter system set shared_preload_libraries to 'pg_stat_statements';
alter system set pg_stat_statements.track to 'all';


select * from pg_stat_statements;


select query, calls 
from pg_stat_statements
order by calls desc;


select query, total_plan_time as total_time , total_plan_time /calls as avg_time
from pg_stat_statements
order by avg_time, total_time desc;
