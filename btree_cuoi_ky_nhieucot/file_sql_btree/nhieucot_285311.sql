create table nhieucot_285311 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_285311 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,285311);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_285311 where c1 = 1752478958 and c2 = 2628718437 and c3 = 292079826;
create index idx_btree on nhieucot_285311 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_285311'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_285311'));
drop index idx_btree;
drop table nhieucot_285311;
