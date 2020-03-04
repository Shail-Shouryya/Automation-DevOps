APPLICATION_NAME="APPLICATION_NAME" # since the application name is stored in a string, you do NOT need to escape spaces as you would if you were running the following line directly from terminal
echo "The version number for your currently installed \"${APPLICATION_NAME}\" application is:"
cat /Applications/"${APPLICATION_NAME}".app/Contents/Info.plist | tr '\t' ' ' | tr '\n' ' ' | grep -ie "<key>CFBundle\(\w\+\)\?Version\w\+</key>  <string>[0-9\.]\+" -o | cut -d ">" -f 4

echo
echo "Currently APPLICATION_NAME is set to ${APPLICATION_NAME}"
echo "Options for APPLICATION_NAME include:"
ls /Applications/
echo
echo "NOTE: Make sure you leave out the \".app\" part when changing APPLICATION_NAME"
echo
