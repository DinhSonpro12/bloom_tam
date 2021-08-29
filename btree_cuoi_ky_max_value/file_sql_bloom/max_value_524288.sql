create table max_value_524288 (c1 int);
\timing 
insert into max_value_524288 select random()*524288 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_524288 where c1 = 437930;
create index idx_btree on max_value_524288 (c1);
SELECT pg_size_pretty( pg_relation_size('max_value_524288'));
SELECT pg_size_pretty( pg_indexes_size('max_value_524288'));
drop index idx_btree;
drop table max_value_524288;
