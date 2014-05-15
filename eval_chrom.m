function [myCar,myChrom,ph] = eval_chrom(myCar,myChrom,smin,smax,j,ph,ch,its,clr)
%EVAL_CHROM This function determines the fitness of the chromosome
%   This function determines the fitness of the chromosome by evaluating
%   the path that a particle would take when using said chromosome. Each
%   iteration of the main while loop updates the position and velocity of
%   particle j as it navigates the track. Execution of this function stops
%   if particle finishes tracks
it = 1;
while it < its % Iteration it
    % get subset of candidate nodes that particle can reach (9). Find the
    % best out of the nine possible candidate nodes
    [bestc,bestv,canValue,myCar] = ...
        candidate_search(myCar,myChrom,smin,smax,j,it);
    
    % if candidate nodes are all 0, then go an iteration and try again
    if ( nnz(canValue) ==  0)
        myChrom(j).COPY_value(myCar(j).pos(it,2),myCar(j).pos(it,1)) = 0;
        % delete object handles for this branch
        if (it>2) % don't want to delete nonexistent handle!
            delete(ph(it-1,j));
            %             delete(ph(it-2,j));
        end
        it = it - 1; % go back 1 iteration and try again
        % if it = 0, give up on this car without setting done=1
        if (it==0)
            return;
        end
        %assert(it>0, 'Error: Iteration = 0!');
        continue;
    end
    myCar(j).vel(it+1,:) = bestv;
    myCar(j).pos(it+1,:) = bestc;
    % plot line for path of particle
    ph(it,j) = line([myCar(j).pos(it,1),myCar(j).pos(it+1,1)],...
        [myCar(j).pos(it,2),myCar(j).pos(it+1,2)]); hold on;
    set(ph(it,j),'Color',clr(j,:));
    
    % plot line for path of particle on the next iteration. check if path
    % intersects with checkpoint fit
    [XI,YI] = curveintersect(ch(myCar(j).check),ph(it,j));
    if (isempty(XI)==0) % if XI is not empty, there is intersect
        myCar(j).check = myCar(j).check + 1;
        if (myCar(j).check == 11) % end of track
            myChrom(j).fit = it;
            myCar(j).done = 1;
            return;
        end
    end
    it = it + 1; % increment the while loop
end
end