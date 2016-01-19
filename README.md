Visual traffic monitoring in urban environments 
================================================

##### TASK:
Detect failure in a vehicle giving priority to another vehicle. More specifically, the vehicle on the right hand side has the priority of passage.

##### DESCRIPTION:
A video will be taken by a camera at an angle so there will be some errors in perceived speed. We will need to calibrate the perceived speed in order to obtain the actual speed of vehicles. The suggested way to implement priority violation is to come up with a rule (or rules). 
E.g. *the car that has the priority shouldn't vary its speed to avoid collision*

Say we are given 2 or 3 frames of a video: if the car that has priority has to slow down, or speed up to avoid collision - we consider this a rule violation. However, we also have to take into consideration the possibility of a driver having bad judgment. Meaning, the driver might misjudge the situation and change the vehicle's speed even when there was no collision to be had. To avoid this case being treated as a rule violation, we need to extrapolate the vehicles' positions and velocities and check the actual potential for collision. 

Moreover, in order to avoid complex computations when it comes to cross-roads, it is suggested to break the situation down to a combination of max 2 roads. Basically separate pairs of directions and judge from that

#### Hints:
+ check for matlab's d object detection and tracking libs
+ check the code from other students 

#### We DON'T need to:
+ analyze traffic signs 
+ watch out for pedestrians
+ analyze license plates

#### Literature:
First couple of chapters of [Multiple View Geometry in Computer Vision, by Richard Hartley and Andrew Zisserman](ftp://vista.eng.tau.ac.il/dropbox/aviad/Hartley,%20Zisserman%20-%20Multiple%20View%20Geometry%20in%20Computer%20Vision.pdf) 


--

###### TO-DO:
+ ask for example videos of both normal traffic and violations
