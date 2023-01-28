
if [ $(find "$@" < "${1:-/dev/stdin}" | wc -l) -gt 0 ]
then
   echo "True"
else
   echo "False"
fi