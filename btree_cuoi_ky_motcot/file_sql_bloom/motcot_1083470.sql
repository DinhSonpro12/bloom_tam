create table motcot_1083470 (c1 int);
\timing 
insert into motcot_1083470 select random()*1000000000 from generate_series(1,1083470);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_1083470 where c1 = 391869309;
create index idx_btree on motcot_1083470 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_1083470'));
SELECT pg_size_pretty( pg_indexes_size('motcot_1083470'));
drop index idx_btree;
drop table motcot_1083470;
