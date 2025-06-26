#!/usr/bin/env bash
# This file is *not* intended to be `source`d.

# # Set the default application launched by `open(1)` and by hyperlinks in the terminal for files ending in `.txt` and some other text files. It's not clear how this interacts with file magic numbers - I've done no research on that, only brief testing.
# This is *all* informed primarily by https://apple.stackexchange.com/questions/123833/replace-text-edit-as-the-default-text-editor
# Consider that at least one person on that thread had the results of the technique I'm using reverted mysteriously. Does [`duti`](https://github.com/moretension/duti) (mentioned in the stackexchange thread too) help avoid that? How?

# For a different editor, have that editor running and then run `lsappinfo | grep 'bundleID="' | cut -d'"' -f2 | sort | grep <editor_name_here>`, or without the final grep to examine the list of bundleIDs of running programs for your editor.
# Informed by https://alexpeattie.com/blog/associate-source-code-files-with-editor-in-macos-using-duti/#tldr-how-to-associate-file-extensions-for-all-programming-languages-with-your-editor:~:text=Find%20your%20editor%E2%80%99s%20bundle%20ID%20by%20running%3A%20lsappinfo%20%7C%20grep%20%27bundleID%3D%22%27%20%7C%20cut%20%2Dd%27%22%27%20%2Df2%20%7C%20sort (remove the text-fragment portion, starting with `:~:`, to fall back to an identified part of the page).
set -eux
macos_default_editor_bundleID='dev.zed.Zed'

for LSHandlerContentType in 'public.plain-text' 'public.data'; do
    defaults write com.apple.LaunchServices/com.apple.launchservices.secure \
        LSHandlers -array-add \
        '{LSHandlerContentType='"${LSHandlerContentType}"';LSHandlerRoleAll='"${macos_default_editor_bundleID}"';}'
done
