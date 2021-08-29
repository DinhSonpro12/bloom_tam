create table nhieucot_672749 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_672749 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,672749);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_672749 where c1 = 913805978 and c2 = 1370708967 and c3 = 152300996;
create index idx_btree on nhieucot_672749 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_672749'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_672749'));
drop index idx_btree;
drop table nhieucot_672749;
