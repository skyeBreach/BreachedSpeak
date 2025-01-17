// Copyright (c) 2025 Skye Benson
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

#pragma once


#include <BreachedSpeak/BreachedSpeak_export.h>

/**
 * @brief
 *
 */
class BREACHEDSPEAK_EXPORT Plugin
{

/*--------------------------------------------------------------------------------------------------------------------*/
// Construction and Destruction

public:
    /**
     * @brief Constructs a new plugin object and assigns it the provided unique identifier
     *
     * @param plugin_id - The unique char* string that identifies this plugin
     */
    Plugin(const char* plugin_id);

private:
    /**
     * @brief Default plugin constructor
     *
     * @note This constructor is hidden as all plugins require a unique pluginID, which must be set on construction
     */
    Plugin();

/*--------------------------------------------------------------------------------------------------------------------*/
//


/*--------------------------------------------------------------------------------------------------------------------*/
};

//BREACHEDSPEAK