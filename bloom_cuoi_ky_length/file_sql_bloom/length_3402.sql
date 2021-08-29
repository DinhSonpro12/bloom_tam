create table length_3402 (c1 int);
\timing 
insert into length_3402 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_3402 using bloom (c1) WITH (length=3402);
explain (analyze,verbose,timing,costs,buffers) select * from length_3402 where c1 = 228626198;
SELECT pg_size_pretty( pg_relation_size('length_3402'));
SELECT pg_size_pretty( pg_indexes_size('length_3402'));
drop index idx_bloom;
drop table length_3402;
