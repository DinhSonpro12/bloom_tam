create table column_26 (c1 int,c2 int,c3 int,c4 int,c5 int,c6 int,c7 int,c8 int,c9 int,c10 int,c11 int,c12 int,c13 int,c14 int,c15 int,c16 int,c17 int,c18 int,c19 int,c20 int,c21 int,c22 int,c23 int,c24 int,c25 int,c26 int);
\timing 
insert into column_26 select random()*1000000000 from generate_series(1,1000000);
create index idx_bloom on column_26 using bloom (c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26) WITH (col1 = 2,col2 = 2,col3 = 2,col4 = 2,col5 = 2,col6 = 2,col7 = 2,col8 = 2,col9 = 2,col10 = 2,col11 = 2,col12 = 2,col13 = 2,col14 = 2,col15 = 2,col16 = 2,col17 = 2,col18 = 2,col19 = 2,col20 = 2,col21 = 2,col22 = 2,col23 = 2,col24 = 2,col25 = 2,col26 = 2);
explain (analyze,verbose,timing,costs,buffers) select * from column_26 where c1 = 457946 AND c2 = 457946 AND c3 = 457946 AND c4 = 457946 AND c5 = 457946 AND c6 = 457946 AND c7 = 457946 AND c8 = 457946 AND c9 = 457946 AND c10 = 457946 AND c11 = 457946 AND c12 = 457946 AND c13 = 457946 AND c14 = 457946 AND c15 = 457946 AND c16 = 457946 AND c17 = 457946 AND c18 = 457946 AND c19 = 457946 AND c20 = 457946 AND c21 = 457946 AND c22 = 457946 AND c23 = 457946 AND c24 = 457946 AND c25 = 457946 AND c26 = 457946 ;
SELECT pg_size_pretty( pg_relation_size('column_26'));
SELECT pg_size_pretty( pg_indexes_size('column_26'));
drop index idx_bloom;
drop table column_26;
