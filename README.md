# Cuckoo SandBox on AWS
By Oran Kabarity @ Check Point Software Technologies

## Overview

The project is an extension to Cuckoo Sandbox open source project; it adds support to AWS cloud functionalities and enables running emulations on auto-scaling infrastructure.

This blog post explains in detail the theory and functionality of Cuckoo Sandbox over AWS cloud.  
https://research.checkpoint.com/cuckoo-system-on-aws/

## Installation instructions - Nest Setup


Attached cloudformation stack: cuckoo-aws-cloudformation.yaml, run it and you will receive an EC2 instance with all the requriements installed

•	Run cuckoo with debug output
```
cuckoo –d
```

•	The first run should build the configuration files and save them in some location. The location is shown in the output of the run (should contain “.cuckoo” library). It is strongly advised to remember that location for the following steps and for future usages

•	Edit ".cuckoo/conf/cuckoo.conf"
```
machinery = aws
[resultserver] ip = <the private IP of this machine>
```

•	Edit ".cuckoo/conf/aws.conf" according to the instructions in the file

•	Run 
```
cuckoo 
```
 

## Image and snapshot setup

•	Cuckoo are recommending to run guest VMs on 64-bit Windows 7. You can import your regular VM to AMI using this manual.
  https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html

•	Launch a new Windows 7 instance to setup the guest 

•	Install Python and Pillow library
  https://cuckoo.sh/docs/installation/guest/requirements.html

•	Disable Windows Firewall and the Automatic Updates
  https://cuckoo.sh/docs/installation/guest/network.html
  
•	Install Cuckoo agent
  https://cuckoo.sh/docs/installation/guest/agent.html

•	For malware network analysis, each guest should have the Nest as their default route 

•	Save this instace as a new image(AMI). This action will also create a new snapshot(snapshot-id can be found under the AMI details)



## Changes from official Cuckoo repository

In order to make it compatible with AWS we made the following changes.

•	Added a new machinery (at cuckoo/machinery/aws.py)

•	Added a new config template (at cuckoo/private/cwd/conf/aws.conf)

•	Modified the config object (at cuckoo/common/config.py) in a way that will support the new configuration file.
