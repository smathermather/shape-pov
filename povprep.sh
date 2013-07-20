#!/bin/bash

ogrinfo=`ogrinfo -al -geom=YES $1.shp $1 | grep POLYGON `

#echo $ogrinfo
polyprep1=`echo $ogrinfo | sed -e 's/POLYGON ((//g' -e 's/)//g' -e 's/,/>,</g' -e 's/ /,/g' -e 's/,,/</g'`'>'
#echo $polyprep1
num_points1=`echo $polyprep1 | awk -F'>' '{print NF; exit}'`
num_points=`expr $num_points1 - 1`
#polyprep2=`echo $polyprep1'>'`

#echo $num_points

polytemplate='polygon {'$num_points', <'$polyprep1'  material {texture {pigment {rgb <0.089677, 0.000000, 1.000000>} normal {brick 0.5 } finish { diffuse 0.6 brilliance 1.0}} interior {ior 1.3}}}'

echo $polytemplate
