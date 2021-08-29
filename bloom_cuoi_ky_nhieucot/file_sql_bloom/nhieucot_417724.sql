create table nhieucot_417724 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_417724 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,417724);
create index idx_bloom on nhieucot_417724 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_417724 where c1 = 297021883 and c2 = 891065649 and c3 = 42431697;
SELECT pg_size_pretty( pg_relation_size('nhieucot_417724'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_417724'));
drop index idx_bloom;
drop table nhieucot_417724;
