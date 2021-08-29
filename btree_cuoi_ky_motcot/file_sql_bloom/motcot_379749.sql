create table motcot_379749 (c1 int);
\timing 
insert into motcot_379749 select random()*1000000000 from generate_series(1,379749);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_379749 where c1 = 602352536;
create index idx_btree on motcot_379749 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_379749'));
SELECT pg_size_pretty( pg_indexes_size('motcot_379749'));
drop index idx_btree;
drop table motcot_379749;
