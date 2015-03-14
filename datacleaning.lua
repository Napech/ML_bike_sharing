import 'data/dataset.lua'

function center(a,b,data)
   mean = 0.0
   var = 0.0	
   for i=1, data.size() do
       mean = mean + data[i][a][b]
   end
   mean = mean / data.size()
   for i=1, data.size() do
       data[i][a][b] = data[i][a][b] - mean
       var = var + data[i][a][b] * data[i][a][b]
   end
   var = var / data.size()
   sigma = math.sqrt(var)
   for i=1, data.size()  do
       data[i][a][b] = data[i][a][b] / sigma
   end
end

function apply_log(a,b,data)
    for i=1, data.size() do
      data[i][a][b]= math.log(data[i][a][b]+1)
   end
end
   
for i=1, 10 do
    center(1,i,dataset)
    center(1,i,testset)
end

for i=1, 3 do
    apply_log(2,i,dataset)
end