import sys
loai = 'max_value'

filename = 'file_shell_tao_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(15,31):
        max_value = 2**i
        tablename = loai + '_'+ str(max_value)
        f.writelines(f'python3 write_file_sql_bloom.py  {str(max_value)}')
        f.writelines(f'\n')


    