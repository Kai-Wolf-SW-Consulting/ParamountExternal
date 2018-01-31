if (-Not (Get-Command "cmake.exe" -ErrorAction SilentlyContinue)) {
    "CMake not found. Installing..."
    $cmake_version = "cmake-3.10.2-win64-x64"
    $output = "$PSScriptRoot\cmake.zip"
    Invoke-WebRequest -Uri "https://cmake.org/files/v3.10/$cmake_version.zip" -OutFile $output
    Expand-Archive -Path $output -DestinationPath $PSScriptRoot
    $env:Path = "$PSScriptRoot\$cmake_version\bin"
    Invoke-Expression "cmake.exe --version"
}

if (-Not (Test-Path "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\MSBuild.exe")) {
    "MSBuild not found. Installing VS Build Tools..."
    $output = "$PSScriptRoot\vs_buildtools.exe"
    Invoke-WebRequest -Uri "https://aka.ms/vs/15/release/vs_buildtools.exe" -OutFile $output
    Invoke-Expression "$output --passive --norestart --add Microsoft.VisualStudio.Workload.MSBuildTools"
}
