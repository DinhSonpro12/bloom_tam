create table length_317 (c1 int);
\timing 
insert into length_317 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_317 using bloom (c1) WITH (length=317);
explain (analyze,verbose,timing,costs,buffers) select * from length_317 where c1 = 13233178;
SELECT pg_size_pretty( pg_relation_size('length_317'));
SELECT pg_size_pretty( pg_indexes_size('length_317'));
drop index idx_bloom;
drop table length_317;
