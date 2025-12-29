# rand

CAN ONLY BE USED BY LUAJIT!!!

Made for Linux only, this simple library provides random values better than lua's math library by using /dev/random and /dev/urandom on your PC.

1. rand.random_range(minimum value that can appear, maximum value that can appear) - reads /dev/random on your PC

2. rand.urandom_range(minimum value that can appear, maximum value that can appear) - reads /dev/random on your PC