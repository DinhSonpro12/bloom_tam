create table motcot_110000 (c1 int);
\timing 
insert into motcot_110000 select random()*1000000000 from generate_series(1,110000);
create index idx_bloom on motcot_110000 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_110000 where c1 = 576371854;
SELECT pg_size_pretty( pg_relation_size('motcot_110000'));
SELECT pg_size_pretty( pg_indexes_size('motcot_110000'));
drop index idx_bloom;
drop table motcot_110000;
