create table nhieucot_984973 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_984973 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,984973);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_984973 where c1 = 319755648 and c2 = 479633472 and c3 = 53292608;
create index idx_btree on nhieucot_984973 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_984973'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_984973'));
drop index idx_btree;
drop table nhieucot_984973;
