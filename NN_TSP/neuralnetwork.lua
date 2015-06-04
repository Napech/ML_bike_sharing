require "nn"

import('datacleaning.lua')

mlp = nn.Sequential();

inputs = dataset[1][1]:size(1); outputs = dataset[1][2]:size(1); HUs = 300; -- parameters
io.write("Inputs size is ", inputs, "\n")
io.write("Outputs size is ", outputs, "\n")

mlp:add(nn.Linear(inputs, HUs))
mlp:add(nn.Tanh())
mlp:add(nn.Linear(HUs, HUs))
mlp:add(nn.Sigmoid())
mlp:add(nn.Linear(HUs, HUs))
mlp:add(nn.Tanh())
mlp:add(nn.Linear(HUs, outputs))

criterion = nn.MSECriterion()  
trainer = nn.StochasticGradient(mlp, criterion)
trainer.learningRate = 0.01
trainer.maxIteration = 2
trainer.verbose=false


nerr = 100000
err_min = nerr
count = 0
learningRateDecay = 0.001
maxiter = 100
bestcount = 0
while (nerr <= 1.5*err_min and count < maxiter) do
      if (bestcount < count - 15) then count = maxiter end
      count =count+1
      nerr = 0
      trainer.learningRate = trainer.learningRate / (1+learningRateDecay)
      trainer:train(dataset)
      for i=1, validationset.size() do
      	  nerr = nerr + criterion:forward(mlp:forward(validationset[i][1]),validationset[i][2])
      end
      nerr = nerr / (validationset.size())
      if nerr < err_min then 
      	 err_min = nerr 
	 mlp2 = mlp:clone('weight','bias')
	 bestcount = count
      end
      io.write("Validation error : ")
      io.write(nerr)
      io.write("\n")
      io.write("Minimum validation error : ")
      io.write(err_min)
      io.write("\n")
end

io.output('data/result.txt')
result = {}
for i=1, testset.size() do
    result[i] = (mlp2:forward(testset[i][1]))[1]
    temp = tostring(result[i])
    io.write(temp .. "\n")
end

