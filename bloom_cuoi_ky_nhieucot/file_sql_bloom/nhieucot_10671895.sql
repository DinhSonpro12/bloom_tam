create table nhieucot_10671895 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_10671895 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,10671895);
create index idx_bloom on nhieucot_10671895 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_10671895 where c1 = 8466492 and c2 = 25399476 and c3 = 1209498;
SELECT pg_size_pretty( pg_relation_size('nhieucot_10671895'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_10671895'));
drop index idx_bloom;
drop table nhieucot_10671895;
