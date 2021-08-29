create table length_51 (c1 int);
\timing 
insert into length_51 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_51 using bloom (c1) WITH (length=51);
explain (analyze,verbose,timing,costs,buffers) select * from length_51 where c1 = 127031676;
SELECT pg_size_pretty( pg_relation_size('length_51'));
SELECT pg_size_pretty( pg_indexes_size('length_51'));
drop index idx_bloom;
drop table length_51;
