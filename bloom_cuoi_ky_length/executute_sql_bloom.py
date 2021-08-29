import sys
loai = 'length'
sohang = 10000000
filename = 'file_shell_execute_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(1,39):
        length = int(4*1.2**i)
        tablename = loai + '_'+ str(length)
        f.writelines(f'psql bloom < file_sql_bloom/{loai}_{length}.sql > time_result_bloom/{tablename}.txt | bash measure_ram.sh {length}')
        f.writelines(f'\n')


    