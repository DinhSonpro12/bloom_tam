create table nhieucot_895430 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_895430 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,895430);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_895430 where c1 = 1139537140 and c2 = 1709305710 and c3 = 189922856;
create index idx_btree on nhieucot_895430 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_895430'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_895430'));
drop index idx_btree;
drop table nhieucot_895430;
