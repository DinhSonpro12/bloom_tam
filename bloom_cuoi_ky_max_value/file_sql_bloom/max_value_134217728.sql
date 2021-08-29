create table max_value_134217728 (c1 int);
\timing 
insert into max_value_134217728 select random()*134217728 from generate_series(1,10000000);
create index idx_bloom on max_value_134217728 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_134217728 where c1 = 27263996;
SELECT pg_size_pretty( pg_relation_size('max_value_134217728'));
SELECT pg_size_pretty( pg_indexes_size('max_value_134217728'));
drop index idx_bloom;
drop table max_value_134217728;
