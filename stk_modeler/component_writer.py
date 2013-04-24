from math import *
import numpy as np

def polygon(name,face_color,data):
    #Compose header string
    polygon_header = 'Polygon\n FaceColor ' + face_color + '\n NumVerts ' + str(data.shape[0]) + '\n Data \n'
    
    #Compose data string
    polygon_data = ''
    for i in range(data.shape[0]):
        print i
        polygon_data = polygon_data + str(data[i][0]) + ' ' + str(data[i][1]) + ' ' + str(data[i][2]) + '\n'
    #Compose footer string
    polygon_footer = 'EndPolygon\n'

    return polygon_header + polygon_data + polygon_footer

def transform(name, R, T):
    transform_str = ''
    for i in range(R.shape[0]):
        header = 'Refer\n Component ' + name + '\n'
        rotate = 'Rotate ' + str(R[i][0]) + ' ' + str(R[i][1]) + ' ' + str(R[i][2]) + '\n'
        translate = 'Translate ' + str(T[i][0]) + ' ' + str(T[i][1]) + ' ' + str(T[i][2]) + '\n'
        footer = 'EndRefer \n'
        transform_str = transform_str + header + rotate + translate + footer
    return transform_str

    
