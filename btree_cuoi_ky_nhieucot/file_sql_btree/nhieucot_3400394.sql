create table nhieucot_3400394 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_3400394 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,3400394);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_3400394 where c1 = 1185058706 and c2 = 1777588059 and c3 = 197509784;
create index idx_btree on nhieucot_3400394 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_3400394'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_3400394'));
drop index idx_btree;
drop table nhieucot_3400394;
