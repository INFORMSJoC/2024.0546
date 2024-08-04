function z = startingpoint(p)
%STARTINGPOINT 

    global L M 
    z = zeros(M+1,1);
    F0 = def(p);
    
    F = zeros(L,2);
    for i = 1:L
        F(i,1) = F0(2*i-1);
        F(i,2) = F0(2*i);
    end

    gammai = zeros(L,1);
    gammaj = zeros(L,1);
    lambda1 = zeros(L,1);
    lambda0 = zeros(L,1);
    sigma1 = zeros(L,1);
    sigma2 = zeros(L,2);
    for k=1:L
        if F(k,1)<F(k,2)
            gammai(k) = 1;
            gammaj(k) = -sqrt(F(k,2)-F(k,1));
            if F(k,1)<0
                lambda0(k) = 1;
                lambda1(k) = -sqrt(-F(k,1));
            end
            if F(k,1)>0
                lambda0(k) = -sqrt(F(k,1));
                lambda1(k) = 1;
            end
        end
        if F(k,1)>F(k,2)
            gammaj(k) = 1;
            gammai(k) = -sqrt(F(k,1)-F(k,2));
            if F(k,2)<0
                lambda0(k) = 1;
                lambda1(k) = -sqrt(-F(k,2));
            end
            if F(k,2)>0
                lambda0(k) = -sqrt(F(k,2));
                lambda1(k) = 1;
            end
        end
    end
    for i=1:L
        z(2*i-1) = lambda0(i);
        z(2*i) = lambda1(i);
        z(2*L+2*i-1) = gammai(i);
        z(2*L+2*i) = gammaj(i);
    end
end

