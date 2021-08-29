create table nhieucot_672749 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_672749 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,672749);
create index idx_bloom on nhieucot_672749 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_672749 where c1 = 39729729 and c2 = 119189187 and c3 = 5675675;
SELECT pg_size_pretty( pg_relation_size('nhieucot_672749'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_672749'));
drop index idx_bloom;
drop table nhieucot_672749;
