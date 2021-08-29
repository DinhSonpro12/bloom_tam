create table length_29 (c1 int);
\timing 
insert into length_29 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_29 using bloom (c1) WITH (length=29);
explain (analyze,verbose,timing,costs,buffers) select * from length_29 where c1 = 37122183;
SELECT pg_size_pretty( pg_relation_size('length_29'));
SELECT pg_size_pretty( pg_indexes_size('length_29'));
drop index idx_bloom;
drop table length_29;
