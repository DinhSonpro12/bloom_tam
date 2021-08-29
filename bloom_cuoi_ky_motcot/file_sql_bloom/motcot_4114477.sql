create table motcot_4114477 (c1 int);
\timing 
insert into motcot_4114477 select random()*1000000000 from generate_series(1,4114477);
create index idx_bloom on motcot_4114477 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_4114477 where c1 = 348282324;
SELECT pg_size_pretty( pg_relation_size('motcot_4114477'));
SELECT pg_size_pretty( pg_indexes_size('motcot_4114477'));
drop index idx_bloom;
drop table motcot_4114477;
