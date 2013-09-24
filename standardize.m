function [X,ms,sds] = standardize(X,zeroOutNaNs)
% standardize shifts and scales each of the rows of a matrix so it has mean
%    0 and variance 1.
%
%   [Z,M,S] = standardize(X) shifts and scales each row of a matrix so it
%   has mean 0 and variance 1. The adjusted matrix is returned as Z. Mean
%   of each row is returned in M. Standard deviation of each row is
%   returned in S. 
%
%   [Z,M,S] = standardize(X,zeroOutNaNs) if zeroOutNaNs is true in addition
%   to standardizing the rows of X the NaNs are also replaced by 0. 
%
%   Vladimir Jojic, 2012

narginchk(1,2);

if nargin==1
    zeroOutNaNs = 0;
end

ms = nanmean(X,2);
sds = nanstd(X,0,2);
X = X-repmat(ms,[1 size(X,2)]);
X = X./repmat(1e-13+sds,[1 size(X,2)]);
if zeroOutNaNs
    X(find(isnan(X))) = 0;
end