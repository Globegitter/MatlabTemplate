matlab -nosplash -nodesktop –nojvm –noFigureWindows -nodisplay -r "result=run(moduleTests); disp(result); for i=1:length(result) if (result(i).Failed > 0) exit(1); end; end; exit(0);"
