create table nhieucot_3740434 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_3740434 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,3740434);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_3740434 where c1 = 1408762426 and c2 = 2113143639 and c3 = 234793737;
create index idx_btree on nhieucot_3740434 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_3740434'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_3740434'));
drop index idx_btree;
drop table nhieucot_3740434;
