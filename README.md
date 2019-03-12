

## Overview

The project is an extension to Cuckoo Sandbox open source project; it adds support to AWS cloud functionalities and enables running emulations on auto-scaling infrastructure.

## Installation instructions - Nest Setup


•	Launch a Linux machine (possible via AWS marketplace)

•	Clone the repository
```
git clone https://github.com/CheckPointSW/Cuckoo-AWS
```

•	Setup and activate virtual environment 
```
virtualenv venv
. venv/bin/activate
```

•	Install boto3 library
```
pip install boto3
```

•	Obtain the matching monitoring binaries from the community repository
```
python stuff/monitor.py
```

•	Install cuckoo as DEV mode
```
python setup.py sdist develop
```

•	Run cuckoo with debug output
```
cuckoo –d
```

•	The first run should build the configuration files and save them in some location. The location is shown in the output of the run (should contain “.cuckoo” library). It is strongly advised to remember that location for the following steps and for future usages

•	Edit ".cuckoo/conf/cuckoo.conf"
```
machinery   = aws
[resultserver] ip = <the private IP of this machine>
```

•	Edit ".cuckoo/conf/aws.conf" according to the instructions in the file

•	Run 
```
cuckoo 
```
 
** For malware network analysis, each guest should have the Nest as their default route 

## Problems and solutions
•	In case that the installation fails or if the following exception appears ” 'module' object has no attribute 'get_installed_distributions' ”, try downgrading pip:
```
pip install --force-reinstall pip==9.0.3
```

•	In case of various issues during the build of the configuration files, try re-generating the configuration. 
Delete the whole “.cuckoo” folder and run the following:
```
cuckoo –d 
```


