create table motcot_984973 (c1 int);
\timing 
insert into motcot_984973 select random()*1000000000 from generate_series(1,984973);
create index idx_bloom on motcot_984973 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_984973 where c1 = 858063765;
SELECT pg_size_pretty( pg_relation_size('motcot_984973'));
SELECT pg_size_pretty( pg_indexes_size('motcot_984973'));
drop index idx_bloom;
drop table motcot_984973;
