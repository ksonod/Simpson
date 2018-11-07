% This MATLAB program can conduct numerical integral for functions of
% one variable using Simpson's rule.
% You can adjust two parts of the program labeled by [1] and [2].
% In [1], you can set the range of the integral and the number of
% segments.
% In [2], you can choose any functions with one variable x only if
% there are no singularities.
% 07/11/2018


%[1]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters you can adjust.
xmin= 0;    % The lower limit of the integral range
xmax= pi;   % The upper limit of the integral range
N=100000; % # segments. This must be a large even number.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Showing the calculated result.
Result=Simpson(xmin,xmax,N);
if Result==inf
    disp('Calculation failed.');
else
    display(Result);
end

clear xmin xmax N Result;

function ret=f(x)
%[2]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% You can enter any functions. 
   ret= sin(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end


function ret=Simpson(xint, xfin, N)
% Simpson method for integration.
    Se=0;
    So=0;

    if xint==xfin 
        ret=0;
    else
        h=(xfin-xint)/N;
 
        for j=1:1:N/2-1
            xa=xint+h*2*j;
            Se=Se+f(xa);
        end

        for j=1:1:N/2
            xa=xint+h*(2*j-1);
            So=So+f(xa);
        end

        ret=h/3*(f(xint)+2*Se+4*So+f(xfin)) ;
    end
end