Sublime PHP CodeSniffer, Linter and Mess Detector Plugin Changelog
==================================================================

4.6.3
-----
* Patch to fix [GH-53](https://github.com/benmatselby/sublime-phpcs/issues/53) which was php-cs-fixer executing on save for non plugin based files (e.g. running for a python file). Thanks to [John Hoffmann](https://github.com/jhoffmann) for the solution.
* Minor update to the README to cover off a gotcha on installing php-cs-fixer using Homebrew [GH-52](https://github.com/benmatselby/sublime-phpcs/issues/52)

4.6.2
-----
* Small patch to fix [GH-51](https://github.com/benmatselby/sublime-phpcs/issues/51). Thanks to [mstaatz](https://github.com/mstaatz) for raising the issue.

4.6.1
-----
* Provided configuration option "phpcs_commands_to_php_prefix" that allows you to distinguish which commands should have the php path prefixed. Thanks to [Hamrani ahmed](https://github.com/ahamrani) for raising [GH-49](https://github.com/benmatselby/sublime-phpcs/issues/49)

4.6
---
* Fixes for windows based users and the use of phar files. Thanks to [Hamrani ahmed](https://github.com/ahamrani) for raising [GH-47](https://github.com/benmatselby/sublime-phpcs/issues/47)
* Moved the options to the end of the php-cs-fixer command as per their documentation examples
* Removed reloading settings code, as it seems redundant in latest build of Sublime Text 2

4.5.1
-----
* Minor changes to the README to better explain non package control installation.
* Minor change to README for naming of the plugin
* Minor change to when the "Goto Next Error" context menu is enabled

4.5
---
* Define a setting "php_cs_fixer_show_quick_panel" that stops quick panel displaying for php-cs-fixer. Thanks to [Kevin Perrine](https://github.com/kevinsperrine/) for the pull request

4.4.1
-----
* Blank out the default setting for php_cs_fixer_executable_path. Thanks to [Eric Lewis](https://github.com/ericandrewlewis/) for the pull request.

4.4
---
* Provide configuration options for each command to execute on save. Thanks to [Jeremy Romey](https://github.com/jeremyFreeAgent) for the [suggestion](https://github.com/benmatselby/sublime-phpcs/issues/36)

4.3
---
* Ehancement for [GH-34](https://github.com/benmatselby/sublime-phpcs/issues/34) which provides a command to "Goto Next Error" which can also have a shortcut key assigned to it. Thanks to [Casey Becking](https://github.com/caseybecking) for raising the feature request
* Ability to fun PHP-CS-Fixer on save now. Thanks to [Cedric Lombardot](https://github.com/cedriclombardot) for raising the feature request

4.2
---
* Ability to configure if you want the errors to be highlighted in the editor. Thanks to [Aleksandr Gornostal](https://github.com/gornostal)

4.1.1
-----
* Small patch to be consistent with the naming of the tools. Thanks to [Beau Simensen](https://github.com/simensen)

4.1
---
* Added support to use php-cs-fixer on a directory in the side bar
* Now displays the php-cs-fixer changes in the quick panel

4.0
---
* Added basic support for [php-cs-fixer](https://github.com/fabpot/PHP-CS-Fixer) based on the work by [Jeremy Romey](https://github.com/jeremyFreeAgent/sublime-php-cs-fixer/)

3.13
----
* Setting to configure if phpcs is run when the plugin is invoked [GH-20](https://github.com/benmatselby/sublime-phpcs/issues/20). Thanks to [grEvenX](https://github.com/grEvenX)

3.12
----
* Bug fix for [GH-18](https://github.com/benmatselby/sublime-phpcs/issues/18) which meant the plugin would fail to work when coming across non ascii characters
* Added a show_debug setting for console output. Off by default

3.11
----
* Support added to configure the php path [GH-16](https://github.com/benmatselby/sublime-phpcs/issues/16). Thanks to [Dan Previte](https://github.com/dprevite)
* Added support for multiple file extensions, rather than using Sublimes syntax checker [GH-15](https://github.com/benmatselby/sublime-phpcs/issues/15)

3.10
----
* Bug fix for [GH-13](https://github.com/benmatselby/sublime-phpcs/issues/13) which seems to be apparent when Sublime cannot find/load the settings file

3.9
---
* Bug fix for [GH-12](https://github.com/benmatselby/sublime-phpcs/issues/12)
* Bug fix for incorrectly mismatching sublime line numbers to line numbers from a report *if* there was only one error reported
* Updated name of change log

3.8
---
* Support added for running [phpmd](http://phpmd.org/) - Currently off by default

3.7
---
* Updated Main.sublime-menu so we can change the key bindings from within the Preferences panel

3.6
---
* Added the ability to show previous errors without generating the report again. Thanks to [Drarok](https://github.com/Drarok) [GH-9](https://github.com/benmatselby/sublime-phpcs/pull/9)
* Put the processing back to being threaded which helps with large files. Thanks to [Drarok](https://github.com/Drarok) [GH-10](https://github.com/benmatselby/sublime-phpcs/pull/10)
* Removed Side Bar Menu, as it doesn't make sense to run report against a non-open file
* When selecting an error from the quick panel, also set the status bar message
* Added "Show previous errors" to the context menu to be consistent
* Added keymap for Mac OSX, cannot get the keys right when using Virtual Box to define for Windows and Linux, so leaving for the time being

3.5
---
* Ability to show the errors in the status bar (configurable with on/off setting). Thanks to [Drarok](https://github.com/Drarok)
* Bug fix with clearing the sniffer marks

3.4
---
* Ability to not show the quick_panel errors on save, (errors shown by default). Thanks to [Drarok](https://github.com/Drarok)

3.3
---
* Allow the user to specify the location of the phpcs application [GH-4](https://github.com/benmatselby/sublime-phpcs/issues/4)
* Turned the linter checks on by default

3.2
---
* Added the ability to run the PHP linter alongside the PHP_CodeSniffer
* You can specify if you want the linter to run
* You can specify the regex of the linter output, as it seems to differ on different systems

3.1
---
* Updated the loading of settings to use static method
* Updated the debugging calls to prefix with "Phpcs"
* Added a counter of errors in the console log

3.0
---
* Enables the plugin to work on the Windows platform [GH-1](https://github.com/benmatselby/sublime-phpcs/issues/1)
* Removed some redundant code

2.0
---
* Changed the way the checkstyle report was parsed. due to [GH-2](https://github.com/benmatselby/sublime-phpcs/issues/2) which means it should now work on Linux machines

1.1
---
* Load the settings into memory if changed using _settings.add_on_change_. This only works on User settings rather than defaults, which is a limitation of the API from what I can see at the moment.
* Define the coding standard as PEAR by default.
* Introduced this Changelog.md file.
* Raised [this feature request](http://sublimetext.userecho.com/topic/96221-gutter-hint-bubles-when-hovered-over/) so I can show tool tips in the gutter for each checkstyle error/warning

1.0
---
* Initial release documented [here](http://soulbroken.co.uk/code/sublimephpcs)
* Right click on a php file and generate checkstyle report in the gutter and/or quick panel
* Settings to turn the reporting on/off for gutter and quick panel
