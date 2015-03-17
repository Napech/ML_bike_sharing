dofile 'graph.lua'
dofile 'data/dataset.lua'
dataX = {}
dataY = {}

for i=1, 100 do
   dataX[i] = i
   dataY[i] = 2*i
end

plot({dataX, dataY}, "test.svg")