import sys
loai = 'thread'

filename = 'file_shell_tao_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(0,30):
        length = 2*i
        tablename = loai + '_'+ str(length)
        f.writelines(f'python3 write_file_sql_bloom.py  {str(length)}')
        f.writelines(f'\n')


    