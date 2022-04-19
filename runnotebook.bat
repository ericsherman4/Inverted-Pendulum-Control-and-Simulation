@ECHO OFF
ECHO Hello, I will execute your commands now.
::cd C:\Users\esher\Desktop\PITT\PITT ACADEMICS\Junior Year\ECE 1180 - Comp Modeling and Sim\github\Simulation-and-Modeling
REM call is used when you are calling another script, the keyword tells it to return to this bat script when the called script terminates.
call conda deactivate
ECHO Deactivated Base
call conda activate ece1180
ECHO Activated conda env ece1180
jupyter notebook