create table length_549 (c1 int);
\timing 
insert into length_549 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_549 using bloom (c1) WITH (length=549);
explain (analyze,verbose,timing,costs,buffers) select * from length_549 where c1 = 681053169;
SELECT pg_size_pretty( pg_relation_size('length_549'));
SELECT pg_size_pretty( pg_indexes_size('length_549'));
drop index idx_bloom;
drop table length_549;
