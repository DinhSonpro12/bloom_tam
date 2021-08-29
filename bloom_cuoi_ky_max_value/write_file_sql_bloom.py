import sys
from random import randrange
loai = 'max_value'
sohang = 10000000
max_value = sys.argv[1]
filename = 'file_sql_bloom/' + loai + '_'+str(max_value) + '.sql'
tablename = loai + '_'+ max_value
with open(filename,'w') as f:
    f.writelines(f'create table {tablename} (c1 int);')
    f.writelines('\n')
    f.writelines(f'\\timing ')
    f.writelines('\n')
    f.writelines(f'insert into {tablename} select random()*{max_value} from generate_series(1,{str(sohang)});')
    f.writelines('\n')
    f.writelines(f'create index idx_bloom on {tablename} using bloom (c1);')
    f.writelines('\n')
    random_number = randrange(int(max_value))
    f.writelines(f'explain (analyze,verbose,timing,costs,buffers) select * from {tablename} where c1 = {random_number};')
    f.writelines('\n')
    f.writelines(f'SELECT pg_size_pretty( pg_relation_size(\'{tablename}\'));')
    f.writelines('\n')
    f.writelines(f'SELECT pg_size_pretty( pg_indexes_size(\'{tablename}\'));')
    f.writelines('\n')
    f.writelines(f'drop index idx_bloom;')
    f.writelines('\n')
    f.writelines(f'drop table {tablename};')
    f.writelines('\n')
