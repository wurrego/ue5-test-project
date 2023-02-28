// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;
using System.IO;
using System;

public class TestProject : ModuleRules
{
	public TestProject(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

        PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore", "HeadMountedDisplay", "NavigationSystem", "AIModule", "Niagara", "EnhancedInput" });

        PrivateDependencyModuleNames.Add("Protobuf");

	}

	private string ModulePath
    {
        get { return ModuleDirectory; }
    }

	private string ThirdPartyPath
    {
        get { return Path.GetFullPath( Path.Combine( ModulePath, "../../ThirdParty/" ) ); }
    }
}
