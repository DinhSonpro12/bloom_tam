create table length_1139 (c1 int);
\timing 
insert into length_1139 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_1139 using bloom (c1) WITH (length=1139);
explain (analyze,verbose,timing,costs,buffers) select * from length_1139 where c1 = 36735870;
SELECT pg_size_pretty( pg_relation_size('length_1139'));
SELECT pg_size_pretty( pg_indexes_size('length_1139'));
drop index idx_bloom;
drop table length_1139;
