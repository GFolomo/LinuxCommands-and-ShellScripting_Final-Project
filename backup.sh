#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2


# [TASK 2]
echo "target Directory: $targetDirectory"
echo "destination Directory: $destinationDirectory"

# [TASK 3]
currentTS=$(date +%s)

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
origAbsPath=$(pwd)

# [TASK 6]
cd destinationDirectory
destAbsPath=$(pwd)

# [TASK 7]
cd origAbsPath
cd targetDirectory

# [TASK 8]
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# [TASK 9]
declare -a toBackup
for file in $(ls) 
do 
    echo "$file"
done
  # [TASK 10]
  if ((`date -r $file +%s` > $yesterdayTS))
  then 
    # [TASK 11]
    toBackup+=($file)
  fi
  done

# [TASK 12]
# Set the name of the backup file
backupFileName="backupFileName.tar.gz"
# Compress and archive the files
tar -czvf $backupFileName ${toBackup[@]}

# [TASK 13]
# Set the absolute path of the destination directory
destAbsPath=$(pwd)
# Move the backup file to the destination directory
mv $backupFileName $destAbsPath
# Congratulations! You completed the final project for this course!
