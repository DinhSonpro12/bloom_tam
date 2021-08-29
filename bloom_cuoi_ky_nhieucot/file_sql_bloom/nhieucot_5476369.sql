create table nhieucot_5476369 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_5476369 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,5476369);
create index idx_bloom on nhieucot_5476369 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_5476369 where c1 = 54410167 and c2 = 163230501 and c3 = 7772881;
SELECT pg_size_pretty( pg_relation_size('nhieucot_5476369'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_5476369'));
drop index idx_bloom;
drop table nhieucot_5476369;
