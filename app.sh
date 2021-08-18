# NOTE:
# File timestamps below are in seconds from epoch

# User input file path
echo 'Enter path to .pgp files (without trailing /): '
read filepath

# 30 days (in seconds)
flagAge=$((30*60*60*24))
# current time (in seconds) from epoch
nowTimestamp=$(date +%s)

for file in $filepath/*.pgp
do
  echo $file
  # unix
  #fileTimestamp=$(stat -f "%B" $file)
  fileTimestamp=$(stat -c '%Y' $file)
  # age of file
  fileAge=$((nowTimestamp-fileTimestamp))

  if ((flagAge < fileAge))
  then
    echo $file is old!
#    rm $file
  fi

done