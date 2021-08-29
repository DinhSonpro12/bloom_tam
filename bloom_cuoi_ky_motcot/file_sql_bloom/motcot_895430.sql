create table motcot_895430 (c1 int);
\timing 
insert into motcot_895430 select random()*1000000000 from generate_series(1,895430);
create index idx_bloom on motcot_895430 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_895430 where c1 = 293508424;
SELECT pg_size_pretty( pg_relation_size('motcot_895430'));
SELECT pg_size_pretty( pg_indexes_size('motcot_895430'));
drop index idx_bloom;
drop table motcot_895430;
