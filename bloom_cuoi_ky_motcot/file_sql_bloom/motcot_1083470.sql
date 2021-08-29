create table motcot_1083470 (c1 int);
\timing 
insert into motcot_1083470 select random()*1000000000 from generate_series(1,1083470);
create index idx_bloom on motcot_1083470 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_1083470 where c1 = 979390678;
SELECT pg_size_pretty( pg_relation_size('motcot_1083470'));
SELECT pg_size_pretty( pg_indexes_size('motcot_1083470'));
drop index idx_bloom;
drop table motcot_1083470;
