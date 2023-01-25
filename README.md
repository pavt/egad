# EGAD : Explorable GitHub Action Domain Model

EGAD is a tool for [Glamorous Toolkit](https://github.com/feenkcom/gtoolkit) (GT), created to depict and analyze detailed [ GA workflow](https://github.com/features/actions) data.



## TODO

- [X] tool
- [X] tool intro sentence 
- [X] how to install GT
- [X] installation (How to load) 
- [ ] how to start the demo
- [ ] replication package Data and Tool Showcase Track MSR 2023
- [ ] video presentation
- [ ] GitHub citation - 90%, missing DOI (release?)
- [X] licence

------

## Setting up EGAD on GT

Download GT (Glamorous Toolkit) for your OS from [gtoolkit.com](https://gtoolkit.com).
Start GT and open a Playground.
Copy-paste the following code snippets

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

## Replication package 

- [Replication package](https://github.com/pavt/egad/blob/main/documentation/replication-package.md) for the Data and Tool Showcase Track MSR 2023.

## Demo video

- TODO

## Authors

- EGAD is being developed by the [Software Engineering Group](https://seg.inf.unibe.ch), University of Bern, Switzerland.





