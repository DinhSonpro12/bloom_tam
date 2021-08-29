create table motcot_146410 (c1 int);
\timing 
insert into motcot_146410 select random()*1000000000 from generate_series(1,146410);
create index idx_bloom on motcot_146410 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_146410 where c1 = 907040827;
SELECT pg_size_pretty( pg_relation_size('motcot_146410'));
SELECT pg_size_pretty( pg_indexes_size('motcot_146410'));
drop index idx_bloom;
drop table motcot_146410;
