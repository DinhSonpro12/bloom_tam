create table nhieucot_1191817 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_1191817 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,1191817);
create index idx_bloom on nhieucot_1191817 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_1191817 where c1 = 515925495 and c2 = 1547776485 and c3 = 73703642;
SELECT pg_size_pretty( pg_relation_size('nhieucot_1191817'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_1191817'));
drop index idx_bloom;
drop table nhieucot_1191817;
