function bestFit = OptPath(muts,mutr,np,its,smin,smax) % add debug parameter
% OPTPATH
%   This function will use a genetic algorithm to find the optimum path for
%   a car navigating a racetrack

load track_data;

% plot track and return object handles to track pieces
[th,ch,clr] = plot_track(tx,ty,chkx,chky,np,H);

% ----------------------------- Run Simulation --------------------------
% Initialize gene pool
A(1:np,1) = 100; gene_pool = chrom(A);
ph = zeros(its,np); % preallocate path handle matrix
for M = 1:muts % Mutation M
    fprintf('Mutation: %4.0f\n', M)
    if (M>1) % dont mutate on the first iteration
        gene_pool = mutate(gene_pool,mutr,np);
    end
    % initialize np cars and np chromosomes
    A(1:np,1) = 100;
    myChrom = chrom(A);
    myCar = car(A);
    
    for j = 1:np % Car/chrom j
        % initialize chromosome nodes
        myChrom(j).value = init_nodes;
        myChrom(j).COPY_value = myChrom(j).value;
        
        % initialize car values, preallocating arrays for speed
        myCar(j).pos = zeros(its,2); myCar(j).vel = zeros(its,2);
        myCar(j).pos(1,:) = [sx sy]; myCar(j).vel(1,:) = [0 2];
        % delete handles/path for car j from the last mutation cycle
        if (M>1)
            delete_handles(ph,j);
        end
        % evaluate chromosome and return fitness
        [myCar,myChrom,ph] = eval_chrom(myCar,myChrom,smin,smax,j,ph,ch,its,clr);
        
        if (myCar(j).done == 1) % only save gene if car finished
            gene_pool = save_chrom(myChrom,gene_pool,j);
        end
    end
end
gene_pool 
bestFit = min([gene_pool.fit])
end