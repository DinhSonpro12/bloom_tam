so_luong_hang=$1

# psql bloom < nhieucot_2097152.sql

mkdir -p "ram_result_bloom"
result_ram='ram_result/ram_test'$so_luong_hang'.txt'

echo "%MEM   RSS  SIZE    VSZ" >>$result_ram

# find the process id of COMMAND
PID=$(pgrep "psql")

# while process id of COMMAND still existing
while [ $(pgrep "psql") ]; do
	# get pmen, rss, size and vsize info and push to sensor.txt
	ps --pid $PID --format pmem,rss,size,vsize --no-headers >>"$result_ram" 
done
echo "finish measuring ram"
exit 0