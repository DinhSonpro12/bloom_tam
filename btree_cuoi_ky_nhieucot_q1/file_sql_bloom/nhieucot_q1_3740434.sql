create table nhieucot_q1_3740434 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_q1_3740434 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,3740434);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_q1_3740434 where c1 = 26092148;
create index idx_btree on nhieucot_q1_3740434 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_q1_3740434'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_q1_3740434'));
drop index idx_btree;
drop table nhieucot_q1_3740434;
