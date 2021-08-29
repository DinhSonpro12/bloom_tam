import sys
loai = 'max_value'
sohang = 10000000
filename = 'file_shell_execute_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(15,31):
        max_value = 2**i
        tablename = loai + '_'+ str(max_value)
        # for i in range(1000):
        f.writelines(f'psql bloom < file_sql_bloom/{loai}_{max_value}.sql > time_result_btree/{tablename}.txt | bash measure_ram.sh {max_value}')
        f.writelines(f'\n')


    