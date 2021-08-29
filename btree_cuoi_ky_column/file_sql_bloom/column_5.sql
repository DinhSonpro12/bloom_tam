create table column_5 (c1 int,c2 int,c3 int,c4 int,c5 int);
\timing 
insert into column_5 select random()*1000000000 from generate_series(1,1000000);
explain (analyze,verbose,timing,costs,buffers) select * from column_5 where c1 = 457946 AND c2 = 457946 AND c3 = 457946 AND c4 = 457946 AND c5 = 457946 ;
create index idx_bloom on column_5 (c1,c2,c3,c4,c5);
SELECT pg_size_pretty( pg_relation_size('column_5'));
SELECT pg_size_pretty( pg_indexes_size('column_5'));
drop index idx_bloom;
drop table column_5;
