create table nhieucot_417724 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_417724 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,417724);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_417724 where c1 = 242630706 and c2 = 363946059 and c3 = 40438451;
create index idx_btree on nhieucot_417724 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_417724'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_417724'));
drop index idx_btree;
drop table nhieucot_417724;
