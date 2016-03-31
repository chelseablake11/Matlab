% PROJECT 2
% Sarah, Charity, and Chelsea
% 4/23/2014

%% Prep for function
function [ c ] = FunctionNewtons(a,t,N,f,fp)
     

% f = function of interest
% fp = inputed derivative of f
% a = guess 
% t = tolerance
% N = max number of iterations


p=0;    % previous approximation
n=0;    % intializes n at 0
format long % formats the numbers so that they display to more decimal places

%%Newtons function
 while abs((a-p)/a)>= t  && n<=N    % rel. error = (current-previous)/current
     n=n+1; % adds 1 to the count of n
     p=a; % sets p equal to a so that the previous approximation is now the new previous approximation
     a=a-f(a)/fp(a); % newtons method formula      
 end % for while
if n==N % if reaches max number of iterations
   c=('No solution'); % outputs error message if reach max number of iterations
end % for if
c=a; % sets c = a for next loop
end % for function
