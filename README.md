#Dspacescripts (how to use and work with them)

##Git and the workflow

###Preamble and Dependencies

We have now moved to using git as a way to version control scripts used for working with DSpace. If you don't know how to use git, [this is a decent introduction][1]. And [our repository for the scripts is hosted on Github][2], see [here for a general introduction][3]. Git and github are _not_ the same thing.

To work with all of this, you will need to [make an account at Github][4]. You will also need to [install Git on your local computer][5]. Once you've done this (and [sorted out the ssh key situation][6] -- which isn't strictly necessary but is useful), you're ready to begin.

(Note: since Git for Windows includes the Git Bash tool, which gives you a basic bash emulator with most of the linux commands you'll need, this should be all you need, in addition to the GUI, if that's what you prefer. This should also give you an appropriate testing area for these scripts, since you'll be able to run them within this program (they are bash scripts).)

###Setting up your local environment

The key with this workflow is that any changes you make to the scripts should happen on your local computer. **Do not edit the files directly on the Yorkspace server**.

####1) Cloning the repo to your local computer

Open up a bash shell (the terminal.app on Macs or Git Bash on Windows) and navigate to which ever directory you want the files to live. This is entirely up to you.

Once in the desired directory, you can clone the repo by entering in this command:

    git clone git@github.com:yorkulibraries/dspacescripts.git

This should create a directory called 'dspacescripts' in your current directory. Once finished, change to that directory.

**Note: in order to push to this repository, you should have organizational access to the shared YorkU Libraries org on Github. Create a redmine ticket for Nick Ruest if you need access.**

####2) Don't have write access to the YorkU libraries account?

Instead of the above, fork the repository to your own github account, and clone that instead.

You'll be able to clone it using a command like this:

    git clone git@github.com:[username]/dspacescripts.git

After this, follow the regular git workflow (commits, pushes, etc). Once you've finished your changes and pushed them to your repo, you can make a pull request to the YorkU Libraries repo. One of the people with access will have to look over your changes and commit them before you can try them on the Yorkspace server.

###Actually using Git and deploying the code.

####1) Making your changes live on the server.

Since this isn't a general introduction on how to use git, please [refer to this introduction for more usage info][1].

After you've done what you needed to do locally and pushed the changes to the main YorkU Libraries repo, log into the yorkspace server.

Once there, you'll find one directory in the dspace user's home called 'dspacescripts' and a different one in the /dspaces/uploads directory. Both of these directories can pull changes from the github repo.

Once you've navigated to the directories, the first thing you should always do is enter this command:

    git pull

This will ensure that any and all changes made to the master repo are made to the directories on the server (i.e., that all your changes are written to your current directory).

**Do not edit any of the files on the server. The server does not have push access to the github repo. Always and only make changes locally and then push them to the main repo, then pull them to the server. This is set up this way on purpose to ensure that the master repo on github is always the most up-to-date code.**

####2) How the dspacescripts repo is organized.

For the sake of making the directory a little cleaner, all the individual scripts for different mimetypes have been moved to their respective directory.

However, since many of the mimetypes will share a script (best example is /shared\_scripts/final\_clean.sh). Rather than an individual copy of these shared scripts living in each directory, they are hosted in the shared\_scripts/ directory and each mimetype directory has a symlink to the script in the shared directory. This means that if you edit /shared\_scripts/final\_clean.sh, these changes will be replicated to everywhere there is a symlink.

Some of the mimetype directories have their own run.sh script, that has been customized in some fashion. Other use a shared one. As above, the shared one is in the shared\_scripts directory with a symlink to the individual one. If you need to edit or customize the run.sh script for a particular mimetype, as is the case for create\_dc\_rs/run\_rs.sh, delete the symlink and copy shared\_scripts/run.sh to the respective directory. This way, you won't make global changes that will likely break the script for other mimetypes.

(Note: the scripts have all been edited to refer to the right directory to run properly re: the xml and xlst files, as well as xalan-j\_2\_7\_1/. If you move stuff around, you'll have to update the paths in the respective scripts. Also, if you get an error saying that a file is missing, it mostly likely means that the path to the file is wrong in the script, so check there first and check the directory where it ought to be, then update the path.)

####3) The derivatives issue

Git has a feature that allows you to instruct it to ignore certain files within the repo, so that these are not controlled by version control.

The list of excluded files is in the .gitignore file. The one for dspacescripts currently has this:

```
/*.jpg
/*/*.jpg
/*.pdf
/*/*.pdf
/*.csv
/*/*.csv
/*/record.*/
/record.*
```

The first six mean that any files with the mimetypes: jpg, pdf, or csv will be excluded and not tracked by git. This is mainly because when creating the uploads, we don't actually need to version control the objects being ingested. We only want to keep track of the code we need to create the uploads -- not the uploads themselves. 

Thus, the last two lines exclude the output of the scripts, which are typically directories with the object and metadata all named 'record.[sequential number]'. All of these directories will not be tracked by git and should have no effect on your use of git.

What this means is that you can have as many of these types of files in your local repo and none of them will be pushed to the master on github.

Whenever a new mimetype is added to this, the .gitignore file should be updated to exclude the objects. [See the documentation for more information.][7]

####4) Testing changes

Ideally, any code changes ought to be tested on your local machine.

##Troubleshooting

1. you may get a permissions error if your Metadata.xml file is not called that exactly!
2. must be logged in as dspace user to run scripts

##For Theses

Order of Scripts to run:

1. ./run_etddc.sh
2. ./create_etddc.sh
3. ./final_clean.sh

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

[1]: http://blog.scottlowe.org/2015/01/14/non-programmer-git-intro/
[2]: https://github.com/yorkulibraries/dspacescripts
[3]: http://readwrite.com/2013/09/30/understanding-github-a-journey-for-beginners-part-1
[4]: https://github.com/join
[5]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[6]: https://help.github.com/articles/generating-ssh-keys/
[7]: https://git-scm.com/docs/gitignore
