function delete_handles(ph,j)
%DELETE_HANDLES This function deletes object handles
%   This function is responsible for deleting object handles so that the
%   plot does not become too cluttered. An error will occur from deleting a
%   handle that has already been deleted so this function uses ishandle()
%   to check the handle's status first.

number = nnz(ph(:,j));
% iterate through number of nonzero elements in ph, but check if it is
% a handle before deleting it
for g=1:number
    if ( ishandle(ph(g,j)) == 1 )
        delete(ph(g,j));
    end
end
end

