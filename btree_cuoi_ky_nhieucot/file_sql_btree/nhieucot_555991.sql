create table nhieucot_555991 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_555991 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,555991);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_555991 where c1 = 1545314688 and c2 = 2317972032 and c3 = 257552448;
create index idx_btree on nhieucot_555991 (c1);
SELECT pg_size_pretty( pg_relation_size('nhieucot_555991'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_555991'));
drop index idx_btree;
drop table nhieucot_555991;
