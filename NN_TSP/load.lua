io.input('data/data.in')

dataset = {}
for i=1, 10000 do
    dataset[i] = {}
    dataset[i][1] = torch.Tensor(12)
    dataset[i][2] = torch.Tensor(13)
    for j=1, 12 do
       dataset[i][1][j] = io.read("*number")
    end
    for j=1, 13 do
       dataset[i][2][j] = io.read("*number")
    end
end

testset = {}
for i=1, 6500 do
    testset[i] = {}
    testset[i][1] = torch.Tensor(12)
    for j=1, 12 do
    	testset[i][1][j] = io.read("*number")
    end
end
