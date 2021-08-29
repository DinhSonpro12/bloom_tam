import re
url = '/media/thanh/DATA/bloom-cuoi-ky/bloom_cuoi_ky_max_value/time_result_bloom/max_value_4194304.txt'
with open (url,'r') as f:
    all_text = f.readlines()
    all_text = [x.replace(",",".") for x in all_text]     
    all_text = "".join(all_text)   


    time_index = re.search("CREATE INDEX\nTime: (.*?) ms", all_text)

    if time_index != None:
        time_index = time_index.group(1)
    else:
        time_index = 0
                    
    size = re.findall("-----------\n (.*?)B", all_text)
    table_size = size[0]
    if table_size is not None and table_size != "":
        if table_size[-1] == 'k':
            table_size = float(table_size[:-2])/1000
        elif table_size[-1] == 'G':
            table_size = float(table_size[:-2])*1000
        else:
            table_size = float(table_size[:-2])
    else: table_size = 0

    index_size = size[1]
    if index_size is not None and index_size != "":
        if index_size[-1] == 'k':
            index_size = float(index_size[:-2])/1000
        elif index_size[-1] == 'G':
            index_size = float(index_size[:-2])*1000
        else:
            index_size = float(index_size[:-2])
    else: index_size = 0

    time_queries = re.findall("Execution Time: (.*?) ms", all_text)
    time_query = 0
    for i in range(30):
        # print(time_queries[i])
        time_query += float(time_queries[i])
    csv = str(time_index)+","+str(time_query)+","+str(table_size)+","+str(index_size)


    with open('wwwww.txt','a') as r:
        r.writelines(csv)
        r.writelines('\n')