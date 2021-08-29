create table nhieucot_259374 (c1 int,c2 int,c3 int);
\timing 
insert into nhieucot_259374 select random()*1000000000,random()*1000000000,random()*1000000000 from generate_series(1,259374);
create index idx_bloom on nhieucot_259374 using bloom (c1,c2,c3);
explain (analyze,verbose,timing,costs,buffers) select * from nhieucot_259374 where c1 = 808739345 and c2 = 2426218035 and c3 = 115534192;
SELECT pg_size_pretty( pg_relation_size('nhieucot_259374'));
SELECT pg_size_pretty( pg_indexes_size('nhieucot_259374'));
drop index idx_bloom;
drop table nhieucot_259374;
