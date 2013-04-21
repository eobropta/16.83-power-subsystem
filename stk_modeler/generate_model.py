# This script models the Holodeck Solar Panels and outputs them to an STK file

# Eddie Obropta & Troy Astorino
# 16.83 Team Holodeck

# Updated 4/12/2013

#dimensions 

from math import *
import numpy as np

#'sa' = solar array
sa_area = 5.46 #m^2 with 30% margin

#'bus' = satellite body size
bus_z = 1.702 
bus_x = .506
bus_y = .506

#vertices of bus base stored in 3x1 arrays

bus_base = np.array( [[bus_x/2.0, bus_y/2.0, 0.0 ], [bus_x/2.0, bus_y/2.0, 0.0 ], [bus_x/2.0, bus_y/2.0, 0.0 ], [bus_x/2.0, bus_y/2.0, 0.0 ]] )

sa_case = 1
#square solar arrays
if sa_case == 1:
    sa_length = sqrt(5.46)
    sa_width = sqrt(5.46)


#write Bus
f = open('holodeck_model.mdl', 'w')
bus_header = 'Component Bus\n Extrusion\n FaceColor gold4\n FaceStyle Filled\n Length ' + str(bus_z) + '\n NumVerts ' + str(bus_base.shape[0]) + '\n Data \n'

bus_data = ''
for i in range(bus_base.shape[0]):
    print i
    bus_data = bus_data + str(bus_base[i][0]) + ' ' + str(bus_base[i][1]) + ' ' + str(bus_base[i][2]) + '\n'

bus_footer = 'End Extrusion\n EndComponent\n'

bus_write = bus_header + bus_data + bus_footer

f.write(bus_write)

#write root

root = 'Component holodeck\n Root\n Refer\n Component Bus\n EndRefer\n EndComponent\n'
f.write(root)
