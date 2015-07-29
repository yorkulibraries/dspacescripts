Troubleshooting
(1) you may get a permissions error if your Metadata.xml file is not called that exactly!
(2) must be logged in as dspace user to run scripts

For Theses *************************************

Order of Scripts to run:

./run_etddc.sh
./create_etddc.sh (make sure that convenrt_access_etddc.xsl is around as well)
./final_clean.sh

Note1: if you're running from windows, you'll need to ensure you grant permissions over the files you're going to process...

Note2: you'll also need to change the path for xalan.jar to whatever directory you're working from.
(specifically, I had to add this... -cp xalan-j_2_7_1/xalan.jar)

Note3: these files have been specially tweaked to work with ETDMS and PDFs 

Go to the dspace (or darkspace directory)
put the files in the upload directory (mapfile will end up in root)

Type the following command:

dsrun org.dspace.app.itemimport.ItemImport -a -e akosavic@yorku.ca -c 123456789/25 -s upload/theses -m mapfile



For .JPG Image Processing *****************************

Order of Scripts to run:

. run.sh
. create_dc.sh
. final_clean.sh

Note: make sure that your metadata file is called Metadata.xml
Make sure your image files are listed in ALL CAPS.

For .PDF Image Processing *****************************

Order of Scripts to run:

. run.sh
. create_dc_pdf.sh
. final_clean.sh

Note: make sure that your metadata file is called Metadata.xml
Make sure your image files are listed in ALL CAPS.

**********************************************

To create the Metadata.xml file:

Create a copy and edit Access database to ensure that fields are proprely formatted.
Make sure that the researcher field is deleted, check date fields.
Rename table to be exported as Metadata.
Export table as XML file, rename file as Metadata.xml

To insert repeating elements:

The stylesheet and script assume that the files are named Metadata.xml and RepeatingElements.xml
To run the script, in a terminal, enter the command:
. run_repeat_elements.sh

The resulting file is named Metadata2.xml.