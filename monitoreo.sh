output="reporte_monitoreo.txt"
echo "Tiempo %CPU Libre %Memoria Libre %Disco Libre" > $output

for ((i=60; i<=300; i+=60)); do
    cpu_free=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $2}')
    mem_free=$(free -h | grep "Mem" | awk '{print $4/$2 * 100.0}')
    disk_free=$(df -h | grep "/dev/sda1" | awk '{print $5}' | sed 's/%//g')
    echo "$i $cpu_free $mem_free $disk_free" >> $output
    sleep 60
done
