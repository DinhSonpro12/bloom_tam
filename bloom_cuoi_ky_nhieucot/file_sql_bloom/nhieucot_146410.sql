create table nhieucot_146410 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_146410 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,146410);
create index idx_bloom on nhieucot_146410 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_146410 where c1 = 915867688 and c2 = 2747603064 and c3 = 130838241;
SELECT pg_size_pretty( pg_relation_size('nhieucot_146410'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_146410'));
drop index idx_bloom;
drop table nhieucot_146410;
