require "nn"

import('datacleaning.lua')

mlp = nn.Sequential();

inputs = 10; outputs = 3; HUs = 200; -- parameters
mlp:add(nn.Linear(inputs, HUs))
mlp:add(nn.Tanh())
mlp:add(nn.Linear(HUs,HUs))
mlp:add(nn.Tanh())
mlp:add(nn.Linear(HUs,HUs))
mlp:add(nn.Tanh())
mlp:add(nn.Linear(HUs,HUs))
mlp:add(nn.Tanh())
mlp:add(nn.Linear(HUs, outputs))

criterion = nn.MSECriterion()  
trainer = nn.StochasticGradient(mlp, criterion)
trainer.learningRate = 0.01
trainer.learningRateDecay = 0.001
trainer.maxIteration = 200
trainer:train(dataset)

result = {}
for i=1, testset.size() do
    result[i] = (mlp:forward(testset[i][1]))[3]
    temp = tostring(result[i])
    io.write(temp .. "\n")
end

