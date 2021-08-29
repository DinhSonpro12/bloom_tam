create table motcot_8819748 (c1 int);
\timing 
insert into motcot_8819748 select random()*1000000000 from generate_series(1,8819748);
create index idx_bloom on motcot_8819748 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_8819748 where c1 = 841785369;
SELECT pg_size_pretty( pg_relation_size('motcot_8819748'));
SELECT pg_size_pretty( pg_indexes_size('motcot_8819748'));
drop index idx_bloom;
drop table motcot_8819748;
