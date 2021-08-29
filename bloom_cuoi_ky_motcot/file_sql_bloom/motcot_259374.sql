create table motcot_259374 (c1 int);
\timing 
insert into motcot_259374 select random()*1000000000 from generate_series(1,259374);
create index idx_bloom on motcot_259374 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_259374 where c1 = 42747717;
SELECT pg_size_pretty( pg_relation_size('motcot_259374'));
SELECT pg_size_pretty( pg_indexes_size('motcot_259374'));
drop index idx_bloom;
drop table motcot_259374;
