create table motcot_345227 (c1 int);
\timing 
insert into motcot_345227 select random()*1000000000 from generate_series(1,345227);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_345227 where c1 = 62784391;
create index idx_btree on motcot_345227 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_345227'));
SELECT pg_size_pretty( pg_indexes_size('motcot_345227'));
drop index idx_btree;
drop table motcot_345227;
