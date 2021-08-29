create table nhieucot_q1_984973 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_q1_984973 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,984973);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_q1_984973 where c1 = 572486464;
create index idx_btree on nhieucot_q1_984973 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_q1_984973'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_q1_984973'));
drop index idx_btree;
drop table nhieucot_q1_984973;
