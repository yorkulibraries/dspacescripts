#Test to export range of metadata from handles
cd /dspace/bin
echo "First handle in series :"
read first
echo "Last handle in series :"
read last
for (( i = $first ; i <= $last ; i++ )) 
do 
./dspace metadata-export -f /dspace/upload/dspacescripts/$i.csv -i 10315/$i
done
echo "Name of new file :"
read filename
cd /dspace/upload/dspacescripts
for (( i = $first ; i <= $last ; i++ ))
do
awk 'NR!=1' $i.csv >> $filename.csv
done
