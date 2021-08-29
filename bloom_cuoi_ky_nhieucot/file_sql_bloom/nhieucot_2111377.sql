create table nhieucot_2111377 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_2111377 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,2111377);
create index idx_bloom on nhieucot_2111377 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_2111377 where c1 = 477838063 and c2 = 1433514189 and c3 = 68262580;
SELECT pg_size_pretty( pg_relation_size('nhieucot_2111377'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_2111377'));
drop index idx_bloom;
drop table nhieucot_2111377;
