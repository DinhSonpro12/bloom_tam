create table nhieucot_379749 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_379749 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,379749);
create index idx_bloom on nhieucot_379749 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_379749 where c1 = 219948811 and c2 = 659846433 and c3 = 31421258;
SELECT pg_size_pretty( pg_relation_size('nhieucot_379749'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_379749'));
drop index idx_bloom;
drop table nhieucot_379749;
