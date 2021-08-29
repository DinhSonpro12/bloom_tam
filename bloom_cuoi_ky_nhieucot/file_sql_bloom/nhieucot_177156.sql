create table nhieucot_177156 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_177156 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,177156);
create index idx_bloom on nhieucot_177156 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_177156 where c1 = 863768933 and c2 = 2591306799 and c3 = 123395561;
SELECT pg_size_pretty( pg_relation_size('nhieucot_177156'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_177156'));
drop index idx_bloom;
drop table nhieucot_177156;
