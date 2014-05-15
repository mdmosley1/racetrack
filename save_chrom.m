function gene_pool = save_chrom(myChrom,gene_pool,j)
%SAVE_CHROM This function saves the current chromosome to gene pool
%   This function looks as the current chromosome and copies it into the
%   gene pool if it has a lower fitness than the max fitness in the pool

% save info for this particle

[Y I] = max([gene_pool.fit]);
if (myChrom(j).fit < Y)
    gene_pool(I).fit = myChrom(j).fit; % store fitness level
    gene_pool(I).value = myChrom(j).value; % store chromosome
end
end