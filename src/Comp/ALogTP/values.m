function z = values(L,num,e,d,gra1,lin)
    z = zeros(size(gra1,1),num);
    for i = 1:size(gra1,1)
        z(i,:) = value(num,L,e,d,gra1(i,:),lin);
    end
end

