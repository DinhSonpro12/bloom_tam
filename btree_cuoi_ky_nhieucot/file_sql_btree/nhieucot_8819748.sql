create table nhieucot_8819748 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_8819748 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,8819748);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_8819748 where c1 = 1804026264 and c2 = 2706039396 and c3 = 300671044;
create index idx_btree on nhieucot_8819748 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_8819748'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_8819748'));
drop index idx_btree;
drop table nhieucot_8819748;
