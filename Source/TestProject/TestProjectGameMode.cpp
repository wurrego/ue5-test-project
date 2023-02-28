// Copyright Epic Games, Inc. All Rights Reserved.

#include "TestProjectGameMode.h"
#include "TestProjectPlayerController.h"
#include "TestProjectCharacter.h"
#include "UObject/ConstructorHelpers.h"

ATestProjectGameMode::ATestProjectGameMode()
{
	// use our custom PlayerController class
	PlayerControllerClass = ATestProjectPlayerController::StaticClass();

}