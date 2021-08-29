create table motcot_505447 (c1 int);
\timing 
insert into motcot_505447 select random()*1000000000 from generate_series(1,505447);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_505447 where c1 = 479235052;
create index idx_btree on motcot_505447 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_505447'));
SELECT pg_size_pretty( pg_indexes_size('motcot_505447'));
drop index idx_btree;
drop table motcot_505447;
