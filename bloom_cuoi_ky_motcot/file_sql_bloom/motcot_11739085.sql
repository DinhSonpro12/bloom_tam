create table motcot_11739085 (c1 int);
\timing 
insert into motcot_11739085 select random()*1000000000 from generate_series(1,11739085);
create index idx_bloom on motcot_11739085 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_11739085 where c1 = 242961432;
SELECT pg_size_pretty( pg_relation_size('motcot_11739085'));
SELECT pg_size_pretty( pg_indexes_size('motcot_11739085'));
drop index idx_bloom;
drop table motcot_11739085;
