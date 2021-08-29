import sys
loai = 'hash'
sohang = 1000000
filename = 'file_shell_execute_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(1,15):
        hash = i
        tablename = loai + '_'+ str(hash)
        f.writelines(f'psql bloom < file_sql_bloom/{loai}_{hash}.sql > time_result_bloom/{tablename}.txt | bash measure_ram.sh {hash}')
        f.writelines(f'\n')


    