create table length_791 (c1 int);
\timing 
insert into length_791 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_791 using bloom (c1) WITH (length=791);
explain (analyze,verbose,timing,costs,buffers) select * from length_791 where c1 = 587388988;
SELECT pg_size_pretty( pg_relation_size('length_791'));
SELECT pg_size_pretty( pg_indexes_size('length_791'));
drop index idx_bloom;
drop table length_791;
