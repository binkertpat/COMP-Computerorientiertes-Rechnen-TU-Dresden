function directedGraphExtendedVersion(k, n)
    % get numbers with unique single numbers
    uniqueNumbers = helperFunction_numbersWithoutNonUniqueSingleNumbers(n);
    
    % calculate K
    for i = 1:length(uniqueNumbers)
        K1(i) = K(uniqueNumbers(i), k);
    end
    
    % comment out for two-length-numbers
    % comment in for three-length-numbers
    % change last number for number of drawing connections to an K()
    % [uniqueNumbers K1] = helperFunction_manipulateArrayForBetterViewing(uniqueNumbers, K1, 2);

    G = digraph(cellstr(string(uniqueNumbers)), cellstr(string(K1)),[]);
    plotGraph = plot(G,'layout','force','UseGravity',true);
    
    labelForStyle = plotGraph.NodeLabel;
    plotGraph.NodeLabel = '';
    xAxisDatas = get(plotGraph, 'XData');
    yAxisDatas = get(plotGraph, 'YData');
    text(xAxisDatas, yAxisDatas, labelForStyle, 'FontSize',12, 'FontWeight','bold', 'HorizontalAlignment','center', 'VerticalAlignment','bottom')
    camroll(90);