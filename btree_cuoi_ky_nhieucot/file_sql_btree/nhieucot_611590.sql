create table nhieucot_611590 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_611590 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,611590);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_611590 where c1 = 371601918 and c2 = 557402877 and c3 = 61933653;
create index idx_btree on nhieucot_611590 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_611590'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_611590'));
drop index idx_btree;
drop table nhieucot_611590;
