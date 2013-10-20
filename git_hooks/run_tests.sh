matlab -nosplash -nodesktop –nojvm –noFigureWindows -nodisplay -r "result=run(modulesTest); disp(result); disp(result(0).Failed); if (result.Failed > 0) exit(1); else exit(0); end"
