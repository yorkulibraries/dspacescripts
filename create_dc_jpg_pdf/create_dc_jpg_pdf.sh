for i in record*;
do
java -cp ../xalan-j_2_7_1/xalan.jar org.apache.xalan.xslt.Process -in $i/metadata.xml -xsl ../xslt/convert_access_dc.xsl -out $i/dublin_core.xml;
fil=`grep "<identifier>" $i/metadata.xml|sed 's/<identifier>//'|sed 's/<\/identifier>//'`
fil1=`grep "<type>" $i/metadata.xml|sed 's/<type>//'|sed 's/<\/type>//'`
if [ "$fil1" == "Document" ] || [ "$fil1" == "Image" ]; then
    fil2=$fil."pdf"
else
    fil2=$fil."jpg"
fi
echo $fil2
echo $fil2 > $i/contents
echo $i
mv $fil2* $i
done

#The MIT License (MIT)

#Copyright (c) 2015 Gabriela Mircea

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.
