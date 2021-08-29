create table length_73 (c1 int);
\timing 
insert into length_73 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_73 using bloom (c1) WITH (length=73);
explain (analyze,verbose,timing,costs,buffers) select * from length_73 where c1 = 808469466;
SELECT pg_size_pretty( pg_relation_size('length_73'));
SELECT pg_size_pretty( pg_indexes_size('length_73'));
drop index idx_bloom;
drop table length_73;
