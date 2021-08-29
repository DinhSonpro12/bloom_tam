create table nhieucot_2810243 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_2810243 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,2810243);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_2810243 where c1 = 1740032138 and c2 = 2610048207 and c3 = 290005356;
create index idx_btree on nhieucot_2810243 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_2810243'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_2810243'));
drop index idx_btree;
drop table nhieucot_2810243;
