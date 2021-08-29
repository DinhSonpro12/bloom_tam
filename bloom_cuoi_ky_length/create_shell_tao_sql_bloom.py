import sys
loai = 'length'

filename = 'file_shell_tao_sql_bloom/' + loai + '_bloom.sh' 
with open(filename,'w') as f:
    for i in range(1,39):
        length = int(4*1.2**i)
        tablename = loai + '_'+ str(length)
        f.writelines(f'python3 write_file_sql_bloom.py  {str(length)}')
        f.writelines(f'\n')


    