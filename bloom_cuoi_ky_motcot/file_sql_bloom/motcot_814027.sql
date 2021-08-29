create table motcot_814027 (c1 int);
\timing 
insert into motcot_814027 select random()*1000000000 from generate_series(1,814027);
create index idx_bloom on motcot_814027 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_814027 where c1 = 472327247;
SELECT pg_size_pretty( pg_relation_size('motcot_814027'));
SELECT pg_size_pretty( pg_indexes_size('motcot_814027'));
drop index idx_bloom;
drop table motcot_814027;
