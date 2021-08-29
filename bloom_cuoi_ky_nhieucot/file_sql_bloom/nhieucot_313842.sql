create table nhieucot_313842 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_313842 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,313842);
create index idx_bloom on nhieucot_313842 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_313842 where c1 = 661627095 and c2 = 1984881285 and c3 = 94518156;
SELECT pg_size_pretty( pg_relation_size('nhieucot_313842'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_313842'));
drop index idx_bloom;
drop table nhieucot_313842;
