create table nhieucot_895430 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_895430 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,895430);
create index idx_bloom on nhieucot_895430 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_895430 where c1 = 771033951 and c2 = 2313101853 and c3 = 110147707;
SELECT pg_size_pretty( pg_relation_size('nhieucot_895430'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_895430'));
drop index idx_bloom;
drop table nhieucot_895430;
