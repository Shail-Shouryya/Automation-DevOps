FILE_NAME=yourFileName.someExtension
DIRECTORY=$(pwd)
# to hard code path:
# DIRECTORY=path/to/directory

for file in $DIRECTORY/*; do
    echo $file >> $FILE_NAME;
    cat $file >> $FILE_NAME;
    printf '*==*%.0s' {1..30} >> $FILE_NAME;
    printf "\n\n" >> $FILE_NAME;
done
