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
rmdir /s /q build

echo.
echo Starting release build

echo Because we want to use Copperspice release mode, set the CMAKE_PREFIX_PATH for CMake

rem set CopperSpice_DIR="C:\CopperSpice\cs_1_7\release\cmake\CopperSpice"
rem echo CopperSpice_DIR: %CopperSpice_DIR%


echo.
echo The cmake command: 
echo cmake . -B build/release -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="C:\CopperSpice\cs_1_7\release\cmake\CopperSpice"

echo.
cmake . -B build/release -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="C:\CopperSpice\cs_1_7\release\cmake\CopperSpice"
if %ERRORLEVEL% neq 0 (
    echo Release CMake failed error code: %ERRORLEVEL%
    exit /B %ERRORLEVEL%
)

cd build/release
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

exit /B
