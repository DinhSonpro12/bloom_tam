create table motcot_1919434 (c1 int);
\timing 
insert into motcot_1919434 select random()*1000000000 from generate_series(1,1919434);
create index idx_bloom on motcot_1919434 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_1919434 where c1 = 710174594;
SELECT pg_size_pretty( pg_relation_size('motcot_1919434'));
SELECT pg_size_pretty( pg_indexes_size('motcot_1919434'));
drop index idx_bloom;
drop table motcot_1919434;
