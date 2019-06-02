% Rebalance every 5 days, and on the first and last decision days
rebalIdx = union(1:5:lastDecDay, [1 lastDecDay]);
        
recomputeSolution = true; 
if recomputeSolution
    
    rollPos = cell(1, valuation.nTrials); 
    rollValue = cell(1, valuation.nTrials);
    tic
    for i = 1:valuation.nTrials
        
        fprintf('Performing rolling intrinsic valuation path %5d of %5d\n', i, valuation.nTrials);
        
        bid = paths{i}(1:lastDecDay,1:length(valuation.expDates)) - valuation.liquiditySpread/2;
        ask = paths{i}(1:lastDecDay,1:length(valuation.expDates)) + valuation.liquiditySpread/2;
        
        [rollPos{i}, rollValue{i}] = optimizeRollingStorage(facility, bid,...
            ask, contract, valuation, rebalIdx);
        
    end
    toc