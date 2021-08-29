create table motcot_1442099 (c1 int);
\timing 
insert into motcot_1442099 select random()*1000000000 from generate_series(1,1442099);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_1442099 where c1 = 269471181;
create index idx_btree on motcot_1442099 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_1442099'));
SELECT pg_size_pretty( pg_indexes_size('motcot_1442099'));
drop index idx_btree;
drop table motcot_1442099;
