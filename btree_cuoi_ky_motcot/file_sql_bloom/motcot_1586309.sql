create table motcot_1586309 (c1 int);
\timing 
insert into motcot_1586309 select random()*1000000000 from generate_series(1,1586309);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_1586309 where c1 = 776939103;
create index idx_btree on motcot_1586309 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_1586309'));
SELECT pg_size_pretty( pg_indexes_size('motcot_1586309'));
drop index idx_btree;
drop table motcot_1586309;
