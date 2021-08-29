create table motcot_2554766 (c1 int);
\timing 
insert into motcot_2554766 select random()*1000000000 from generate_series(1,2554766);
create index idx_bloom on motcot_2554766 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_2554766 where c1 = 130293379;
SELECT pg_size_pretty( pg_relation_size('motcot_2554766'));
SELECT pg_size_pretty( pg_indexes_size('motcot_2554766'));
drop index idx_bloom;
drop table motcot_2554766;
