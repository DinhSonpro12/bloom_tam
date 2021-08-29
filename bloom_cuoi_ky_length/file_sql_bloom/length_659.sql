create table length_659 (c1 int);
\timing 
insert into length_659 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_659 using bloom (c1) WITH (length=659);
explain (analyze,verbose,timing,costs,buffers) select * from length_659 where c1 = 898305904;
SELECT pg_size_pretty( pg_relation_size('length_659'));
SELECT pg_size_pretty( pg_indexes_size('length_659'));
drop index idx_bloom;
drop table length_659;
