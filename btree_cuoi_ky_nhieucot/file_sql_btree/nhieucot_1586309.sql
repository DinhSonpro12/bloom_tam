create table nhieucot_1586309 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_1586309 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,1586309);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_1586309 where c1 = 1543644580 and c2 = 2315466870 and c3 = 257274096;
create index idx_btree on nhieucot_1586309 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_1586309'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_1586309'));
drop index idx_btree;
drop table nhieucot_1586309;
