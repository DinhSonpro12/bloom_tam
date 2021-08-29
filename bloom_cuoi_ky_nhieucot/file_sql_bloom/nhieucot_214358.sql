create table nhieucot_214358 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_214358 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,214358);
create index idx_bloom on nhieucot_214358 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_214358 where c1 = 544129002 and c2 = 1632387006 and c3 = 77732714;
SELECT pg_size_pretty( pg_relation_size('nhieucot_214358'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_214358'));
drop index idx_bloom;
drop table nhieucot_214358;
