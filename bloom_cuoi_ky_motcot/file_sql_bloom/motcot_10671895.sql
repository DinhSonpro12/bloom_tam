create table motcot_10671895 (c1 int);
\timing 
insert into motcot_10671895 select random()*1000000000 from generate_series(1,10671895);
create index idx_bloom on motcot_10671895 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_10671895 where c1 = 216686809;
SELECT pg_size_pretty( pg_relation_size('motcot_10671895'));
SELECT pg_size_pretty( pg_indexes_size('motcot_10671895'));
drop index idx_bloom;
drop table motcot_10671895;
