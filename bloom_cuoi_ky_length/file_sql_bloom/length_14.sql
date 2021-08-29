create table length_14 (c1 int);
\timing 
insert into length_14 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_14 using bloom (c1) WITH (length=14);
explain (analyze,verbose,timing,costs,buffers) select * from length_14 where c1 = 736978566;
SELECT pg_size_pretty( pg_relation_size('length_14'));
SELECT pg_size_pretty( pg_indexes_size('length_14'));
drop index idx_bloom;
drop table length_14;
