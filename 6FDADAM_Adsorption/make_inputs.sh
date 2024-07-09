# Make sure your pressures and chemical potentials line up!

pressures=( 0.1 0.5 1.0 2.0 5.0 8.0 10.0 12.0 15.0 20.0 ) ;

potentials=( -49.540 -45.452 -43.692 -41.931 -39.604 -38.410 -37.843 -37.380 -36.813 -36.083 ) ;

for i in `seq 0 1 9` ; do cp input_PRESS input\_"${pressures[i]}" ; sed -i "s/PRESS/"${pressures[$i]}"/g" input\_"${pressures[i]}" ; sed -i "s/CHEMPOT/"${potentials[$i]}"/g" input\_"${pressures[i]}" ; done ;
