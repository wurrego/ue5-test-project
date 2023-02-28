#!/bin/bash

function usage
{
        echo "Usage: ./run.sh [-b|--background] [-d|--display] [-k|--kill]"
        echo "     run.sh               - Runs the unreal engine game"
		echo "     [-b|--background]    - Runs the unreal engine game in the background"
        echo "     [-d|--display]       - Runs the unreal engine game with display"
        echo "     [-k|--kill]          - Kill all TestProject game processes that are running"
        echo "     [-h|--help|-?]       - Displays this usage"
}


# start the game
cd Build/Linux

# Parse input arguments
while [ $# -gt 0 ]
do
	case $1 in
		(-b|--background)
            ./TestProject.sh -AudioMixer -RenderOffScreen -ResX=1920 -ResY=1080 -ForceRes -PixelStreamingIP=localhost -PixelStreamingPort=8888 &
            process_ids=`pgrep TestProject`
            printf "The following process IDs are running in the background: \n${process_ids}\n\n"
            echo "Done."  
			exit 0
        ;;

        (-d|--display)
            ./TestProject.sh -AudioMixer -ResX=1920 -ResY=1080 -ForceRes -PixelStreamingIP=localhost -PixelStreamingPort=8888 &
            echo "Done."  
			exit 0
        ;;

        (-k|--kill)
            process_ids=`pgrep TestProject`
            printf "Killing the following process IDs are running in the background: \n${process_ids}\n\n"
            sudo kill -9 ${process_ids}
            echo "Done."  
			exit 0
        ;;
		
		(-h|--help|-?) usage; exit 0;;
		(*) echo "Error - unrecognized option $1" 1>&2; usage 1>&2; exit 1;;
	esac
	shift
done

# normal run in foreground
./TestProject.sh -AudioMixer -RenderOffScreen -ResX=1920 -ResY=1080 -ForceRes -PixelStreamingIP=localhost -PixelStreamingPort=8888