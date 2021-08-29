import sys
loai = 'nhieucot'

filename = 'file_shell_tao_sql_bloom/' + loai + '_bloom.sh' 
with open(filename,'w') as f:
    for i in range(1,50):
        sohang = int(100000*1.1**i)
        tablename = loai + '_'+ str(sohang)
        f.writelines(f'python3 write_file_sql_bloom.py  {sohang}')
        f.writelines(f'\n')


    