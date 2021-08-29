create table length_264 (c1 int);
\timing 
insert into length_264 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_264 using bloom (c1) WITH (length=264);
explain (analyze,verbose,timing,costs,buffers) select * from length_264 where c1 = 789902851;
SELECT pg_size_pretty( pg_relation_size('length_264'));
SELECT pg_size_pretty( pg_indexes_size('length_264'));
drop index idx_bloom;
drop table length_264;
