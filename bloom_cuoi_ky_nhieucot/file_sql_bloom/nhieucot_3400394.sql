create table nhieucot_3400394 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_3400394 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,3400394);
create index idx_bloom on nhieucot_3400394 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_3400394 where c1 = 274917571 and c2 = 824752713 and c3 = 39273938;
SELECT pg_size_pretty( pg_relation_size('nhieucot_3400394'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_3400394'));
drop index idx_bloom;
drop table nhieucot_3400394;
