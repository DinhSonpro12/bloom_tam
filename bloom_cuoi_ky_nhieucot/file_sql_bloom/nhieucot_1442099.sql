create table nhieucot_1442099 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_1442099 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,1442099);
create index idx_bloom on nhieucot_1442099 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_1442099 where c1 = 869093760 and c2 = 2607281280 and c3 = 124156251;
SELECT pg_size_pretty( pg_relation_size('nhieucot_1442099'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_1442099'));
drop index idx_bloom;
drop table nhieucot_1442099;
