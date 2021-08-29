create table motcot_6024006 (c1 int);
\timing 
insert into motcot_6024006 select random()*1000000000 from generate_series(1,6024006);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_6024006 where c1 = 648686731;
create index idx_btree on motcot_6024006 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_6024006'));
SELECT pg_size_pretty( pg_indexes_size('motcot_6024006'));
drop index idx_btree;
drop table motcot_6024006;
