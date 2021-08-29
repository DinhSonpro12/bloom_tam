import sys
loai = 'nhieucot_q1'
index = 'bloom'
filename = 'file_shell_execute_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(1,50):
        sohang = int(100000*1.1**i)
        tablename = loai + '_'+ str(sohang)
        f.writelines(f'psql bloom < file_sql_bloom/{loai}_{sohang}.sql > time_result_bloom/{tablename}.txt | bash measure_ram.sh {sohang}')
        f.writelines(f'\n')


    