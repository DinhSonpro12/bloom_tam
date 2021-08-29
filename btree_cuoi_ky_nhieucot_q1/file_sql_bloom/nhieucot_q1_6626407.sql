create table nhieucot_q1_6626407 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_q1_6626407 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,6626407);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_q1_6626407 where c1 = 624018599;
create index idx_btree on nhieucot_q1_6626407 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_q1_6626407'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_q1_6626407'));
drop index idx_btree;
drop table nhieucot_q1_6626407;
