io.input('data/data.in')

dataset = {}
for i=1, 6200 do
    dataset[i] = {}
    dataset[i][1] = torch.Tensor(20)
    dataset[i][2] = torch.Tensor(21)
    for j=1, 20 do
       dataset[i][1][j] = io.read("*number")
    end
    for j=1, 21 do
       dataset[i][2][j] = io.read("*number")
    end
end

testset = {}
for i=1, 3800 do
    testset[i] = {}
    testset[i][1] = torch.Tensor(20)
    for j=1, 20 do
       testset[i][1][j] = io.read("*number")
    end
end
