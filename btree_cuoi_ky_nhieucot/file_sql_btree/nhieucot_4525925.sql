create table nhieucot_4525925 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_4525925 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,4525925);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_4525925 where c1 = 1675082980 and c2 = 2512624470 and c3 = 279180496;
create index idx_btree on nhieucot_4525925 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_4525925'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_4525925'));
drop index idx_btree;
drop table nhieucot_4525925;
