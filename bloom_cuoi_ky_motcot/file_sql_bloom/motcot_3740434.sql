create table motcot_3740434 (c1 int);
\timing 
insert into motcot_3740434 select random()*1000000000 from generate_series(1,3740434);
create index idx_bloom on motcot_3740434 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_3740434 where c1 = 709938199;
SELECT pg_size_pretty( pg_relation_size('motcot_3740434'));
SELECT pg_size_pretty( pg_indexes_size('motcot_3740434'));
drop index idx_bloom;
drop table motcot_3740434;
