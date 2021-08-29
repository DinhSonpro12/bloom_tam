create table motcot_4978518 (c1 int);
\timing 
insert into motcot_4978518 select random()*1000000000 from generate_series(1,4978518);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_4978518 where c1 = 193619926;
create index idx_btree on motcot_4978518 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_4978518'));
SELECT pg_size_pretty( pg_indexes_size('motcot_4978518'));
drop index idx_btree;
drop table motcot_4978518;
