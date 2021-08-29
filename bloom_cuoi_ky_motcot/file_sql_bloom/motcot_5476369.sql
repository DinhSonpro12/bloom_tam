create table motcot_5476369 (c1 int);
\timing 
insert into motcot_5476369 select random()*1000000000 from generate_series(1,5476369);
create index idx_bloom on motcot_5476369 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_5476369 where c1 = 638503686;
SELECT pg_size_pretty( pg_relation_size('motcot_5476369'));
SELECT pg_size_pretty( pg_indexes_size('motcot_5476369'));
drop index idx_bloom;
drop table motcot_5476369;
