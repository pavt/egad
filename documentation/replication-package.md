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

#### 2.1 Dataset

- For a full list of repositories, see the [repositories.csv](https://github.com/pavt/egad/blob/main/dataset/repositories.csv) file.

- In our narrative we consider just the first 50 software repositories of the [repositories.csv](https://github.com/pavt/egad/blob/main/dataset/repositories.csv) file, excluding no-software repositories, listed in descending order according to the number of starts. 

- The 50 selected respositories are filtered and listed in the [repositories-50.csv](https://github.com/pavt/egad/blob/main/dataset/repositories-50.csv) file.

#### 2.2 Replication datasets

There are two alternatives to run the tool:

##### 2.2.1 Minimal replication

- Use the [6-repositories.zip](https://github.com/pavt/egad/blob/main/dataset/6-repositories.zip) file (~63 MB), to get all the repos into your local *repositories* directory.

##### 2.2.2 Full replication

- Use the [script](https://github.com/pavt/egad/blob/main/dataset/script/clone_all.sh) and [repos.txt](https://github.com/pavt/egad/blob/main/dataset/script/repos.txt) files to clone all the repos into your local *repositories* directory.

##### 2.2.3 Warning

- In both cases, make sure the *repositories* directory is in the same parent folder as your GT image.
```
./your-path/gt-image/
./your-path/repositories/
```
- be sure the *repositories* directory does not contains plain files (e.g., *.DS_Store*)

### 3 Access to the Sticky Commits narrative

-  Please follow the [following instructions](https://github.com/pavt/egad/blob/main/documentation/gt-instructions.md).
