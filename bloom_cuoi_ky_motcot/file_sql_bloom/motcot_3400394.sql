create table motcot_3400394 (c1 int);
\timing 
insert into motcot_3400394 select random()*1000000000 from generate_series(1,3400394);
create index idx_bloom on motcot_3400394 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_3400394 where c1 = 65692566;
SELECT pg_size_pretty( pg_relation_size('motcot_3400394'));
SELECT pg_size_pretty( pg_indexes_size('motcot_3400394'));
drop index idx_bloom;
drop table motcot_3400394;
