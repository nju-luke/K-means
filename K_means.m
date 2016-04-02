%Load the data as x & y first

num = length(x);
X = x;
Y = y;


k = 3;
iter = 100;

weighX = rand(3,1)*(max(X)-min(X))+min(X);
weighY = rand(3,1)*(max(Y)-min(Y))+min(Y);
%
while iter>0
    dist = [];
    for j = 1:k
        dist(j,:) = sqrt((weighX(j)-X).^2+(weighY(j)-Y).^2);
    end
    [~,I] = max(dist);
    for j = 1:k
        weighX(j) = sum(X(I==j))/sum(I==j);
        weighY(j) = sum(Y(I==j))/sum(I==j);
    end
    plot(weighX,weighY,'*')
    axis([-6 6 -6 6])
    title(['Iter = ',num2str(iter)])
    getframe(gcf);
    iter = iter-1;
end
%
plot(weighX,weighY,'*')
hold on 
plot(x,y,'.')

