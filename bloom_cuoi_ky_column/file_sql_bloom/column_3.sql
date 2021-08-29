create table column_3 (c1 int,c2 int,c3 int);
\timing 
insert into column_3 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on column_3 using bloom (c1,c2,c3) WITH (col1 = 2,col2 = 2,col3 = 2);
explain (analyze,verbose,timing,costs,buffers) select * from column_3 where c1 = 457946 AND c2 = 457946 AND c3 = 457946 ;
SELECT pg_size_pretty( pg_relation_size('column_3'));
SELECT pg_size_pretty( pg_indexes_size('column_3'));
drop index idx_bloom;
drop table column_3;
