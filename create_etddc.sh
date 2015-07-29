for i in record*;
do
java -cp xalan-j_2_7_1/xalan.jar org.apache.xalan.xslt.Process -in $i/metadata.xml -xsl convert_access_etddc.xsl -out $i/dublin_core.xml;
fil=`grep "<identifier_other>" $i/metadata.xml|sed 's/<identifier_other>//'|sed 's/<\/identifier_other>//'`
fil2=$fil."pdf"
echo $fil2
echo $fil2 > $i/contents
echo $i
mv $fil2* $i
done

