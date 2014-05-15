function gene_pool = mutate(gene_pool,mutr,np)
%MUTATE This function mutates the chromosomes provided as argument
%   This function takes the good genes cell array and copies the best
%   chromosome, which is then mutated for each particle. The best gene is
%   stored as the first matrix in value while the other (np-1) genes are put
%   in the other rows of value. The value matrix is then returned as the
%   output

% find chromosome with lowest fitness
[~,I] = max([gene_pool.fit]); 
BestGene = gene_pool(I).value;
msize = numel(BestGene);
for r = 2:np
    m = 1;
    while m < mutr % mutate alleles in BestGene
        MutBestGene = BestGene;
        % select a nonzero allele and mutate it
        allele = randperm(msize,1);
        if (MutBestGene(allele) ~= 0)
            MutBestGene(allele) = rand();
            m = m + 1;
        end
    end 
    gene_pool(r).value = MutBestGene; % insert each chromosome back into value
end
gene_pool(1).value = BestGene; % insert best chromosome
end