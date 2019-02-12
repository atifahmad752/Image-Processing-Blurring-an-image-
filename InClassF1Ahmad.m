function [m] = InClassF1Ahmad(eb)
%(1)
load('RM.mat','RM')
[m,n] = size(RM);
%(2)
for i = 1:n
    C(i,:) = RM(n-i+1,:);
    
    
end
%(3)
[U,S,V] = svd(double(C));
%(4)
denomsum = 0;
for i = 1:n
    denomsum = denomsum + S(i,i);
end

k = 1;
numersum = 0;
while(k<=n)
    for i = 1:k
        numersum = numersum + S(i,i);
    end
    if((numersum/denomsum) > eb)
        m = k;
        break;
    end
    numersum = 0;
    k = k+1;
end
%(5)
for i = 1:n
    u(:,i) = U(:,i);
    v(:,i) = V(:,i);
    sigma(i) = S(i,i);
end

sum = 0;
for i = 1:m
    sum = sum + sigma(i)*u(:,i)*v(:,i)';
end
B = sum;
%(6)
imshow(uint8(B))