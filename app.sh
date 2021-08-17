#for i in {1..3}
#do
#  echo > files/${i}.pgp
#done

# 30 days (in seconds)
flagAge=$((30*60*60*24))

for file in files/*.pgp
do
  echo $file
  nowTimestamp=$(date +%s)
  fileTimestamp=$(stat -f "%B" $file)
  fileAge=$((nowTimestamp-fileTimestamp))

  if ((flagAge < fileAge))
  then
    echo $file is old!
  fi
done