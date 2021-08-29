create table motcot_1191817 (c1 int);
\timing 
insert into motcot_1191817 select random()*1000000000 from generate_series(1,1191817);
create index idx_bloom on motcot_1191817 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_1191817 where c1 = 466495461;
SELECT pg_size_pretty( pg_relation_size('motcot_1191817'));
SELECT pg_size_pretty( pg_indexes_size('motcot_1191817'));
drop index idx_bloom;
drop table motcot_1191817;
