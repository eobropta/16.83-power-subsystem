# This script models the Holodeck Solar Panels and outputs them to an STK file

# Eddie Obropta & Troy Astorino
# 16.83 Team Holodeck

# Updated 4/12/2013

#dimensions in meter

from math import *
import numpy as np
from component_writer import *

#'sa' = solar array
sa_area = 2.25 #m^2 with 30% margin

#'bus' = satellite body size
bus_z = 1.702 
bus_x = .506
bus_y = .506

#vertices of bus base stored in 3x1 arrays

plate_base = np.array( [[bus_x/2.0, bus_y/2.0, 0.0 ], [bus_x/2.0, -bus_y/2.0, 0.0 ], [-bus_x/2.0, -bus_y/2.0, 0.0 ], [-bus_x/2.0, bus_y/2.0, 0.0 ]] )

plate_side = np.array( [[bus_z/2.0, bus_y/2.0, 0.0 ], [bus_z/2.0, -bus_y/2.0, 0.0 ], [-bus_z/2.0, -bus_y/2.0, 0.0 ], [-bus_z/2.0, bus_y/2.0, 0.0 ]] )

sa_case = 1
#square solar arrays
if sa_case == 1:
    sa_x = sqrt(sa_area/2.0)
    sa_y = sqrt(sa_area/2.0)

plate_sa = np.array( [[sa_x/2.0, sa_y/2.0, 0.0 ], [sa_x/2.0, -sa_y/2.0, 0.0 ], [-sa_x/2.0, -sa_y/2.0, 0.0 ], [-sa_x/2.0, sa_y/2.0, 0.0 ]] )



#write Bus
f = open('holodeck_model.mdl', 'w')

file_header = '#Holodeck Power Model modified from TERsat\n#Created: 21 April 2013\n#Name: Holodeck\n#Class: 16.83 Spring 2013\n#Beam: m\n#Length: m\n#Height: m\n#Articulations:No\n#All units in meters\n'
f.write(file_header)

sa_efficiency = 29.5
sa = 'SolarPanelGroup sa ' + str(sa_efficiency) + '\n'
#sa_2 = 'SolarPanelGroup sa2 ' + str(sa_efficiency) + '\n'
f.write(sa)

plate_base_str = polygon('PlateBase','gold4',plate_base)
plate_side_str = polygon('PlateSide','gold4',plate_side)
plate_sa_str = polygon('PlateSa','blue',plate_sa) 

## Write Bus 
f.write('Component ' + 'PlateBase' + '\n')
f.write(plate_base_str)
f.write('EndComponent\n')

f.write('Component ' + 'PlateSide' + '\n')
f.write(plate_side_str)
f.write('EndComponent\n')

## Write SolarArray
f.write('Component ' + 'PlateSa' + '\n')
f.write('SolarPanel sa\n')
#f.write('Pointing SolarPoint 0 0 1\n Articulation SolarPoint\n yRotate Rotate 0 0 0\n EndArticulation\n')
#f.write('Pointing SolarPoint 0 0 1\n')
f.write(plate_sa_str)
f.write('EndComponent\n')


#rotation matrix for base
R = np.array([[0,0,0],[0,0,0]])
#translation matrix for base
T = np.array([[0,0,0],[0,0,bus_z]])
name = 'PlateBase'
base_str = transform(name,R,T)

f.write('Component ' + 'Base' + '\n')
f.write(base_str)
f.write('EndComponent\n')

#rotation matrix for base
R = np.array([[0,90,0],[0,90,0],[0,90,90],[0,90,90]])
#translation matrix for base
T = np.array([[-bus_x/2.0,0,bus_z/2.0],[bus_x/2.0,0,bus_z/2.0],[0,bus_y/2.0,bus_z/2.0],[0,-bus_y/2.0,bus_z/2.0]])
name = 'PlateSide'
side_str = transform(name,R,T)

f.write('Component ' + 'Side' + '\n')
f.write(side_str)
f.write('EndComponent\n')

## Write SA

#rotation matrix for sa
#sa_angle = 45
sa_angle = 70
#sa_z_angle = 45
sa_z_angle = 45
R = np.array([[sa_angle,0,sa_z_angle],[sa_angle,0,sa_z_angle],[sa_angle+180,0,sa_z_angle],[(sa_angle+180),0,sa_z_angle]])
#translation matrix for sa

T_sa1x =  bus_x/2.0 + sa_x/2.0
T_sa1y =  bus_y/2.0 + sa_y/2.0
T_sa1z = bus_z/2.0
T_sa2x = -T_sa1x
T_sa2y = -T_sa1y
T_sa2z = bus_z/2.0
T = np.array([[T_sa1x,T_sa1y,T_sa1z],[T_sa2x,T_sa2y,T_sa2z],[T_sa1x,T_sa1y,T_sa1z+.01],[T_sa2x,T_sa2y,T_sa2z+.01]])

#T = np.array([[0.0,bus_y/2.0+sa_y/2.0,0.0],[0.0,-(bus_y/2.0+sa_y/2.0),0.0],[0.0,bus_y/2.0+sa_y/2.0,0.01],[0.0,-(bus_y/2.0+sa_y/2.0),0.01]])

name = 'PlateSa'
solar_array_str = transform(name,R,T)

f.write('Component ' + 'SolarArray' + '\n')
f.write(solar_array_str)
f.write('EndComponent\n')

# f.write('Component ' + 'SolarArraySet' + '\n')
# f.write('Translate 0.0 0.0 ' + str(bus_z/2.0) +'\n')
# f.write('Refer\n')
# f.write('Articulation SolarPoint\n yRotate Rotate 0 -360 360\n EndArticulation\n Pointing SolarPoint 0 0 1\n Component SolarArray\n')
# f.write('EndRefer\n')
# f.write('EndComponent\n')

#add to body
body = 'Component Body\n  Refer\n Component Side\n EndRefer\n Refer\n Component Base\n EndRefer\n Refer\n Component SolarArray\n EndRefer\n  EndComponent\n'


f.write(body)
#write root
root = 'Component holodeck\n Root\n Refer\n Articulation SolarPoint\n yRotate Rotate -360 0 360\n EndArticulation\n Pointing SolarPoint 0 0 1\n Component Body\n EndRefer\n EndComponent\n'
f.write(root)
    
