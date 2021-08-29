create table motcot_4525925 (c1 int);
\timing 
insert into motcot_4525925 select random()*1000000000 from generate_series(1,4525925);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_4525925 where c1 = 252701804;
create index idx_btree on motcot_4525925 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_4525925'));
SELECT pg_size_pretty( pg_indexes_size('motcot_4525925'));
drop index idx_btree;
drop table motcot_4525925;
