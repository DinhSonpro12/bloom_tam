create table nhieucot_6626407 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_6626407 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,6626407);
create index idx_bloom on nhieucot_6626407 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_6626407 where c1 = 927541266 and c2 = 2782623798 and c3 = 132505895;
SELECT pg_size_pretty( pg_relation_size('nhieucot_6626407'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_6626407'));
drop index idx_bloom;
drop table nhieucot_6626407;
