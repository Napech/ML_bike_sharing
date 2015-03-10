require "nn"

import('data/trainset.lua')

mlp = nn.Sequential();

inputs = 10; outputs = 3; HUs = 20; -- parameters
mlp:add(nn.Linear(inputs, HUs))
mlp:add(nn.Sigmoid())
mlp:add(nn.Linear(HUs, HUs))
mlp:add(nn.Sigmoid())
mlp:add(nn.Linear(HUs, outputs))

criterion = nn.MSECriterion()  
trainer = nn.StochasticGradient(mlp, criterion)
trainer.learningRate = 0.01
trainer.learningRateDecay = 0.01
trainer.maxIteration = 100
trainer:train(dataset)


