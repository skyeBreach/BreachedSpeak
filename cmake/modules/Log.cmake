# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

## TODO: Move over to map
## TODO: Comment
##
set(BreachedSpeak_LOG_VERBOSE_LEVEL "VERBOSE" "DEBUG" "TRACE")

function(IsLogVerbose output)
    if(CMAKE_MESSAGE_LOG_LEVEL IN_LIST MESSAGE_VERBOSE_LOG_LEVELS)
        set(${output}
            ON
            PARENT_SCOPE
        )
    else()
        set(${output}
            OFF
            PARENT_SCOPE
        )
    endif()
endfunction()