create table length_220 (c1 int);
\timing 
insert into length_220 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_220 using bloom (c1) WITH (length=220);
explain (analyze,verbose,timing,costs,buffers) select * from length_220 where c1 = 811587964;
SELECT pg_size_pretty( pg_relation_size('length_220'));
SELECT pg_size_pretty( pg_indexes_size('length_220'));
drop index idx_bloom;
drop table length_220;
