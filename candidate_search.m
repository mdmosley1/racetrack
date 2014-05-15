function  [bestc,bestv,canValue,myCar] = candidate_search(myCar,myChrom,...
    smin,smax,j,it)
%CANDIDATE_SEARCH This function finds the best candidate node
%   This function takes the current position and velocity and computes nine
%   different candidate nodes. It will not choose a node that results in
%   the velocity breaking the speed limits. It chooses the best candidate
%   and returns the best position, velocity, and the canValue matrix, which
%   is a 3x3 matrix of the values of the nine candidate nodes. This
%   function does not use the original value matrix; it uses a copy of the
%   value matrix so that nodes can be zeroed out without damaging the
%   chromosome.

c = num2cell(zeros(3,3));   % instantiate candidate matrix
canValue = zeros(3,3);      % instantiate candidate value matrix

for a=1:3
    for b=1:3
        % candidate at (a,b) is next position plus one, zero, or minus one
        % Need to limit the acceleration vector by a top speed. If either
        % abs(v(1)) or abs(v(2)) is greater than 4, then
        myCar(j).acc = [a-2 b-2];
        myCar(j).vel(it+1,:) = myCar(j).vel(it,:) + myCar(j).acc;
        speed = sqrt( myCar(j).vel(it+1,1)^2 + myCar(j).vel(it+1,2)^2 );
        if (speed > smax || speed < smin)
            %zero acceleration
            myCar(j).vel(it+1,:) = myCar(j).vel(it,:);
        end
        % store candidate in cell array
        c(a,b) = {myCar(j).pos(it,:) + myCar(j).vel(it+1,:)}; 
        % convert array within cell of candidate matrix to cell array. It
        % needs to be flipped because rows and columns are specified in the
        % reverse order as coordinates.
        C = num2cell(c{a,b}); C = fliplr(C);
        canValue(a,b) = myChrom(j).COPY_value(C{1,:});
        % Check to see if myCar has already been to candidate location
        s = size(myCar(j).pos); s = s(1);
        for k=1:s
            if (myCar(j).pos(k,:)==c{a,b})
                canValue(a,b) = 0;
                break;
            end
        end
        if (a == 1 && b == 1)   % if first time
            bestc = c{1,1};
            bestv = myCar(j).vel(it+1,:);
        elseif (canValue(a,b) > myChrom(j).COPY_value(bestc(2),bestc(1)))
            bestc = c{a,b};
            bestv = myCar(j).vel(it+1,:);
        end
    end
end
end
