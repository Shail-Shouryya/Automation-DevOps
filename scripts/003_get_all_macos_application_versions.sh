# shows the version number for all applications in the /Applications/ directory
for app in /Applications/*
do
    printf "Currently running $app Version: "
    cat "${app}"/Contents/Info.plist | tr '\t' ' ' | tr '\n' ' ' | grep -ie "<key>CFBundle\(\w\+\)\?Version\w\+</key>  <string>[0-9\.]\+" -o | cut -d ">" -f 4
done
