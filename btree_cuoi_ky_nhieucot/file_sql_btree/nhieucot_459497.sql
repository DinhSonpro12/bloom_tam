create table nhieucot_459497 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_459497 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,459497);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_459497 where c1 = 1022588844 and c2 = 1533883266 and c3 = 170431474;
create index idx_btree on nhieucot_459497 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_459497'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_459497'));
drop index idx_btree;
drop table nhieucot_459497;
