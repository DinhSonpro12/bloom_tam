create table length_35 (c1 int);
\timing 
insert into length_35 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_35 using bloom (c1) WITH (length=35);
explain (analyze,verbose,timing,costs,buffers) select * from length_35 where c1 = 366042346;
SELECT pg_size_pretty( pg_relation_size('length_35'));
SELECT pg_size_pretty( pg_indexes_size('length_35'));
drop index idx_bloom;
drop table length_35;
