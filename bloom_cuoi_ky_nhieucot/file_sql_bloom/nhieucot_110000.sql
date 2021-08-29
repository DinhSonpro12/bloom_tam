create table nhieucot_110000 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_110000 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,110000);
create index idx_bloom on nhieucot_110000 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_110000 where c1 = 940785242 and c2 = 2822355726 and c3 = 134397891;
SELECT pg_size_pretty( pg_relation_size('nhieucot_110000'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_110000'));
drop index idx_bloom;
drop table nhieucot_110000;
