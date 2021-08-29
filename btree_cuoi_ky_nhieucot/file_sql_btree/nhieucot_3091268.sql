create table nhieucot_3091268 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_3091268 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,3091268);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_3091268 where c1 = 1786402754 and c2 = 2679604131 and c3 = 297733792;
create index idx_btree on nhieucot_3091268 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_3091268'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_3091268'));
drop index idx_btree;
drop table nhieucot_3091268;
