# Robot-Framework
This repository contains my Robot Framework-projects. Some are demos based on courses and some are my own
projects for example VR. Both are great and fun ways to learn about automating with Robot!

## Installations for running robot-files: ##
- Python. 2.7.15 is a good version if Python is not already installed. Run python --version on command line to check installation.
- Robot Framework. Easiest installation is to use PIP-packet manager. Depending on version this can be included on Python installation but can be also installed separately. Run pip --version in command line to check installation. 
- Installation command for Robot Framework is pip install robotframework. This can be written directly command line if PIP is installed.
- seleniumlibrary and selenium2library for automating browser. Commands: pip install robotframework-seleniumlibrary and pip install robotframework2-seleniumlibrary.
- Geckodriver for Firefox and/or Chromedriver for Chrome. Changing browser can be done by modifying a keyword in test case-file which contains opening browser. Just simply replace Firefox with Chrome or other way if you want to use different browser than what is configured in test case.

## Instructions for running Robot-files ##
- Navigate to folder containing a Robot tst suite (.robot file) that you want to run. Open command line to that folder.
- Syntax for running is robot -t testcasename testsuitename.
For example robot -t Search_Friday VR.robot
