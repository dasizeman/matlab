nsamples = 5;
npoints = 5;

for k=1:nsamples
    iterationString = ['Iteration #', int2str(k)];
    disp(iterationString)
    currentData=rand(npoints,1);
    sampleMean(k) = mean(currentData)
end

overallMean = mean(sampleMean);