# EGAD : Explorable GitHub Action Domain Model

![alt text]([http://url/to/img.png](https://github.com/pavt/egad/blob/main/images/egad-narrative.png)

[](https://github.com/pavt/egad/blob/main/images/egad-narrative.png)


EGAD is a tool for [Glamorous Toolkit](https://github.com/feenkcom/gtoolkit) (GT).
EGAD was created to depict and analyze detailed [ GA workflow](https://github.com/features/actions) data.



## TODO

- [X] tool
- [X] tool intro sentence 
- [ ] picture of the tool
- [X] installation (How to load) 
- [ ] replication package MSR 2023
- [ ] video presentation
- [ ] GitHub citation - 90%, missing DOI (release?)
- [X] licence

## TODO

## Setting up EGAD on GT

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
