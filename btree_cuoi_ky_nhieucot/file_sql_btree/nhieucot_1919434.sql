create table nhieucot_1919434 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_1919434 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,1919434);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_1919434 where c1 = 1410547860 and c2 = 2115821790 and c3 = 235091310;
create index idx_btree on nhieucot_1919434 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_1919434'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_1919434'));
drop index idx_btree;
drop table nhieucot_1919434;
