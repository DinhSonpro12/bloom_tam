create table motcot_177156 (c1 int);
\timing 
insert into motcot_177156 select random()*1000000000 from generate_series(1,177156);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_177156 where c1 = 806170856;
create index idx_btree on motcot_177156 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_177156'));
SELECT pg_size_pretty( pg_indexes_size('motcot_177156'));
drop index idx_btree;
drop table motcot_177156;
