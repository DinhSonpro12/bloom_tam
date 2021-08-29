import re
step = 0
def load_data(file_path,app_end,type,start,end):

    # print(file_path + app_end)
    
    header = 'time_index (s),time_query (s),table_size (MB),index_size (MB)'

    with open(f'{type}_{app_end}.csv', 'a') as fin:
        fin.writelines(header+'\n')
    
    for i in range(start,end):
        if app_end == 'column' or app_end == 'hash':
            num_hash = i
        elif app_end == 'thread':
            num_hash = 2*i
        elif app_end == 'length':
            num_hash = int(4*1.2**i)
        elif app_end == 'max_value':
            num_hash = 2**i
        else:
            num_hash = int(100000*1.1**i)
        name_file = f'{app_end}_{num_hash}.txt'
        with open(file_path + name_file, 'r') as f:
            # print(file_path + name_file)
            all_text = f.readlines()
            all_text = [x.replace(",",".") for x in all_text]     
            all_text = "".join(all_text)

            # with open(f'all_text.csv', 'a') as fin:
            #     fin.writelines(all_text+'\n')
            # print(all_text)
            time_index = re.search("CREATE INDEX\nTime: (.*?) ms", all_text)
            if time_index is not None:
                time_index = time_index.group(1)
            else: time_index = 0
                            
            size = re.findall(" pg_size_pretty \n----------------\n (.*?)B", all_text)



            # print(size[0])
            # print(size[1])


            table_size = size[0]
            # print(table_size)
            if table_size[-1] == 'k':
                table_size = float(table_size[:-2])/1000
            elif table_size[-1] == 'G':
                table_size = float(table_size[:-2])*1000
            else:
                table_size = float(table_size[:-2])
            if len(size) > 1:
                index_size = size[1]
                if index_size[-1] == 'k':
                    index_size = float(index_size[:-2])/1000
                elif index_size[-1] == 'G':
                    index_size = float(index_size[:-2])*1000
                else:
                    index_size = float(index_size[:-2])
            else: index_size = 0
            
            
            # if len(table_size) == 0:
            #     table_size = 0
            

            


            time_queries = re.findall("Execution Time: (.*?) ms", all_text)
            # print(time_queries)
            time_query = 0
            for i in range(1):
                # print(time_queries[i])
                time_query += float(time_queries[i])
            
            csv = str(time_index)+","+str(time_query)+","+str(table_size)+","+str(index_size)
            if type == 'bloom':
                print(file_path + name_file)
                
                # print(csv)
            with open(f'{type}_{app_end}.csv', 'a') as fin:
                fin.writelines(csv+'\n')

# bloom_cuoi_ky_column/time_result_bloom

# load_data('btree_cuoi_ky_motcot/time_result_btree/','motcot','btree',1,50)


app_ends = ['column','motcot','nhieucot','nhieucot_q1','thread','max_value']
# types = ['motcot','nhieucot','nhieucot_q1','thread','max_value']
starts = [1,1,1,1,0,15]
ends = [32,50,50,50,30,31]
for i in range(0,6):
    file_path = f'bloom_cuoi_ky_{app_ends[i]}/time_result_bloom/'
    type = 'bloom'
    start = starts[i]
    end = ends[i]
    load_data(file_path,app_ends[i],type,start,end)

for i in range(0,6):
    file_path = f'btree_cuoi_ky_{app_ends[i]}/time_result_btree/'
    type = 'btree'
    start = starts[i]
    end = ends[i]
    load_data(file_path,app_ends[i],type,start,end)

 
app_ends = ['hash','length']
# types = ['column','hash','length']
starts = [1,1]
ends = [15,39]
for i in range(0,2):
    file_path = f'bloom_cuoi_ky_{app_ends[i]}/time_result_bloom/'
    app_end = app_ends[i]
    # type = types[i]
    start = starts[i]
    end = ends[i]
    load_data(file_path,app_end,'bloom',start,end)