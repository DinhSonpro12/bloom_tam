create table nhieucot_161051 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_161051 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,161051);
create index idx_bloom on nhieucot_161051 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_161051 where c1 = 326722404 and c2 = 980167212 and c3 = 46674629;
SELECT pg_size_pretty( pg_relation_size('nhieucot_161051'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_161051'));
drop index idx_bloom;
drop table nhieucot_161051;
