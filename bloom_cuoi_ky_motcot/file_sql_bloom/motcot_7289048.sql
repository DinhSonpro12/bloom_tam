create table motcot_7289048 (c1 int);
\timing 
insert into motcot_7289048 select random()*1000000000 from generate_series(1,7289048);
create index idx_bloom on motcot_7289048 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_7289048 where c1 = 138500698;
SELECT pg_size_pretty( pg_relation_size('motcot_7289048'));
SELECT pg_size_pretty( pg_indexes_size('motcot_7289048'));
drop index idx_bloom;
drop table motcot_7289048;
