create table nhieucot_161051 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_161051 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,161051);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_161051 where c1 = 210308540 and c2 = 315462810 and c3 = 35051423;
create index idx_btree on nhieucot_161051 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_161051'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_161051'));
drop index idx_btree;
drop table nhieucot_161051;
