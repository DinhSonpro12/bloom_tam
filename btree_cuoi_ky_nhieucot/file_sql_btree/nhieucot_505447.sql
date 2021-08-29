create table nhieucot_505447 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_505447 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,505447);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_505447 where c1 = 789700824 and c2 = 1184551236 and c3 = 131616804;
create index idx_btree on nhieucot_505447 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_505447'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_505447'));
drop index idx_btree;
drop table nhieucot_505447;
