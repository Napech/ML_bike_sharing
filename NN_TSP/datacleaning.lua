import 'load.lua'

function center(a,b,data,test)
   mean = 0.0
   var = 0.0	
   for i=1, table.getn(data) do
       mean = mean + data[i][a][b]
   end
   mean = mean / table.getn(data)
   for i=1, table.getn(data) do
       data[i][a][b] = data[i][a][b] - mean
       var = var + data[i][a][b] * data[i][a][b]
   end
   var = var / table.getn(data)
   sigma = math.sqrt(var)
   for i=1, table.getn(data)  do
       data[i][a][b] = data[i][a][b] / sigma
   end

   for i=1, table.getn(test) do
       test[i][a][b] = test[i][a][b] - mean
       test[i][a][b] = test[i][a][b] / sigma
   end
end

function apply_log(a,b,data)
    for i=1, table.getn(data) do
      data[i][a][b]= math.log(data[i][a][b]+1)
   end
end

function reduce(data, test)
   for i=1, data[1][1]:size(1) do
      center(1,i,data,test)
   end

   for i=1, data[1][2]:size(1) do
      apply_log(2,i,data)
   end
end

function split_dataset(dataset,ndata,val)	
   i_val = 1
   i_ndata = 1
   for i=1, table.getn(dataset) do
       if (i % 8) == 0 then
       	  val[i_val] = dataset[i]
	  i_val = i_val+1
       else
	  ndata[i_ndata]=dataset[i]
	  i_ndata = i_ndata +1
       end
   end
end



val = {}
ndata = {}

-- extract_features(dataset,ndata)
-- dataset = ndata
ndata={}
-- extract_features(testset,ndata)
-- testset=ndata
reduce(dataset,testset)
ndata={}
split_dataset(dataset, ndata, val)
validationset = val
dataset = ndata


function validationset:size() return table.getn(validationset) end
function dataset:size() return table.getn(dataset) end
function testset:size() return table.getn(testset) end


