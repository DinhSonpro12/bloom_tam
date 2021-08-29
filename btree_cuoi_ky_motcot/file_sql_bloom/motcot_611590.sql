create table motcot_611590 (c1 int);
\timing 
insert into motcot_611590 select random()*1000000000 from generate_series(1,611590);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_611590 where c1 = 23858082;
create index idx_btree on motcot_611590 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_611590'));
SELECT pg_size_pretty( pg_indexes_size('motcot_611590'));
drop index idx_btree;
drop table motcot_611590;
