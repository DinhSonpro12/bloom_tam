create table nhieucot_740024 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_740024 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,740024);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_740024 where c1 = 686728386 and c2 = 1030092579 and c3 = 114454731;
create index idx_btree on nhieucot_740024 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_740024'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_740024'));
drop index idx_btree;
drop table nhieucot_740024;
