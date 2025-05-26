#! /bin/sh -
file=./inc
case "$#:$1" in
   (1:in) incr=4;;
  (1:out) incr=-2;;
      (*) echo >&2 'need "in" or "out" as the one and only one argument'
          exit 1
esac

awk -v incr="$incr" '
  {print $0 + incr > FILENAME; exit}
  END {if (!NR) print incr > FILENAME}' 3<> "$file" "$file"
