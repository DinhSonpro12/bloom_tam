create table nhieucot_3740434 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_3740434 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,3740434);
create index idx_bloom on nhieucot_3740434 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_3740434 where c1 = 888680651 and c2 = 2666041953 and c3 = 126954378;
SELECT pg_size_pretty( pg_relation_size('nhieucot_3740434'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_3740434'));
drop index idx_bloom;
drop table nhieucot_3740434;
