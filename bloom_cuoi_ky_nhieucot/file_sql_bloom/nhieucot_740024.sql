create table nhieucot_740024 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_740024 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,740024);
create index idx_bloom on nhieucot_740024 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_740024 where c1 = 321648646 and c2 = 964945938 and c3 = 45949806;
SELECT pg_size_pretty( pg_relation_size('nhieucot_740024'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_740024'));
drop index idx_bloom;
drop table nhieucot_740024;
