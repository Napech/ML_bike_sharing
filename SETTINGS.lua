require 'torch'

torch.setdefaulttensortype('torch.FloatTensor')
torch.setnumthreads(4)

DATA_DIR="./data"

CLASSES = {}
LABEL2ID = {
   datetime = 1,
   season = 2,
   holiday = 3,
   workingday = 4,
   weather = 5,
   temp = 6,
   atemp = 7,
   humidity = 8,
   windspeed = 9,
   casual = 10,
   registered = 11,
   count = 12
}
ID2LABEL = {}
for k, v in pairs(LABEL2ID) do
   ID2LABEL[v] = k
   CLASSES[v] = k
end

return true
