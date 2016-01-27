# MAKE DIRECTORY AND ENTER

# this actually isn't stored as an executable since it deals with traversing the file system realitive to the path 
# its executed in.
# 
# it lives in my .zshrc

function makeDirectoryAndEnter() {
    if [ $# -eq 0 ]; then
        echo "No Argument Was Passed"
        return 0
    fi

    directory=$1

    if [ -d $directory ]; then
        echo "\"${directory}\" already exists in this directory"
        return 0
    fi

    mkdir $directory
    cd $directory

    echo "\033[0;32m-------------------------------------------------------"
    echo "\033[0;32m| \"${directory}\" created and entered successfully."
    echo "\033[0;32m-------------------------------------------------------"
}