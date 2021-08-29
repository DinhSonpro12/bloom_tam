create table nhieucot_11739085 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_11739085 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,11739085);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_11739085 where c1 = 1563691468 and c2 = 2345537202 and c3 = 260615244;
create index idx_btree on nhieucot_11739085 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_11739085'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_11739085'));
drop index idx_btree;
drop table nhieucot_11739085;
