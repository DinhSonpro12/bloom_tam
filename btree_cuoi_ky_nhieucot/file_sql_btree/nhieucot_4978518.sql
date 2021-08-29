create table nhieucot_4978518 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_4978518 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,4978518);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_4978518 where c1 = 1217060566 and c2 = 1825590849 and c3 = 202843427;
create index idx_btree on nhieucot_4978518 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_4978518'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_4978518'));
drop index idx_btree;
drop table nhieucot_4978518;
