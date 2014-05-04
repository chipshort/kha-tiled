kha-tiled
=========

This is a port of openfl-tiled by kasoki ( https://github.com/kasoki/openfl-tiled ).
Most of the code is simply copied, I only changed asset loading and rendering.
I did not do many tests, though, so don't expect everything to work perfectly.

Assets
------
1. All the assets you use in your map (including the map itself) must be loaded when creating the map. This means, you should add them to your room. This can be seen in the example's project.kha file.
2. It is really important that all tilesets and images you use in your map are named properly. The name has to be the filename (including path) you used in your tmx file (see the example's project.kha).
