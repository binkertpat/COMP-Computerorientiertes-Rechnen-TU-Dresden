function plotPrimal(maximum)
    hold on
    x = zeros(maximum-1);
    y = zeros(maximum-1);
    for i = 2:1:maximum
        x(i-1) = i;
        y(i-1) = primal(i);
    end
    set(gcf,'color','w');
    plot(x,y);
    title('primal()-function plot')
    xlabel('Number');
    ylabel('primal(n)');
    hold off;
end