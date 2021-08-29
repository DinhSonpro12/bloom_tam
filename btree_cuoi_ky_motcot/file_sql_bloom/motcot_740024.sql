create table motcot_740024 (c1 int);
\timing 
insert into motcot_740024 select random()*1000000000 from generate_series(1,740024);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_740024 where c1 = 154223235;
create index idx_btree on motcot_740024 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_740024'));
SELECT pg_size_pretty( pg_indexes_size('motcot_740024'));
drop index idx_btree;
drop table motcot_740024;
