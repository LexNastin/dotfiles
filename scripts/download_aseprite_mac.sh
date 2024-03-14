#!/bin/bash
# credit goes to https://gist.github.com/ryancat/5b2fbfdfbf30d467342403a0c5d19607
# Must have git, homebrew, and xcode to install
# Make sure to change line 29 and line 30 according to your mac OS and xcode versions
# Install ninja compiler
brew install ninja
# Install CMake for makefile
brew install cmake
# Install prebuilt version of Skia for 2D graphic libraries
cd $HOME
mkdir deps
cd deps
mkdir skia
cd skia
curl -L https://github.com/aseprite/skia/releases/download/m81-b607b32047/Skia-macOS-Release-x64.zip | tar zx
# Install aseprite at $HOME/aseprite
cd $HOME
git clone --recursive https://github.com/aseprite/aseprite.git
cd aseprite
mkdir build
cd build
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_OSX_ARCHITECTURES=x86_64 \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=10.15 \
  -DCMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=$HOME/deps/skia \
  -DSKIA_LIBRARY_DIR=$HOME/deps/skia/out/Release-x64 \
  -G Ninja \
  ..
ninja aseprite
# Start aseprite
$HOME/aseprite/build/bin/aseprite
