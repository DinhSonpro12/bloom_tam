create table nhieucot_611590 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_611590 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,611590);
create index idx_bloom on nhieucot_611590 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_611590 where c1 = 872567605 and c2 = 2617702815 and c3 = 124652515;
SELECT pg_size_pretty( pg_relation_size('nhieucot_611590'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_611590'));
drop index idx_bloom;
drop table nhieucot_611590;
