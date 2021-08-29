create table motcot_121000 (c1 int);
\timing 
insert into motcot_121000 select random()*1000000000 from generate_series(1,121000);
create index idx_bloom on motcot_121000 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_121000 where c1 = 514644453;
SELECT pg_size_pretty( pg_relation_size('motcot_121000'));
SELECT pg_size_pretty( pg_indexes_size('motcot_121000'));
drop index idx_bloom;
drop table motcot_121000;
