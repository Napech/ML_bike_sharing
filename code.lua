require "nn"
dataset={};
function dataset:size() return 100 end -- 100 examples
for i=1,dataset:size() do 
  local input = torch.randn(2);     -- normally distributed example in 2d
  local output = torch.Tensor(1);
  if input[1]*input[2]>0 then     -- calculate label for XOR function
    output[1] = -1;
  else
    output[1] = 1
  end
  dataset[i] = {input, output}
end

mlp = nn.Sequential();  -- make a multi-layer perceptron
inputs = 2; outputs = 1; HUs = 8; -- parameters
mlp:add(nn.Linear(inputs, HUs))
mlp:add(nn.Tanh())
mlp:add(nn.Linear(HUs, HUs))
mlp:add(nn.Tanh())
mlp:add(nn.Linear(HUs, outputs))
mlp:add(nn.Tanh())

criterion = nn.MSECriterion()  
trainer = nn.StochasticGradient(mlp, criterion)
trainer.learningRate = 0.01

dataset2={};
function dataset2:size() return 100 end -- 100 examples
for i=1,dataset2:size() do 
  local input = torch.randn(2);     -- normally distributed example in 2d
  local output = torch.Tensor(1);
  if input[1]*input[2]>0 then     -- calculate label for XOR function
    output[1] = -1;
  else
    output[1] = 1
  end
  dataset2[i] = {input, output}
end

for i=1,20 do
trainer:train(dataset)
if i % 1 == 0 then
err = 0
for i =1, dataset2.size() do
	local pred = mlp:forward(dataset2[i][1])
  	local err2 = criterion:forward(pred, dataset2[i][2])
	--y = mlp:forward(dataset2[i][1])
	--err = err + (y[1] - dataset2[i][2][1])^2
	err = err + err2
	
end
print('Test Error' , err)
end
end

