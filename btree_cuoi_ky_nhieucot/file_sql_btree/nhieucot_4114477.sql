create table nhieucot_4114477 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_4114477 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,4114477);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_4114477 where c1 = 1764831742 and c2 = 2647247613 and c3 = 294138623;
create index idx_btree on nhieucot_4114477 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_4114477'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_4114477'));
drop index idx_btree;
drop table nhieucot_4114477;
