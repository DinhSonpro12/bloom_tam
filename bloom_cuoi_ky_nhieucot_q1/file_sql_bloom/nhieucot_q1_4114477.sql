create table nhieucot_q1_4114477 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_q1_4114477 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,4114477);
create index idx_bloom on nhieucot_q1_4114477 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_q1_4114477 where c1 = 380328342;
SELECT pg_size_pretty( pg_relation_size('nhieucot_q1_4114477'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_q1_4114477'));
drop index idx_bloom;
drop table nhieucot_q1_4114477;
