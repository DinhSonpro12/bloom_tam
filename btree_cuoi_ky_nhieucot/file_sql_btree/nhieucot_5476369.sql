create table nhieucot_5476369 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_5476369 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,5476369);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_5476369 where c1 = 1779769818 and c2 = 2669654727 and c3 = 296628303;
create index idx_btree on nhieucot_5476369 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_5476369'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_5476369'));
drop index idx_btree;
drop table nhieucot_5476369;
