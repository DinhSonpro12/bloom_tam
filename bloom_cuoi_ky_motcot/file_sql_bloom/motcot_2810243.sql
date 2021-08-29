create table motcot_2810243 (c1 int);
\timing 
insert into motcot_2810243 select random()*1000000000 from generate_series(1,2810243);
create index idx_bloom on motcot_2810243 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_2810243 where c1 = 945586824;
SELECT pg_size_pretty( pg_relation_size('motcot_2810243'));
SELECT pg_size_pretty( pg_indexes_size('motcot_2810243'));
drop index idx_bloom;
drop table motcot_2810243;
