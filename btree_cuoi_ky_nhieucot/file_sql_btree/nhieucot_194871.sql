create table nhieucot_194871 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_194871 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,194871);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_194871 where c1 = 1996594522 and c2 = 2994891783 and c3 = 332765753;
create index idx_btree on nhieucot_194871 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_194871'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_194871'));
drop index idx_btree;
drop table nhieucot_194871;
