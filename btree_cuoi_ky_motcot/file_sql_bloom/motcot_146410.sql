create table motcot_146410 (c1 int);
\timing 
insert into motcot_146410 select random()*1000000000 from generate_series(1,146410);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_146410 where c1 = 431216993;
create index idx_btree on motcot_146410 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_146410'));
SELECT pg_size_pretty( pg_indexes_size('motcot_146410'));
drop index idx_btree;
drop table motcot_146410;
