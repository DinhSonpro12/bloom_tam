create table length_949 (c1 int);
\timing 
insert into length_949 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_949 using bloom (c1) WITH (length=949);
explain (analyze,verbose,timing,costs,buffers) select * from length_949 where c1 = 285304583;
SELECT pg_size_pretty( pg_relation_size('length_949'));
SELECT pg_size_pretty( pg_indexes_size('length_949'));
drop index idx_bloom;
drop table length_949;
