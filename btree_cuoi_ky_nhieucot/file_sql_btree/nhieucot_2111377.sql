create table nhieucot_2111377 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_2111377 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,2111377);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_2111377 where c1 = 58397796 and c2 = 87596694 and c3 = 9732966;
create index idx_btree on nhieucot_2111377 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_2111377'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_2111377'));
drop index idx_btree;
drop table nhieucot_2111377;
