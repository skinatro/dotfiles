#!/bin/bash
# Name - ffed.sh (firefox extension downloader)
# Author - Skinatro

# URLs for each extension
privacy_extensions=(
    "https://addons.mozilla.org/firefox/downloads/file/4092158/ublock_origin-1.48.4.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/3902154/decentraleyes-2.0.17.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4090970/noscript-11.4.21.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4064884/clearurls-1.26.1.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4058426/multi_account_containers-8.1.2.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4071150/i_dont_care_about_cookies-3.4.6.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4097901/canvasblocker-1.9.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4047133/user_agent_string_switcher-0.4.9.xpi"
)

customization_extensions=(
    "https://addons.mozilla.org/firefox/downloads/file/4095037/darkreader-4.9.63.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4075896/styl_us-1.5.30.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/3643624/firefox_color-2.1.7.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/3940751/tabliss-2.6.0.xpi"
)

etc_extensions=(
    "https://addons.mozilla.org/firefox/downloads/file/4030629/tampermonkey-4.18.1.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4072586/simple_translate-2.8.1.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4085556/surfingkeys_ff-1.13.0.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4065318/view_page_archive-4.0.0.xpi"
)

youtube_extensions=(
    "https://addons.mozilla.org/firefox/downloads/file/4072734/return_youtube_dislikes-3.0.0.8.xpi"
    "https://addons.mozilla.org/firefox/downloads/file/4085308/sponsorblock-5.3.1.xpi"
)

steam_extensions=(
    "https://addons.mozilla.org/firefox/downloads/file/4054613/augmented_steam-2.4.1.xpi"
)

download_extension() {
    url=$1
    filename=$2
    echo "Downloading $filename"
    wget "$url" -O "$filename"
    if [ $? -ne 0 ]; then
        echo "Error downloading $filename"
        exit 1
    fi
}

download() {
    echo "Now downloading extensions"
    mkdir -p ~/Downloads/firefox
    cd ~/Downloads/firefox

    # download privacy extensions
    for url in "${privacy_extensions[@]}";
    do
        filename=$(echo $url | awk -F"/" '{print $NF}')
        download_extension "$url" "$filename"
    done

    # download customization extensions
    for url in "${customization_extensions[@]}";
    do
        filename=$(echo $url | awk -F"/" '{print $NF}')
        download_extension "$url" "$filename"
    done

    # download etc extensions
    for url in "${etc_extensions[@]}";
    do
        filename=$(echo $url | awk -F"/" '{print $NF}')
        download_extension "$url" "$filename"
    done

    # download youtube extensions
    for url in "${youtube_extensions[@]}";
    do
        filename=$(echo $url | awk -F"/" '{print $NF}')
        download_extension "$url" "$filename"
    done

    # download steam extensions
    for url in "${steam_extensions[@]}";
    do
        filename=$(echo $url | awk -F"/" '{print $NF}')
        download_extension "$url" "$filename"
    done
}
