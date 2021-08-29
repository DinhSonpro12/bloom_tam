create table nhieucot_285311 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_285311 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,285311);
create index idx_bloom on nhieucot_285311 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_285311 where c1 = 151548531 and c2 = 454645593 and c3 = 21649790;
SELECT pg_size_pretty( pg_relation_size('nhieucot_285311'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_285311'));
drop index idx_bloom;
drop table nhieucot_285311;
