create table motcot_110000 (c1 int);
\timing 
insert into motcot_110000 select random()*1000000000 from generate_series(1,110000);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_110000 where c1 = 228005513;
create index idx_btree on motcot_110000 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_110000'));
SELECT pg_size_pretty( pg_indexes_size('motcot_110000'));
drop index idx_btree;
drop table motcot_110000;
