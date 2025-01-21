# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

## TODO: Maybe add in an option for the default directory

# TODO: Comment
## Simple tooling function that generates the correct .editorconfig file depending on if we are the root package
##
## @param[in] IS_ROOT 	- If the editorconfig file should be treat as the root version, default: true
## @param[in] DIR 		- The directory to place the file into, default: root directory for the package
function(GenerateEditorConfig)
	set(oneValueArgs
		IS_ROOT
		DIR
	)
	cmake_parse_arguments(PARSE_ARGV 0 arg
		"" "${oneValueArgs}" ""
	)

	## Default to using the root project dir, if not specified
	if(NOT DEFINED arg_IS_ROOT)
		set(BreachedSpeak_EditConf_IS_ROOT true)
	else()
		set(BreachedSpeak_EditConf_IS_ROOT ${arg_IS_ROOT})
	endif()

	## The directory to place the editor config in, should default to the libraries root directory
	if(NOT DEFINED arg_DIR)
		if(PROJECT_IS_TOP_LEVEL)
			set(BreachedSpeak_EditConf_DIR ${CMAKE_SOURCE_DIR})
		else()
			set(BreachedSpeak_EditConf_DIR ${CMAKE_CURRENT_SOURCE_DIR})
		endif()
	else()
		set(BreachedSpeak_EditConf_DIR ${arg_DIR})
	endif()

	## Warn the user if they have not provide a directory to store the non root '.editorconfig', as this is recommended
	if(NOT BreachedSpeak_EditConf_IS_ROOT AND NOT DEFINED arg_DIR)
		message(WARNING
			"\nNo directory was provided for the '.editorconfig' when not treating this config as root.\n"
			"Default: ${BreachedSpeak_EditConf_DIR}\n"
		)
	endif()

	## Create the editorconfig file in the correctly set location
	configure_file(
		${CMAKE_CURRENT_FUNCTION_LIST_DIR}/.editorconfig.in
		${BreachedSpeak_EditConf_DIR}/.editorconfig
		@ONLY
	)
endfunction()
