create table nhieucot_110000 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_110000 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,110000);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_110000 where c1 = 542967834 and c2 = 814451751 and c3 = 90494639;
create index idx_btree on nhieucot_110000 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_110000'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_110000'));
drop index idx_btree;
drop table nhieucot_110000;
