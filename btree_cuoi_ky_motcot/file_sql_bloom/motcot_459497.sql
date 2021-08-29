create table motcot_459497 (c1 int);
\timing 
insert into motcot_459497 select random()*1000000000 from generate_series(1,459497);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_459497 where c1 = 532930564;
create index idx_btree on motcot_459497 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_459497'));
SELECT pg_size_pretty( pg_indexes_size('motcot_459497'));
drop index idx_btree;
drop table motcot_459497;
