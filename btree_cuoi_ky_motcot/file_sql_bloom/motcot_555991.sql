create table motcot_555991 (c1 int);
\timing 
insert into motcot_555991 select random()*1000000000 from generate_series(1,555991);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_555991 where c1 = 467250311;
create index idx_btree on motcot_555991 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_555991'));
SELECT pg_size_pretty( pg_indexes_size('motcot_555991'));
drop index idx_btree;
drop table motcot_555991;
