import pandas as pd
from datetime import datetime
import matplotlib.pyplot as plt

from matplotlib.pyplot import figure

# figure(figsize=(8, 6), dpi=80)
# plot
def plot_data(file_name,app_end,num_of_record):
    plt.figure(figsize=(15,10))
    df = pd.read_csv(f'{file_name}.csv',names=None)
    if app_end == 'column' or app_end == 'hash':
        x = [i for i in range(num_of_record)]
    elif app_end == 'thread':
        x = [2*i for i in range(num_of_record)]
    elif app_end == 'length':
        x = [int(4*1.2**i) for i in range(num_of_record)]
    elif app_end == '_value':
        x = [int(2**i) for i in range(num_of_record)]
    else:
        x = [int(100000*(1.1**i)) for i in range(num_of_record)]
    # print(x)
    y = df['time_index (s)']
    if 'cot' in file_name:
        changer = 'row'
    else:
        changer = app_end
    plt.suptitle(f'Analayse {file_name}\'s adjustment when number of {changer} was changed', fontsize=14)
    plt.subplot(2, 2, 1)
    plt.xlabel(f'num of {changer}')
    plt.ylabel('time_index (s)')
    # plt.gca().set_title(f'plot time_index (s) when number of {app_end} was changed')
    plt.plot(x, y)
    

    y = df['time_query (s)']
    plt.subplot(2, 2, 2)
    plt.xlabel(f'num of {changer}')
    plt.ylabel('time_query (s)')
    # plt.gca().set_title(f'plot time_query (s) when number of {app_end} was changed')
    plt.plot(x, y)


    y = df['table_size (MB)']
    plt.subplot(2, 2, 3)
    plt.xlabel(f'num of {changer}')
    plt.ylabel('table_size (MB)')
    # plt.gca().set_title(f'plot table_size (MB when number of {app_end} was changed')
    plt.plot(x, y)


    y = df['index_size (MB)']
    plt.subplot(2, 2, 4)
    plt.xlabel(f'num of {changer}')
    plt.ylabel('index_size (MB)')
    # plt.gca().set_title(f'plot index_size (MB) when number of {app_end} was changed')
    plt.plot(x, y)


    plt.subplots_adjust(hspace = .5)
    plt.show()


def plot_compare_data(app_end,num_of_record):
    plt.figure(figsize=(15,10))
    df1 = pd.read_csv(f'bloom_{app_end}.csv',names=None)
    df2 = pd.read_csv(f'btree_{app_end}.csv',names=None)

    if app_end == 'column' or app_end == 'hash':
        x = [i for i in range(num_of_record)]
    elif app_end == 'thread':
        x = [2*i for i in range(num_of_record)]
    elif app_end == 'length':
        x = [int(4*1.2**i) for i in range(num_of_record)]
    elif app_end == 'max_value':
        x = [int(log2(2**i)) for i in range(num_of_record)]
    else:
        x = [int(100000*(1.1**i)) for i in range(num_of_record)]
    # print(x)
        # y = df['time_index (s)']
    if 'cot' in app_end:
        changer = app_end
    else:
        changer = app_end

    y1 = df1['time_index (s)']
    y2 = df2['time_index (s)']
    plt.suptitle(f'compare when number of {changer} was changed', fontsize=14)
    plt.subplot(2, 2, 1)
    plt.xlabel(f'num of {changer}')
    plt.ylabel('time_index (s)')
    plt.plot(x, y1, label = "bloom")
    plt.plot(x, y2, label = "btree")
    

    y1 = df1['time_query (s)']
    y2 = df2['time_query (s)']
    plt.subplot(2, 2, 2)
    plt.xlabel(f'num of {changer}')
    plt.ylabel('time_query (s)')
    plt.plot(x, y1, label = "bloom")
    plt.plot(x, y2, label = "btree")


    y1 = df1['table_size (MB)']
    y2 = df2['table_size (MB)']
    plt.subplot(2, 2, 3)
    plt.xlabel(f'num of {changer}')
    plt.ylabel('table_size (MB)')
    plt.plot(x, y1, label = "bloom")
    plt.plot(x, y2, label = "btree")


    y1 = df1['index_size (MB)']
    y2 = df2['index_size (MB)']
    plt.subplot(2, 2, 4)
    plt.xlabel(f'num of {changer}')
    plt.ylabel('index_size (MB)')
    plt.plot(x, y1, label = "bloom")
    plt.plot(x, y2, label = "btree")


    plt.subplots_adjust(hspace = .5)
    plt.show()


app_ends = ['motcot','nhieucot','nhieucot_q1','thread','max_value','column']
starts = [1,1,1,0,15,1]
ends = [50,50,50,30,31,32]
for j in range(0,6):
    start = starts[j]
    end = ends[j]
    num_of_record = ends[j] - starts[j]
    plot_compare_data(app_ends[j],num_of_record)


app_ends = ['hash','length']
type = 'bloom'
starts = [1,1]
ends = [15,39]
for i in range(0,2):
    file_name = type +"_"+ app_ends[i] 
    start = starts[i]
    end = ends[i]
    num_of_record = ends[i] - starts[i]
    plot_data(file_name,app_ends[i],num_of_record)
