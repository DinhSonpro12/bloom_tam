create table motcot_194871 (c1 int);
\timing 
insert into motcot_194871 select random()*1000000000 from generate_series(1,194871);
create index idx_bloom on motcot_194871 using bloom (c1);
explain (analyze,verbose,timing,costs,buffers) select * from motcot_194871 where c1 = 446426112;
SELECT pg_size_pretty( pg_relation_size('motcot_194871'));
SELECT pg_size_pretty( pg_indexes_size('motcot_194871'));
drop index idx_bloom;
drop table motcot_194871;
