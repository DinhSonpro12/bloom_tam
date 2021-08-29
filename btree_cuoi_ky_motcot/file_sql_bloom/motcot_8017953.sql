create table motcot_8017953 (c1 int);
\timing 
insert into motcot_8017953 select random()*1000000000 from generate_series(1,8017953);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_8017953 where c1 = 734417349;
create index idx_btree on motcot_8017953 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_8017953'));
SELECT pg_size_pretty( pg_indexes_size('motcot_8017953'));
drop index idx_btree;
drop table motcot_8017953;
