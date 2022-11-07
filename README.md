# Reproducibility Package python_3_8

Reproducibility package to create a Debian 10 Linux virtual machine with Python 3.8.

## Description

This reproducibility package creates a runtime environment (Debian 10 virtual machine) with Python 3.8. This runtime environment has all dependencies installed in it that are needed to run example Python scripts available in `shared` directory.
To create a similar runtime environment each time, a Docker image and a Docker container needs to be created. To hide the underline technical complexities we have automated these steps in the form of a bash script (reproduce.sh). 
Executing this bash script will create a Linux virtual machine, establish SSH connection to the Linux machine and will land user to a directory where Python scripts are available. Information about the use of Python scripts is available in a Readme file in the shared directory.



## Getting started

1. [Install Docker](https://docs.docker.com/desktop/).
2. Execute the following command on your terminal: 

```
bash reproduce.sh
```
