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
