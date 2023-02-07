# EGAD - Replication Package Data and Tool Showcase Track MSR 2023

### 1 Load the tool and the Lepiter database into GT

Download GT (Glamorous Toolkit) for your OS from [gtoolkit.com](https://gtoolkit.com).
Start GlamorousToolkit app and open a Playground (top left button).

Copy-paste the following code snippet into the Playground, and evaluate it by clicking on the *Evaluate* button (black triangle).
(This may take up to a minute.)

```
Metacello new
	baseline: 'Egad';
	repository: 'github://pavt/egad:main/src';
	load.
(Smalltalk at: #BaselineOfEgad) loadLepiter.
```

Then close the Playground tab (x in the tab), and open [*“Get started with EGAD”*](https://github.com/pavt/egad/blob/main/images/started.png).

### 2 Dataset

#### 2.1 Repositories selection criteria

We consider targeted GitHub repositories that: 
- currently use GA (GutHub ACtions) and contain at least one workflow file in the *.github/workflow* directory
- have been created  after *2019-01-11* (GA official release date)  and before *2023-02-06*
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

- Using the **minimal running example** narrative.
- In this case we provide the [6-repositories.zip](https://github.com/pavt/egad/blob/main/dataset/6-repositories.zip) file (~63 MB), to get 6 repositories into your local directory.

##### 2.2.2 Full replication

- Using the **as in the companion paper** narrative.
- In this case we provide the [script](https://github.com/pavt/egad/blob/main/dataset/script/clone_all.sh) and [repos.txt](https://github.com/pavt/egad/blob/main/dataset/script/repos-https.txt) files, to clone all the repositories into your local directory.

### 3 Access to the Sticky Commits narrative

Once you've loaded the Egad project: 

1. Go to the Egad project [(as in the picture)](https://github.com/pavt/egad/blob/main/images/started.png).
2. Select one of the narratives: (i) **minimal running example**, or (ii) **as in the companion paper**.


