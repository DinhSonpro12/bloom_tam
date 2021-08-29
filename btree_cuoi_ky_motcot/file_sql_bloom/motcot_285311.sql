create table motcot_285311 (c1 int);
\timing 
insert into motcot_285311 select random()*1000000000 from generate_series(1,285311);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_285311 where c1 = 600681971;
create index idx_btree on motcot_285311 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_285311'));
SELECT pg_size_pretty( pg_indexes_size('motcot_285311'));
drop index idx_btree;
drop table motcot_285311;
