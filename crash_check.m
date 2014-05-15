function [value, it] = crash_check(th,ph,value,x,it,j)
%CRASH_CHECK This function checks if a crash has occurred
%   Detailed explanation goes here

% CHANGE   
% Instead of checking for intersection with track, why not check to see if
% all candidate nodes are zero??
for k = 1:16 % does track k intersect path from iteration it?
    [XI,YI] = curveintersect(th(k),ph(it,j));
    if (isempty(XI)==0)
        % if there is a crash then set the node value for this
        % position to effectively zero for purposes of
        % comparison (I don't want to set it to zero because
        % that messes up the chromosone during mutation). Then,
        % set it = it - 2
        value(x(it,2),x(it,1),j) = 0.0001;
        
        % delete object handles for this branch
        delete(ph(it,j));
        delete(ph(it-1,j));
        delete(ph(it-2,j));
        it = it - 3; % go back 2 iterations and try again
        
        % if line intersects with track, then plot intersection
        % plot(XI,YI,'r*')
        return; % break out of collision check loop
    end
end
end

