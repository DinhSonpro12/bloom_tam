import sys
loai = 'thread'
sohang = 10000000
filename = 'file_shell_execute_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(0,30):
        num_thread = 2*i
        tablename = loai + '_'+ str(num_thread)
        f.writelines(f'psql bloom < file_sql_bloom/{loai}_{num_thread}.sql > time_result_btree/{tablename}.txt | bash measure_ram.sh {num_thread}')
        f.writelines(f'\n')


    