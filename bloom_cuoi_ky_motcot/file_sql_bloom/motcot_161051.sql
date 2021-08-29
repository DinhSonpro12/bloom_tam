create table motcot_161051 (c1 int);
\timing 
insert into motcot_161051 select random()*1000000000 from generate_series(1,161051);
create index idx_bloom on motcot_161051 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_161051 where c1 = 106799592;
SELECT pg_size_pretty( pg_relation_size('motcot_161051'));
SELECT pg_size_pretty( pg_indexes_size('motcot_161051'));
drop index idx_bloom;
drop table motcot_161051;
