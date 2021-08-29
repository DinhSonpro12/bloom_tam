create table motcot_2111377 (c1 int);
\timing 
insert into motcot_2111377 select random()*1000000000 from generate_series(1,2111377);
create index idx_bloom on motcot_2111377 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_2111377 where c1 = 98087002;
SELECT pg_size_pretty( pg_relation_size('motcot_2111377'));
SELECT pg_size_pretty( pg_indexes_size('motcot_2111377'));
drop index idx_bloom;
drop table motcot_2111377;
