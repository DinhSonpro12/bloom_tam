create table nhieucot_q1_379749 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_q1_379749 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,379749);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_q1_379749 where c1 = 918133055;
create index idx_btree on nhieucot_q1_379749 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_q1_379749'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_q1_379749'));
drop index idx_btree;
drop table nhieucot_q1_379749;
