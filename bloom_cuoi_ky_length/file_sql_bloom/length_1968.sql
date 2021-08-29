create table length_1968 (c1 int);
\timing 
insert into length_1968 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_1968 using bloom (c1) WITH (length=1968);
explain (analyze,verbose,timing,costs,buffers) select * from length_1968 where c1 = 304705668;
SELECT pg_size_pretty( pg_relation_size('length_1968'));
SELECT pg_size_pretty( pg_indexes_size('length_1968'));
drop index idx_bloom;
drop table length_1968;
