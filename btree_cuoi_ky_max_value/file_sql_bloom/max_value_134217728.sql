create table max_value_134217728 (c1 int);
\timing 
insert into max_value_134217728 select random()*134217728 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_134217728 where c1 = 86071470;
create index idx_btree on max_value_134217728 (c1);
SELECT pg_size_pretty( pg_relation_size('max_value_134217728'));
SELECT pg_size_pretty( pg_indexes_size('max_value_134217728'));
drop index idx_btree;
drop table max_value_134217728;
