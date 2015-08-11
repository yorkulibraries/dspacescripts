#upload metadata
cd /dspace/bin
for (( i = 1 ; i <= 181 ; i++ )) 
do 
./dspace metadata-import -f /dspace/upload/A1/j$i.csv 
done

