#!/bin/bash

PROGNAME=$(basename $0)

usage(){
  echo "Usage: $PROGNAME [OPTIONS] FILE"
  echo "OPTIONS:"
  echo "  -h, --help"
  echo "  [--from_dir from_dir]"
  echo "  --to_dir to_dir"
  echo
  exit 1
}

for arg in "$@"
do
  case "$arg" in
    '-h'|'--help' )
      usage
      exit 1
      ;;
    '--from_dir' )
      if [ -z "$2" ] || [[ "$2" =~ ^-+ ]]; then
        shift 1
      else
        cd "$2"
        shift 2
      fi
      ;;
    '--to_dir' )
      if [ -z "$2" ] || [[ "$2" =~ ^-+ ]]; then
        echo "$PROGNAME: option requires an argument -- $1" 1>&2
        exit 1
      fi
      TO_DIR="$2"
      shift 2
      ;;
    -*)
      echo "$PROGNAME: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
      exit 1
      ;;
  esac
done

DESTNAME=$(basename $TO_DIR)

ls -1 | grep -v zip | grep -v "$DESTNAME" | while read line
do
  mv $line $TO_DIR
done
