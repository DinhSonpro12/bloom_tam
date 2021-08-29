create table motcot_379749 (c1 int);
\timing 
insert into motcot_379749 select random()*1000000000 from generate_series(1,379749);
create index idx_bloom on motcot_379749 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_379749 where c1 = 303151460;
SELECT pg_size_pretty( pg_relation_size('motcot_379749'));
SELECT pg_size_pretty( pg_indexes_size('motcot_379749'));
drop index idx_bloom;
drop table motcot_379749;
