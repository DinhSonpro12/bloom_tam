create table length_88 (c1 int);
\timing 
insert into length_88 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_88 using bloom (c1) WITH (length=88);
explain (analyze,verbose,timing,costs,buffers) select * from length_88 where c1 = 278751968;
SELECT pg_size_pretty( pg_relation_size('length_88'));
SELECT pg_size_pretty( pg_indexes_size('length_88'));
drop index idx_bloom;
drop table length_88;
