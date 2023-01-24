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

### 2 Dataset

#### 2.1 Repositories selection criteria

We consider targeted GitHub repositories that: 
- currently use GA (GutHub ACtions) and contain at least one workflow file in the *.github/workflow* directory
- have been created  after *2019-01-11* (GA official release date)  and before *2022-12-14*
- have at least ten stars and at least five hundred commits
- do not have forks

We used the [GitHub Search tool](https://seart-ghs.si.usi.ch/) to select repositories meeting these criteria. 
We cloned all the identified repositories on *2022-12-14*. 

- For a full list of repositories, see the [repositories.csv](https://github.com/pavt/egad/blob/main/dataset/repositories.csv) file.

- In our narrative we consider just the first 50 software repositories of the [repositories.csv](https://github.com/pavt/egad/blob/main/dataset/repositories.csv) file, excluding no-software repositories, listed in descending order according to the number of starts.The 50 selected respositories are filtered and listed in the [repositories-50.csv](https://github.com/pavt/egad/blob/main/dataset/repositories-50.csv) file.

- The [5-repositories.zip](LINK)(~18 MB) file, contains the 5 smallest cloned repositories selected from the [repositories-50.csv](https://github.com/pavt/egad/blob/main/dataset/repositories-50.csv) file.

#### 2.2 Dataset

There are two alternatives to run the tool:

1.- Use 

- Use the *script.file* script to clone all the repos into your local *repositories* directory. Alternative, you can clone all the repos one by one.

- Make sure the *repositories* directory is in the same parent folder as your GT image.
```
./your-path/gt-image/
./your-path/repositories/
```
- Once you download all the 50 repositories, the narrative is ready to be inspected.

### 3 Access to the Sticky Commits narrative

-  Access to the narrative which is in the Lepiter database. See image.file for example.

### 4 Code execution
- At this point all you have to do is inspect the code snippets of the narrative.
- See for example, image.file.
