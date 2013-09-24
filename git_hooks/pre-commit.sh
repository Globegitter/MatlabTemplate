git stash -q --keep-index
if ! git_hooks/run_tests.sh
  then
    echo "User hook '$CMD_NAME' failed"
    exit 1
  fi
#RESULT=$?
git stash pop -q
#[ $RESULT -ne 0 ] && exit 1
exit 0
