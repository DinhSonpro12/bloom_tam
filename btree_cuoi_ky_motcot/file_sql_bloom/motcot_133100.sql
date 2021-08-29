create table motcot_133100 (c1 int);
\timing 
insert into motcot_133100 select random()*1000000000 from generate_series(1,133100);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_133100 where c1 = 612635659;
create index idx_btree on motcot_133100 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_133100'));
SELECT pg_size_pretty( pg_indexes_size('motcot_133100'));
drop index idx_btree;
drop table motcot_133100;
