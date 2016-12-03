function val=gaussian(f,nodes,weights)
    if length(nodes) ~= length(weights)
        disp('gaussian: len(nodes) != len(weights)')
        return
    end
    
    val = 0;
    for i=1:length(nodes)
        val = val + weights(i) * f(nodes(i));
    end
end