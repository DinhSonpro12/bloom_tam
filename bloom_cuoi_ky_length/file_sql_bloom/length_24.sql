create table length_24 (c1 int);
\timing 
insert into length_24 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_24 using bloom (c1) WITH (length=24);
explain (analyze,verbose,timing,costs,buffers) select * from length_24 where c1 = 957880356;
SELECT pg_size_pretty( pg_relation_size('length_24'));
SELECT pg_size_pretty( pg_indexes_size('length_24'));
drop index idx_bloom;
drop table length_24;
