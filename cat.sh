
cat $@ | (while read line
do
  (sleep .00$[ ( $RANDOM % 10 )  + 1 ]s && echo "$line") &
done;
wait) < "${1:-/dev/stdin}"
