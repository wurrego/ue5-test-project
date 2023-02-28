# Setup VSCode on Ubuntu for Unreal Engine Development
## Reference
https://docs.unrealengine.com/5.1/en-US/setting-up-visual-studio-code-for-unreal-engine/

## Dependencies
### install clang
sudo apt install clang

### install dotnet
sudo snap install dotnet-sdk --classic --channel=7.0
sudo snap alias dotnet-sdk.dotnet dotnet

## Generate Project Files
$UNREAL_ENGINE_DIR/Engine/Build/BatchFiles/RunUBT.sh -projectfiles -vscode -project=$PWD/TestProject.uproject -game -engine

## Setup VSCode Dev Environment
- open up .vscode/c_cpp_properties.json
- in the configurations section, within the curly bracers, after "intelliSenseMode": "clang-x64", line add the following line
`"includePath": [ "${workspaceFolder}/Plugins/**", "${workspaceFolder}/Source/**", "${workspaceFolder}/Intermediate/**" ], `


## Build the target TestProject Editor Development
- Use VSCode
- or make

## Run the Game IDE
./dev.sh

# Release
In order to release and distribute the game you need to package it up!

## Package the Game (Development)
./package.sh

## Package the Game for Shipping
./package.sh -s

## Run the packaged game
./run.sh

## Run the packaged game as a background process
./run.sh -b

## Stop all instances of game running
./run.sh -k