function x = K(n,k)
    if k == 1
        x = n;
        return;
    else
        x = K((ab(n)-auf(n)), (k-1));
    end
end