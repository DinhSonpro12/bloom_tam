create table nhieucot_1191817 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_1191817 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,1191817);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_1191817 where c1 = 1791298628 and c2 = 2686947942 and c3 = 298549771;
create index idx_btree on nhieucot_1191817 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_1191817'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_1191817'));
drop index idx_btree;
drop table nhieucot_1191817;
