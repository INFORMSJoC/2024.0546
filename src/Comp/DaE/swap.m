function z = swap(i,j,k)
% swap: to relabel the links that helps we figure out the robust links.
    if k==i || k ==j
        z = -1;
    end
    if k<i && k<j
        z = k;
    end
    if k>i && k<j
        z = k-1;
    end
    if k<i && k>j
        z = k-1;
     end
     if k>i && k>j
        z = k-2;
    end

end

