create table motcot_235794 (c1 int);
\timing 
insert into motcot_235794 select random()*1000000000 from generate_series(1,235794);
create index idx_bloom on motcot_235794 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_235794 where c1 = 923008756;
SELECT pg_size_pretty( pg_relation_size('motcot_235794'));
SELECT pg_size_pretty( pg_indexes_size('motcot_235794'));
drop index idx_bloom;
drop table motcot_235794;
