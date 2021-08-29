import sys
loai = 'column'

filename = 'file_shell_tao_sql_bloom/' + loai + '.sh' 
with open(filename,'w') as f:
    for i in range(1,32):
        column = i
        tablename = loai + '_'+ str(column)
        f.writelines(f'python3 write_file_sql_bloom.py  {str(column)}')
        f.writelines(f'\n')


    