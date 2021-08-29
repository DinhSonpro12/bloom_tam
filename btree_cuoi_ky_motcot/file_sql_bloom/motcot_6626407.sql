create table motcot_6626407 (c1 int);
\timing 
insert into motcot_6626407 select random()*1000000000 from generate_series(1,6626407);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_6626407 where c1 = 402345832;
create index idx_btree on motcot_6626407 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_6626407'));
SELECT pg_size_pretty( pg_indexes_size('motcot_6626407'));
drop index idx_btree;
drop table motcot_6626407;
