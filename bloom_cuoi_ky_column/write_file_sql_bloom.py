import sys
loai = 'column'
sohang = 1000000
hash = '2'
num_col = sys.argv[1]
num_col = int(num_col)
filename = 'file_sql_bloom/' + loai + '_'+str(num_col) + '.sql'
tablename = loai + '_'+ str(num_col)

def get_string_column(num_col):
    str_column = ""
    for i in range(num_col):
        str_column += f"col{i+1} = {hash},"
    str_column = str_column[:-1]
    return str_column


def get_string_column_queries(num_col):
    str_column = ""
    for i in range(num_col):
        str_column += f"c{i+1} = 457946 AND "
        # c1 = 457946
    str_column = str_column[:-4]
    # print(str_column)
    return str_column

def get_string_column_define_table(num_col):
    str_column = ""
    for i in range(num_col):
        str_column += f"c{i+1} int,"
    str_column = str_column[:-1]
    return str_column

def get_string_column_define_index(num_col):
    str_column = ""
    for i in range(num_col):
        str_column += f"c{i+1},"
    str_column = str_column[:-1]
    return str_column



with open(filename,'w') as f:
    str_column_define_table = get_string_column_define_table(num_col)
    f.writelines(f'create table {tablename} ({str_column_define_table});')
    f.writelines('\n')
    f.writelines(f'\\timing ')
    f.writelines('\n')
    f.writelines(f'insert into {tablename} select random()*1000000000 from generate_series(1,{str(sohang)});')
    f.writelines('\n')
    str_column = get_string_column(num_col)
    str_column_define_index = get_string_column_define_index(num_col)
    f.writelines(f'create index idx_bloom on {tablename} using bloom ({str_column_define_index}) WITH ({str_column});')
    f.writelines('\n')
    from random import randrange
    random_number = randrange(int(1000000000))
    f.writelines(f'explain (analyze,verbose,timing,costs,buffers) select * from {tablename} where {get_string_column_queries(num_col)};')
    f.writelines('\n')
    f.writelines(f'SELECT pg_size_pretty( pg_relation_size(\'{tablename}\'));')
    f.writelines('\n')
    f.writelines(f'SELECT pg_size_pretty( pg_indexes_size(\'{tablename}\'));')
    f.writelines('\n')
    f.writelines(f'drop index idx_bloom;')
    f.writelines('\n')
    f.writelines(f'drop table {tablename};')
    f.writelines('\n')
    