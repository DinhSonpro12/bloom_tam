create table motcot_9701723 (c1 int);
\timing 
insert into motcot_9701723 select random()*1000000000 from generate_series(1,9701723);
create index idx_bloom on motcot_9701723 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_9701723 where c1 = 544559169;
SELECT pg_size_pretty( pg_relation_size('motcot_9701723'));
SELECT pg_size_pretty( pg_indexes_size('motcot_9701723'));
drop index idx_bloom;
drop table motcot_9701723;
