%Load the data as x & y first

num = length(x);
X = x;
Y = y;

k = 3;
iter = num;
%

numbers = ones(num,1);
while iter>k
%
    rows = length(X);
    dist = [];
    for j = 1:rows
        dist(j,:) = sqrt((X-X(j)).^2 + (Y-Y(j)).^2);
    end
    dist = dist+eye(rows)*max(dist(:));
    [x_i,y_i] = find(dist == min(dist(:)));

    X(x_i(1)) = X(x_i(1))+X(x_i(2)); X(x_i(2)) = [];
    Y(x_i(1)) = Y(x_i(1))+Y(x_i(2)); Y(x_i(2)) = [];
        
    numbers(x_i(1)) = numbers(x_i(1))+numbers(x_i(2)); numbers(x_i(2)) = [];
    
    plot(X./numbers,Y./numbers,'*')
    axis([-6 6 -6 6])
    getframe(gcf);
    
    iter = iter-1;
end

plot(X./numbers,Y./numbers,'o')
hold on 
plot(x,y,'.')


    
    