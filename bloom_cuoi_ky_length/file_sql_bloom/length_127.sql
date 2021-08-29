create table length_127 (c1 int);
\timing 
insert into length_127 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_127 using bloom (c1) WITH (length=127);
explain (analyze,verbose,timing,costs,buffers) select * from length_127 where c1 = 49124809;
SELECT pg_size_pretty( pg_relation_size('length_127'));
SELECT pg_size_pretty( pg_indexes_size('length_127'));
drop index idx_bloom;
drop table length_127;
