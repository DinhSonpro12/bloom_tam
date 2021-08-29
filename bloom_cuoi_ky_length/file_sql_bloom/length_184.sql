create table length_184 (c1 int);
\timing 
insert into length_184 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_184 using bloom (c1) WITH (length=184);
explain (analyze,verbose,timing,costs,buffers) select * from length_184 where c1 = 213715194;
SELECT pg_size_pretty( pg_relation_size('length_184'));
SELECT pg_size_pretty( pg_indexes_size('length_184'));
drop index idx_bloom;
drop table length_184;
