create table nhieucot_1744940 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_1744940 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,1744940);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_1744940 where c1 = 1150304536 and c2 = 1725456804 and c3 = 191717422;
create index idx_btree on nhieucot_1744940 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_1744940'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_1744940'));
drop index idx_btree;
drop table nhieucot_1744940;
