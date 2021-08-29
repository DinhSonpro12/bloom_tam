create table motcot_313842 (c1 int);
\timing 
insert into motcot_313842 select random()*1000000000 from generate_series(1,313842);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_313842 where c1 = 78631219;
create index idx_btree on motcot_313842 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_313842'));
SELECT pg_size_pretty( pg_indexes_size('motcot_313842'));
drop index idx_btree;
drop table motcot_313842;
