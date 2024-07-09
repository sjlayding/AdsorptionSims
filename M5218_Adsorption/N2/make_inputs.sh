# Make sure your pressures and chemical potentials line up!

pressures=( 0.1 0.5 1.0 2.0 5.0 8.0 10.0 12.0 15.0 20.0 ) ;

potentials=( * * * * * * * * * * ) ;

for i in `seq 0 1 9` ; do cp input_PRESS input\_"${pressures[i]}" ; sed -i "s/PRESS/"${pressures[$i]}"/g" input\_"${pressures[i]}" ; sed -i "s/CHEMPOT/"${potentials[$i]}"/g" input\_"${pressures[i]}" ; done ;
