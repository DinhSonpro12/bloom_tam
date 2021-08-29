create table max_value_536870912 (c1 int);
\timing 
insert into max_value_536870912 select random()*536870912 from generate_series(1,10000000);
explain (analyze,verbose,timing,costs,buffers) select * from max_value_536870912 where c1 = 45191322;
create index idx_btree on max_value_536870912 (c1);
SELECT pg_size_pretty( pg_relation_size('max_value_536870912'));
SELECT pg_size_pretty( pg_indexes_size('max_value_536870912'));
drop index idx_btree;
drop table max_value_536870912;
