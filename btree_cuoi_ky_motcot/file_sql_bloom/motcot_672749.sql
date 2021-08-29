create table motcot_672749 (c1 int);
\timing 
insert into motcot_672749 select random()*1000000000 from generate_series(1,672749);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_672749 where c1 = 708672694;
create index idx_btree on motcot_672749 (c1);
SELECT pg_size_pretty( pg_relation_size('motcot_672749'));
SELECT pg_size_pretty( pg_indexes_size('motcot_672749'));
drop index idx_btree;
drop table motcot_672749;
