import sys
loai = 'column'
sohang = 1000000
filename = 'file_shell_execute_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(1,32):
        column = i
        tablename = loai + '_'+ str(column)
        f.writelines(f'psql bloom < file_sql_bloom/{loai}_{column}.sql > time_result_btree/{tablename}.txt | bash measure_ram.sh {column}')
        f.writelines(f'\n')


    