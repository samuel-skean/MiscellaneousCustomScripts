#!/usr/bin/env bash
# This file is *not* intended to be `source`d.

# # Set the default application launched by `open(1)` and by hyperlinks in the terminal for files ending in `.txt` and some other text files. It's not clear how this interacts with file magic numbers - I've done no research on that, only brief testing.
# This is *all* informed primarily by https://apple.stackexchange.com/questions/123833/replace-text-edit-as-the-default-text-editor
# At least one person on that thread had the results of the technique I'm using reverted mysteriously. Does [`duti`](https://github.com/moretension/duti) (mentioned in the stackexchange thread too) help avoid that? How?
    # I believe I've had the results of this technique reverted mysteriously (*lots* of text files were opening in Xcode by default.) I just reran this script though [:) :/].
# Before `duti`, consider [`openwith`](https://github.com/jdek/openwith), also mentioned on the alexpeattie.com blog post linked below. It's github claims `duti` is broken on macOS 11.0, but *it* isn't.

# For a different editor, have that editor running and then run `lsappinfo | grep 'bundleID="' | cut -d'"' -f2 | sort | grep <editor_name_here>`, or without the final grep to examine the list of bundleIDs of running programs for your editor.
# Informed by https://alexpeattie.com/blog/associate-source-code-files-with-editor-in-macos-using-duti/#tldr-how-to-associate-file-extensions-for-all-programming-languages-with-your-editor:~:text=Find%20your%20editor%E2%80%99s%20bundle%20ID%20by%20running%3A%20lsappinfo%20%7C%20grep%20%27bundleID%3D%22%27%20%7C%20cut%20%2Dd%27%22%27%20%2Df2%20%7C%20sort (remove the text-fragment portion, starting with `:~:`, to fall back to an identified part of the page).
set -eux
macos_default_editor_bundleID='dev.zed.Zed'

# To add a new file type to be opened by a program, add its `kMDItemContentType` to the list this for loop iterates over. You can get that `kMDItemContentType` by running `mdls <example file> | grep kMDItemContentType`, replacing `<example file>` with a file of the type you want to learn how to describe.
# I learned this from [this superuser.com answer](https://superuser.com/a/1134784) on [this superuser.com thread](https://superuser.com/questions/1134772/apple-doc-for-lshandlercontenttype) (redundancy in case the answer link dies first - I've never used answer links of this form).
for LSHandlerContentType in 'public.plain-text' 'public.data' 'net.daringfireball.markdown'; do
    defaults write com.apple.LaunchServices/com.apple.launchservices.secure \
        LSHandlers -array-add \
        '{LSHandlerContentType='"${LSHandlerContentType}"';LSHandlerRoleAll='"${macos_default_editor_bundleID}"';}'
done

echo "NOTE: You'll need to restart for the changes to take effect!" # This advice courtesy of https://apple.stackexchange.com/a/123834 (an answer on [this stackexchange thread](https://apple.stackexchange.com/questions/123833/replace-text-edit-as-the-default-text-editor), also linked above).
