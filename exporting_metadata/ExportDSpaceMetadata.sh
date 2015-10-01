#!/bin/bash

#Test to export range of metadata from handles
cd /dspace/bin

read -p "First handle in series :" first
read -p "Last handle in series: " final

for (( i = $first ; i <= $final ; i++ )) 
do 
    ./dspace metadata-export -f /dspace/upload/dspacescripts/$i.csv -i 10315/$i
done

read -p "Name of new file: " filename

cd /dspace/upload/dspacescripts

for (( i = $first ; i <= $final ; i++ ))
do
    awk 'NR!=1' $i.csv >> $filename.csv
done

#The MIT License (MIT)

#Copyright (c) 2013 nina de jesus

#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
