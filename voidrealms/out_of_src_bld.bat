REM echo OFF

echo Verifying tools

echo CMake
cmake --version

echo Ninja
ninja --version

echo Cleaning last release build
rmdir /s /q build

echo Starting release build

cmake . -B build/release -G Ninja -DCMAKE_BUILD_TYPE=Release
if %ERRORLEVEL% neq 0 (
    echo Release CMake failed error code: %ERRORLEVEL%
    cd ..
    exit /B %ERRORLEVEL%
)

cd build/release
dir

REM ninja
REM if %ERRORLEVEL% neq 0 (
REM     echo Release Ninja failed error code: %ERRORLEVEL%
REM     cd ..
REM     exit /B %ERRORLEVEL%
REM )

cd ..
echo Completed release build

exit /B
