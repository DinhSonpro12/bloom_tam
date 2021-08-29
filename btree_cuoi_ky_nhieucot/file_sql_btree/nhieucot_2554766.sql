create table nhieucot_2554766 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_2554766 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,2554766);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_2554766 where c1 = 1381868316 and c2 = 2072802474 and c3 = 230311386;
create index idx_btree on nhieucot_2554766 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_2554766'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_2554766'));
drop index idx_btree;
drop table nhieucot_2554766;
