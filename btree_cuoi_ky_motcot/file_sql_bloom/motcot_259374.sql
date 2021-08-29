create table motcot_259374 (c1 int);
\timing 
insert into motcot_259374 select random()*1000000000 from generate_series(1,259374);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_259374 where c1 = 115653797;
create index idx_btree on motcot_259374 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_259374'));
SELECT pg_size_pretty( pg_indexes_size('motcot_259374'));
drop index idx_btree;
drop table motcot_259374;
