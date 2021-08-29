create table motcot_4525925 (c1 int);
\timing 
insert into motcot_4525925 select random()*1000000000 from generate_series(1,4525925);
create index idx_bloom on motcot_4525925 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_4525925 where c1 = 70729267;
SELECT pg_size_pretty( pg_relation_size('motcot_4525925'));
SELECT pg_size_pretty( pg_indexes_size('motcot_4525925'));
drop index idx_bloom;
drop table motcot_4525925;
