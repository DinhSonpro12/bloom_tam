create table nhieucot_555991 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_555991 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,555991);
create index idx_bloom on nhieucot_555991 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_555991 where c1 = 581582492 and c2 = 1744747476 and c3 = 83083213;
SELECT pg_size_pretty( pg_relation_size('nhieucot_555991'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_555991'));
drop index idx_bloom;
drop table nhieucot_555991;
