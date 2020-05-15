$env:Path += "C:\php\;" 
$env:Path += "C:\gperf\;" 
$env:Path += "C:\Program Files\CMake\bin\;" 
git clone https://github.com/tdlib/td.git
cd td
git checkout v1.6.0
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.bat
./vcpkg.exe install openssl:x64-windows zlib:x64-windows
cd ..
Remove-Item build -Force -Recurse -ErrorAction SilentlyContinue
mkdir build
mkdir release
cd build
cmake -A x64 -DCMAKE_INSTALL_PREFIX:PATH=../../release -DCMAKE_TOOLCHAIN_FILE:FILEPATH=../vcpkg/scripts/buildsystems/vcpkg.cmake ..
cmake --build . --target install --config Release
cd ..
Compress-Archive -Path /release -DestinationPath /../release.zip