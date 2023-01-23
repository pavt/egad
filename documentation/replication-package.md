# EGAD - Replication Package Data and Tool Showcase Track MSR 2023

### 1 Load the tool and the Lepiter database into GT

Load EGAD project into GT:
```
Metacello new
	baseline: 'Egad';
	repository: 'github://pavt/egad:main/src';
	load
```

Load the Lepiter database:
```
BaselineOfEgad loadLepiter
```

### 2 Make sure you have the data in your local drive disk

- The dataset consist of 52 software repositories: see file-to-create.csv file.
- Use the script.file script to clone all the repos into your local *repositories* directory. Otherwise you must to clone all the repos one per one.
- Make sure the *repositories* directory is at the same path? than your GT image. See the image.file as a example.

For example:
´´´
./your-path/gt-image/
./your-path/repositories/
´´´

- Once you download all the 52 repositories, the narrative is ready to be inspected.

### 3 Acces to the Sticky Commits narrative

-  Access to the narrative which is in the Lepiter database. See image.file for example.

### 4 Code execution
- At this point all you have to do is inspect the code snippets of the narrative.
- See for example, image.file.
