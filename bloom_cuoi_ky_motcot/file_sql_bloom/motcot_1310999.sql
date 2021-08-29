create table motcot_1310999 (c1 int);
\timing 
insert into motcot_1310999 select random()*1000000000 from generate_series(1,1310999);
create index idx_bloom on motcot_1310999 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_1310999 where c1 = 501056692;
SELECT pg_size_pretty( pg_relation_size('motcot_1310999'));
SELECT pg_size_pretty( pg_indexes_size('motcot_1310999'));
drop index idx_bloom;
drop table motcot_1310999;
