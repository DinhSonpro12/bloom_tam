from random import random
import sys
loai = 'thread'
sohang = 10000000
num_thread = sys.argv[1]
filename = 'file_sql_bloom/' + loai + '_'+str(num_thread) + '.sql'
tablename = loai + '_'+ num_thread
with open(filename,'w') as f:
    f.writelines(f'SET max_parallel_workers_per_gather = {num_thread};')
    f.writelines(f'create table {tablename} (c1 int);')
    f.writelines('\n')
    f.writelines(f'\\timing ')
    f.writelines('\n')
    f.writelines(f'insert into {tablename} select random()*1000000000 from generate_series(1,{str(sohang)});')
    f.writelines('\n')
    from random import randrange
    random_number = randrange(int(1000000000))
    f.writelines(f'explain (analyze,verbose,timing,costs,buffers) select * from {tablename} where c1 = {random_number};')
    f.writelines('\n')
    f.writelines(f'create index idx_btree on {tablename} (c1);')
    f.writelines('\n')
    f.writelines(f'SELECT pg_size_pretty( pg_relation_size(\'{tablename}\'));')
    f.writelines('\n')
    f.writelines(f'SELECT pg_size_pretty( pg_indexes_size(\'{tablename}\'));')
    f.writelines('\n')
    f.writelines(f'drop index idx_btree;')
    f.writelines('\n')
    f.writelines(f'drop table {tablename};')
    f.writelines('\n')
