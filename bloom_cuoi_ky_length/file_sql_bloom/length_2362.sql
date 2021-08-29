create table length_2362 (c1 int);
\timing 
insert into length_2362 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_2362 using bloom (c1) WITH (length=2362);
explain (analyze,verbose,timing,costs,buffers) select * from length_2362 where c1 = 152207904;
SELECT pg_size_pretty( pg_relation_size('length_2362'));
SELECT pg_size_pretty( pg_indexes_size('length_2362'));
drop index idx_bloom;
drop table length_2362;
