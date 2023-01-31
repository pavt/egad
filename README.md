# EGAD : Explorable GitHub Action Domain Model

EGAD is a tool for [Glamorous Toolkit](https://github.com/feenkcom/gtoolkit) (GT), created to depict and analyze detailed [ GA workflow](https://github.com/features/actions) data.

------

## Quick setting up of EGAD on GT

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

## Replication package 

- [Replication package](https://github.com/pavt/egad/blob/main/documentation/replication-package.md) for the Data and Tool Showcase Track MSR 2023.

## Demo video

There is a [short installation video](https://youtu.be/jqXiPq037Rs) explaining how to download and install the tool.

## Authors

- EGAD is being developed by the [Software Engineering Group](https://seg.inf.unibe.ch), University of Bern, Switzerland.





