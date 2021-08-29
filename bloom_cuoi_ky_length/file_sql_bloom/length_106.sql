create table length_106 (c1 int);
\timing 
insert into length_106 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_106 using bloom (c1) WITH (length=106);
explain (analyze,verbose,timing,costs,buffers) select * from length_106 where c1 = 817224271;
SELECT pg_size_pretty( pg_relation_size('length_106'));
SELECT pg_size_pretty( pg_indexes_size('length_106'));
drop index idx_bloom;
drop table length_106;
