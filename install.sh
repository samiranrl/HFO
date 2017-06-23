sudo apt-get install build essential
sudo apt-get install cmake libboost-filesystem-dev libboost-system-dev flex
sudo apt-get install libpng-dev
sudo apt-get install zlib1g-dev
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SOCCERWINDOW=False ..
make
sudo make install
cd ..
cd example/sarsa_offense/
make
cd ..
cd ..
