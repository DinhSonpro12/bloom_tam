create table nhieucot_1442099 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_1442099 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,1442099);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_1442099 where c1 = 163664196 and c2 = 245496294 and c3 = 27277366;
create index idx_btree on nhieucot_1442099 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_1442099'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_1442099'));
drop index idx_btree;
drop table nhieucot_1442099;
