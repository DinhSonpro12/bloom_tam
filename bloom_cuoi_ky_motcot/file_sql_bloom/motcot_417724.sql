create table motcot_417724 (c1 int);
\timing 
insert into motcot_417724 select random()*1000000000 from generate_series(1,417724);
create index idx_bloom on motcot_417724 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_417724 where c1 = 150588395;
SELECT pg_size_pretty( pg_relation_size('motcot_417724'));
SELECT pg_size_pretty( pg_indexes_size('motcot_417724'));
drop index idx_bloom;
drop table motcot_417724;
