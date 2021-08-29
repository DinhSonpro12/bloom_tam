create table nhieucot_q1_814027 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_q1_814027 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,814027);
create index idx_bloom on nhieucot_q1_814027 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_q1_814027 where c1 = 85771870;
SELECT pg_size_pretty( pg_relation_size('nhieucot_q1_814027'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_q1_814027'));
drop index idx_bloom;
drop table nhieucot_q1_814027;
