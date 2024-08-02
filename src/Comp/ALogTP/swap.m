function z = swap(i,j,k)
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

