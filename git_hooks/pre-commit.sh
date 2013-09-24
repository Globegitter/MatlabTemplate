git stash -q --keep-index
(cd ../ && matlab -nosplash -nodesktop –nojvm –noFigureWindows -nodisplay -r "run(basicTest),quit")
RESULT=$?
git stash pop -q
[ $RESULT -ne 0 ] && exit 1
exit 0
