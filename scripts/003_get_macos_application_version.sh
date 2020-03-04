APPLICATION_NAME="YOUR_APPLICATION" # since the application name is stored in a string, you do NOT need to escape spaces as you would if you were running the following line directly from terminal
cat /Applications/"${APPLICATION_NAME}".app/Contents/Info.plist | tr '\t' ' ' | tr '\n' ' ' | grep -ie "<key>CFBundle\(\w\+\)\?Version\w\+</key>  <string>[0-9\.]\+" -o

echo
echo "Options for YOUR_APPLICATION include:"
ls /Applications/
echo
echo "NOTE: Make sure you leave out the \".app\" part when changing APPLICATION_NAME"
echo
