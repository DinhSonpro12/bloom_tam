create table column_11 (c1 int,c2 int,c3 int,c4 int,c5 int,c6 int,c7 int,c8 int,c9 int,c10 int,c11 int);
\timing 
insert into column_11 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on column_11 using bloom (c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11) WITH (col1 = 2,col2 = 2,col3 = 2,col4 = 2,col5 = 2,col6 = 2,col7 = 2,col8 = 2,col9 = 2,col10 = 2,col11 = 2);
explain (analyze,verbose,timing,costs,buffers) select * from column_11 where c1 = 457946 AND c2 = 457946 AND c3 = 457946 AND c4 = 457946 AND c5 = 457946 AND c6 = 457946 AND c7 = 457946 AND c8 = 457946 AND c9 = 457946 AND c10 = 457946 AND c11 = 457946 ;
SELECT pg_size_pretty( pg_relation_size('column_11'));
SELECT pg_size_pretty( pg_indexes_size('column_11'));
drop index idx_bloom;
drop table column_11;
