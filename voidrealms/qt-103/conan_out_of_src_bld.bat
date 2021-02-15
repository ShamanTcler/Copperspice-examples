echo OFF

echo Verifying tools

echo.
echo CMake
cmake --version

echo.
echo Ninja
ninja --version

echo.
echo Cleaning last release build
rmdir /s /q conan_build

echo.
echo Starting release build

echo.
echo We want to use the Conan version of Copperspice
copy Conan_CMakelists.txt CMakelists.txt

echo.
echo Making working dirs

mkdir conan_build
cd conan_build

mkdir release
cd release

echo.



echo.
echo Run conan intall, this installs the library and creates the conanbuildinfo.cmake file
conan install ../..


echo.
echo The cmake command: 
echo cmake ../.. -G Ninja -DCMAKE_BUILD_TYPE=Release 


dir

echo.
cmake ../.. -G Ninja -DCMAKE_BUILD_TYPE=Release 
if %ERRORLEVEL% neq 0 (
    echo Release CMake failed error code: %ERRORLEVEL%
    exit /B %ERRORLEVEL%
)

cd release
dir

ninja
if %ERRORLEVEL% neq 0 (
    echo Release Ninja failed error code: %ERRORLEVEL%
    cd ..
    cd ..
    exit /B %ERRORLEVEL%
)

cd ..
echo Completed release build

cd ..

exit /B
