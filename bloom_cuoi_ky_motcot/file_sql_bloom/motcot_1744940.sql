create table motcot_1744940 (c1 int);
\timing 
insert into motcot_1744940 select random()*1000000000 from generate_series(1,1744940);
create index idx_bloom on motcot_1744940 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_1744940 where c1 = 546115016;
SELECT pg_size_pretty( pg_relation_size('motcot_1744940'));
SELECT pg_size_pretty( pg_indexes_size('motcot_1744940'));
drop index idx_bloom;
drop table motcot_1744940;
