for i in record*;
do
java -cp ../xalan-j_2_7_1/xalan.jar org.apache.xalan.xslt.Process -in $i/Metadata.xml -xsl ../xslt/convert_access_dc_fes-mp.xsl -out $i/dublin_core.xml;
fil=`grep "<identifier>" $i/Metadata.xml|sed 's/<identifier>//'|sed 's/<\/identifier>//'`
fil2=$fil."pdf"
echo $fil2 > $i/contents
echo $i
mv $fil2* $i
done

