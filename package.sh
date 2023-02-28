#!/bin/bash

PLATFORM=Linux
BUILD_DIR=$PWD/Build
CONFIGURATION=Development
CLIENT_CONFIG=$CONFIGURATION
SERVER_CONFIG=$CONFIGURATION

function usage
{
        echo "Usage: ./package.sh [-s|--shipping]"
        echo "     package.sh           - packages the unreal engine game for development on linux"
		echo "     [-s|--shipping]      - packages the unreal engine game for shipping on linux"
        echo "     [-h|--help|-?]       - Displays this usage"
}


# Parse input arguments
while [ $# -gt 0 ]
do
	case $1 in
		(-s|--shipping)

            CONFIGURATION=Shipping
            CLIENT_CONFIG=$CONFIGURATION
            SERVER_CONFIG=$CONFIGURATION
            
            # client - shipping
            $UNREAL_ENGINE_DIR/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun -project=$PWD/TestProject.uproject -noP4 -platform=$PLATFORM -clientconfig=$CLIENT_CONFIG -serverconfig=$SERVER_CONFIG -cook -allmaps -build -stage -stagingdirectory=$BUILD_DIR -pak -archive -archivedirectory=$BUILD_DIR -Package

            echo "Done."  
			exit 0
        ;;

		(-h|--help|-?) usage; exit 0;;
		(*) echo "Error - unrecognized option $1" 1>&2; usage 1>&2; exit 1;;
	esac
	shift
done

# client - development
$UNREAL_ENGINE_DIR/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun -project=$PWD/TestProject.uproject -noP4 -platform=$PLATFORM -clientconfig=$CLIENT_CONFIG -serverconfig=$SERVER_CONFIG -cook -allmaps -build -stage -stagingdirectory=$BUILD_DIR -pak -archive -archivedirectory=$BUILD_DIR -Package

echo "Done."  