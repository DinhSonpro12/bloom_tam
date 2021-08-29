create table nhieucot_8017953 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_8017953 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,8017953);
create index idx_bloom on nhieucot_8017953 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_8017953 where c1 = 291188212 and c2 = 873564636 and c3 = 41598316;
SELECT pg_size_pretty( pg_relation_size('nhieucot_8017953'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_8017953'));
drop index idx_bloom;
drop table nhieucot_8017953;
