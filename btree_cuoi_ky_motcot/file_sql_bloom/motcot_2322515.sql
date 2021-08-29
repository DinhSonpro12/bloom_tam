create table motcot_2322515 (c1 int);
\timing 
insert into motcot_2322515 select random()*1000000000 from generate_series(1,2322515);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_2322515 where c1 = 238720853;
create index idx_btree on motcot_2322515 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_2322515'));
SELECT pg_size_pretty( pg_indexes_size('motcot_2322515'));
drop index idx_btree;
drop table motcot_2322515;
