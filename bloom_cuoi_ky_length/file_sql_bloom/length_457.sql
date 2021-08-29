create table length_457 (c1 int);
\timing 
insert into length_457 select random()*1000000000 from generate_series(1,10000000);
create index idx_bloom on length_457 using bloom (c1) WITH (length=457);
explain (analyze,verbose,timing,costs,buffers) select * from length_457 where c1 = 125739676;
SELECT pg_size_pretty( pg_relation_size('length_457'));
SELECT pg_size_pretty( pg_indexes_size('length_457'));
drop index idx_bloom;
drop table length_457;
