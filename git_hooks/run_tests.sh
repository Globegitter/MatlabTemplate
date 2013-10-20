matlab -nosplash -nodesktop –nojvm –noFigureWindows -nodisplay -r "result=run(moduleTests); if result.Failed > 0 exit(1); else exit(0); end"
