for file in $(pwd)/*; do
    echo $file;
    cat $file;
    printf '*==*%.0s' {1..30};
    printf "\n\n";
done
