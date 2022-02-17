function directedGraph(k,n)
    output = zeros(1);
    knotNames = string(zeros(1));
    
    % save calculated steps and knot names
    for i = 1:k + 1
       output(i) = i;
       knotNames(i) = K(n,i);
    end

    % start vector
    startID = output;
    startID(k + 1) = [];
    
    % end vector
    endID = output;
    endID(1) = [];

    % plot directed graph
    G = digraph(startID,endID,[],cellstr(knotNames));
    plotGraph = plot(G);
    camroll(90);
    
    %some style elements for better viewing
    labelForStyle = plotGraph.NodeLabel;
    plotGraph.NodeLabel = '';
    xAxisDatas = get(plotGraph, 'XData');
    yAxisDatas = get(plotGraph, 'YData');
    text(xAxisDatas, yAxisDatas, labelForStyle, 'FontSize',16, 'FontWeight','bold', 'HorizontalAlignment','center', 'VerticalAlignment','bottom')
end
