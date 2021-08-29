create table length_381 (c1 int);
\timing 
insert into length_381 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_381 using bloom (c1) WITH (length=381);
explain (analyze,verbose,timing,costs,buffers) select * from length_381 where c1 = 160205444;
SELECT pg_size_pretty( pg_relation_size('length_381'));
SELECT pg_size_pretty( pg_indexes_size('length_381'));
drop index idx_bloom;
drop table length_381;
