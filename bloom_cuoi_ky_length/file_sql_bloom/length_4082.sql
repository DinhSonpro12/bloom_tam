create table length_4082 (c1 int);
\timing 
insert into length_4082 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_4082 using bloom (c1) WITH (length=4082);
explain (analyze,verbose,timing,costs,buffers) select * from length_4082 where c1 = 878546597;
SELECT pg_size_pretty( pg_relation_size('length_4082'));
SELECT pg_size_pretty( pg_indexes_size('length_4082'));
drop index idx_bloom;
drop table length_4082;
