create table nhieucot_259374 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_259374 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,259374);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_259374 where c1 = 121456260 and c2 = 182184390 and c3 = 20242710;
create index idx_btree on nhieucot_259374 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_259374'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_259374'));
drop index idx_btree;
drop table nhieucot_259374;
