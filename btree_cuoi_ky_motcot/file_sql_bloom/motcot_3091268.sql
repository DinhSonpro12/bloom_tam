create table motcot_3091268 (c1 int);
\timing 
insert into motcot_3091268 select random()*1000000000 from generate_series(1,3091268);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_3091268 where c1 = 542490813;
create index idx_btree on motcot_3091268 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_3091268'));
SELECT pg_size_pretty( pg_indexes_size('motcot_3091268'));
drop index idx_btree;
drop table motcot_3091268;
