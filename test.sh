#!/bin/bash

function ver_idf() {
    local_version=0.0.0

    latest_version=$(curl -s https://api.github.com/repos/Harshj054/test/releases/latest | grep '"tag_name":' | cut -d '"' -f 4)

    if [ "$local_version" != "$latest_version" ]; then
        echo "Your version ($local_version) is outdated. The latest version is $latest_version."
        read -p "Do you want to update to the latest version? (y/n): " choice
        if [ "$choice" == "y" ]; then
            echo "Updating to version $latest_version..."
            wget -O "$0" https://raw.githubusercontent.com/Harshj054/test/main/test.sh
            echo "Update completed."
            local_version=$latest_version
        else
            echo "Update canceled."
        fi
    else
        echo "You are using the latest version ($local_version)."
        local_version=$latest_version
    fi
}

ver_idf
