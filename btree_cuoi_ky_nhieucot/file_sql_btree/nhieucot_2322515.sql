create table nhieucot_2322515 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_2322515 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,2322515);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_2322515 where c1 = 1489509816 and c2 = 2234264724 and c3 = 248251636;
create index idx_btree on nhieucot_2322515 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_2322515'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_2322515'));
drop index idx_btree;
drop table nhieucot_2322515;
