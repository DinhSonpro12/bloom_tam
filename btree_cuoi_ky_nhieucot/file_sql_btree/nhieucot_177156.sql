create table nhieucot_177156 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_177156 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,177156);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_177156 where c1 = 978837662 and c2 = 1468256493 and c3 = 163139610;
create index idx_btree on nhieucot_177156 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_177156'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_177156'));
drop index idx_btree;
drop table nhieucot_177156;
