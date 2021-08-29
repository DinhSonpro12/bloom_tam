create table motcot_555991 (c1 int);
\timing 
insert into motcot_555991 select random()*1000000000 from generate_series(1,555991);
create index idx_bloom on motcot_555991 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_555991 where c1 = 96372651;
SELECT pg_size_pretty( pg_relation_size('motcot_555991'));
SELECT pg_size_pretty( pg_indexes_size('motcot_555991'));
drop index idx_bloom;
drop table motcot_555991;
