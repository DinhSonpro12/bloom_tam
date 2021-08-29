create table nhieucot_121000 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_121000 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,121000);
create index idx_bloom on nhieucot_121000 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_121000 where c1 = 175775367 and c2 = 527326101 and c3 = 25110766;
SELECT pg_size_pretty( pg_relation_size('nhieucot_121000'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_121000'));
drop index idx_bloom;
drop table nhieucot_121000;
