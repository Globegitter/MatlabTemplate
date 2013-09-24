function [beta0,beta]=coordAscentENet(y,x,lambda,alpha,init)
% check input sizes
assert(size(y,1)==size(x,1) && size(y,1)>1);
n = size(y,1);
k = size(x,2);

% initialize parameters
if ~isempty(init)
    beta0 = init{1};
    beta = init{2};
else
    beta0 = mean(y);
    beta = 0.1*ones(k,1);
end

% assume default tolerance and number of iterations
TOL = 1e-5;
MAXIT = 100;

% tracking likelihood
lls = zeros(MAXIT,1);
prevll = -realmax;


ll = loglik(y,x,lambda,alpha,beta0,beta);
iter = 0;

%close all;
%figure(1);
%clf
%ax1 = axes('Position',[0.1 0.85 0.7 0.045])
%ax2 = axes('Position',[0.1 0.8 0.7 0.045]);
%ax3 = axes('Position',[0.81 0.3 0.09 0.49]);
%ax4 = axes('Position',[0.1 0.3 0.7 0.49]);
%ax5 = axes('Position',[0.1 0.05 0.8 0.2]);
while ll-prevll > TOL && iter < MAXIT
    iter = iter+1;
    prevll = ll;
    
    % updates
    beta0 = 1/n*sum(y - x*beta);
    for j=1:k
        beta(j) = 0;
        beta(j) = 1/(sum(x(:,j).^2) + lambda*(alpha)) * shrinkThreshold((y - beta0 - x*beta)'*x(:,j),(1-alpha)*lambda);
    end
    
    % likelihood for new state
    ll = loglik(y,x,lambda,alpha,beta0,beta);
    
    assert(ll-prevll>=0)
    
    lls(iter) = ll;
    
    %axes(ax1);cla;
    %imagema(y');
    %title(['ElasticNet fit with $$\sum_i (y_i - \beta_0 - x_i''\beta)^2 - '...
    %       num2str(alpha*lambda/2) '\sum_j \beta_j^2 - ' ...
    %       num2str((1-alpha)*lambda) '\sum_j |\beta_j|$$'],'Interpreter','Latex');
        
    %set(gca,'XTick',[],'YTick',1,'YTickLabel','y','TickLength',[0 0]);
    
    %axes(ax2);cla;
    %imagema((beta0 + x*beta)');
    %set(gca,'XTick',[],'YTick',1,'YTickLabel','beta0 + X*beta','TickLength',[0 0]);
    
    %axes(ax3);cla;
    %barh(flipud(beta));
    %title('beta')
    %set(gca,'YTick',[]);
    %ylim([0.5 length(beta)+0.5])
    %xlim([-max(abs(beta)+1e-3) max(abs(beta)+1e-3)])
    
    %axes(ax4);cla;
    %imagema(x');
    %set(gca,'XTick',[],'YTick',[size(x,2)/2],'YTickLabel','X');
    
    %axes(ax5);cla;
    %plot(lls(1:iter))
    %xlabel('iteration');
    %ylabel('penalized log-likelihood');
end

function ll = loglik(y,x,lambda,alpha,beta0,beta)
n = size(y,1);
ll = -1/2*(y - beta0 - x*beta)'*(y - beta0 - x*beta)...
    -alpha*lambda/2*sum(beta.^2) - (1-alpha)*lambda*sum(abs(beta));

function b = shrinkThreshold(b,lambda)
b = sign(b).*max(abs(b) - lambda,0);

