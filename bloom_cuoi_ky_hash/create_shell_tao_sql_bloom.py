import sys
loai = 'hash'

filename = 'file_shell_tao_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(1,15):
        hash = i
        tablename = loai + '_'+ str(hash)
        f.writelines(f'python3 write_file_sql_bloom.py  {str(hash)}')
        f.writelines(f'\n')


    