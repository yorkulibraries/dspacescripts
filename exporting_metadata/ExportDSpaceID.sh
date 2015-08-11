#Test to export range of metadata from handles
cd /dspace/bin
echo "First handle in series :"
read first
echo "Last handle in series :"
read last
#This exports the metadata of the required sequence from DSpace
for (( i = $first ; i <= $last ; i++ )) 
do 
./dspace metadata-export -f /dspace/upload/dspacescripts/$i.csv -i 10315/$i
done
#This processes the single records and extracts the DSpace ID for each handle, the output is a single csv.
echo "Name of new file :"
read filename
cd /dspace/upload/dspacescripts
for (( i = $first ; i <= $last ; i++ ))
do
awk -F"," 'NR!=1{print $1}' $i.csv >> $filename.csv
done
