create table length_153 (c1 int);
\timing 
insert into length_153 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_153 using bloom (c1) WITH (length=153);
explain (analyze,verbose,timing,costs,buffers) select * from length_153 where c1 = 631855887;
SELECT pg_size_pretty( pg_relation_size('length_153'));
SELECT pg_size_pretty( pg_indexes_size('length_153'));
drop index idx_bloom;
drop table length_153;
