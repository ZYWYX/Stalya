---
--- @author Dylan MALANDAIN
--- @version 2.0.1
--- @since 2020
---
--- RageUI Is Advanced UI Libs in LUA for make beautiful interface like RockStar GAME.
---
---
--- Commercial Info.
--- Any use for commercial purposes is strictly prohibited and will be punished.
---
--- @see RageUI
---

fx_version 'cerulean'
games { 'gta5' };

name 'RageUI';
description 'RageUI, and a project specially created to replace the NativeUILua-Reloaded library. This library allows to create menus similar to the one of Grand Theft Auto online.'

ui_page 'html/ui.html'

files {
    "weapons.json",
    "ipls.json",
    'html/ui.html',
    'html/scripts/app.js',
    'html/css/app.css',
}
client_scripts {
"client.lua"
}
