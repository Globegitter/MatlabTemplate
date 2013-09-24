function h=imagema(expr,varargin)
shouldStandardize = 1;
if length(varargin)
    shouldStandardize = varargin{1};
end

if shouldStandardize     
    nexpr = standardize(expr);
else
    nexpr = expr;
end

S=prctile(abs(nexpr(:)),99.5);

if length(varargin)>1
    S=varargin{2};
end

nexpr(find(abs(nexpr)>S)) = sign(nexpr(find(abs(nexpr)>S)))*S;
im = ceil((nexpr + S)/(2*S)*255);
colormap(redgreencmap(256));
h=image(im);
