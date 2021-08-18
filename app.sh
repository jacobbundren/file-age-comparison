#for i in {1..3}
#do
#  echo > files/${i}.pgp
#done

# NOTE:
# File timestamps below are in seconds from epoch

# 30 days (in seconds)
flagAge=$((30*60*60*24))
# current time (in seconds) from epoch
nowTimestamp=$(date +%s)

for file in files/*.pgp
do
  echo $file
  # unix
  #fileTimestamp=$(stat -f "%B" $file)
  # linux (most likely case. time of last data modification)
  fileTimestamp=$(stat -c '%y' $file)
  # age of file
  fileAge=$((nowTimestamp-fileTimestamp))

  if ((flagAge > fileAge))
  then
    echo $file is old!
    rm $file
  fi

done