"# Cuckoo-AWS" 
Installation instructions 


Nest Setup

•	Lunch Linux machine (possible via AWS marketplace)
•	Copy the repository
•	Setup and activate virtual environment 
```
virtualenv venv
venv/bin/activate
```
•	Install boto3 library
```
pip install boto3
```
•	Obtain the matching monitoring binaries from the Community repository.
```
python stuff/monitor.py
```
•	Install cuckoo as DEV mode
```
$ python setup.py sdist develop
```
•	Run cuckoo with debug output
```
$ cuckoo –d
```
•	First run should build the configuration files, save that location as shown in the output (should contain .cuckoo library)

•	Edit cuckoo.conf
o	machinery   = aws
o	[resultserver] ip = <the private IP of this machine>

•	Edit aws.conf according to the instructions in the file.  

•	Run  $ cuckoo 
 
** For malware network analysis, set the Nest as default route of each guest.  

Problems and solutions
•	try downgrading pip in case that the installation fails, or if the next exception appears                ” 'module' object has no attribute 'get_installed_distributions'”
```
pip install --user --force-reinstall pip==9.0.3
```
•	If re-generating the configuration is needed, then delete the whole .cuckoo folder and run cuckoo –d once again.
