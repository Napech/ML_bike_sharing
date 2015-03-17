io.input('data/extended_features.in')

dataset = {}
for i=1, 10886 do
    dataset[i] = {}
    dataset[i][1] = torch.Tensor(60)
    dataset[i][2] = torch.Tensor(1)
    for j=1, 60 do
    	dataset[i][1][j] = io.read("*number")
    end
    dataset[i][2][1] = io.read("*number")
end

testset = {}
for i=1, 6493 do
    testset[i] = {}
    testset[i][1] = torch.Tensor(60)
    for j=1, 60 do
    	testset[i][1][j] = io.read("*number")
    end
end