create table length_42 (c1 int);
\timing 
insert into length_42 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_42 using bloom (c1) WITH (length=42);
explain (analyze,verbose,timing,costs,buffers) select * from length_42 where c1 = 107007258;
SELECT pg_size_pretty( pg_relation_size('length_42'));
SELECT pg_size_pretty( pg_indexes_size('length_42'));
drop index idx_bloom;
drop table length_42;
