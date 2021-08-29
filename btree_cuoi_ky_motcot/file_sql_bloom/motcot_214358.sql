create table motcot_214358 (c1 int);
\timing 
insert into motcot_214358 select random()*1000000000 from generate_series(1,214358);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_214358 where c1 = 96781087;
create index idx_btree on motcot_214358 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_214358'));
SELECT pg_size_pretty( pg_indexes_size('motcot_214358'));
drop index idx_btree;
drop table motcot_214358;
