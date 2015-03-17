require './SETTINGS'

string.split_it = function(str, sep)
   if str == nil then return nil end
   return string.gmatch(str, "[^\\" .. sep .. "]+")
end
string.split = function(str, sep)
   local ret = {}
   for seg in string.split_it(str, sep) do
      ret[#ret+1] = seg
   end
   return ret
end
local function label_vector(label_name)
   local vec = torch.Tensor(10):zero()
   vec[LABEL2ID[label_name]] = 1.0
   return vec
end
-- TODO: nb of lines here
local TRAIN_N = 10887
-- TODO: no hard code
local NB_PARAMS = 12
local function convert_datetime(s)
   local date = string.split(s, " ")[1]
   local time = string.split(s, " ")[2]
   local year = string.split(date, "-")[1]
   local month = string.split(date, "-")[2]
   local day = string.split(date, "-")[3]
   local hour = string.split(time, " ")[0]
   return({year, month, day, hour})
end

local function convert_row(row)
   return(convert_datetime(row[1]))
end

local maxParameters = 3

local function convert_train()
   local label_file = string.format("%s/train.csv", DATA_DIR)
   local x = torch.Tensor(TRAIN_N, NB_PARAMS)
   local file = io.open(label_file, "r")
   local head = true
   local line
   local i = 1
   for line in file:lines() do
      if head then
	 head = false
      else
	 local row = string.split(line, ",")
	 local convRow = convert_row(row)
	 if i == 1 then
	    print(convRow)
	 end
	 for j=1, table.getn(convRow) do
	    x[i][j] = convRow[j]
	 end
	 if i % 100 == 0 then
	    xlua.progress(i, TRAIN_N)
	 end
	 i = i + 1
      end
   end
   file:close()
   torch.save(string.format("%s/train_x.bin", DATA_DIR), x)
end

-- local TEST_N = 300000
-- local function convert_test()
--    local x = torch.Tensor(TEST_N, 3, 32, 32)
--    local i = 1
--    for i = 1, TEST_N do
--       local img = image.load(string.format("%s/test/%d.png", DATA_DIR, i))
--       x[i]:copy(img)
--       if i % 100 == 0 then
-- 	 xlua.progress(i, TEST_N)
--       end
--    end
--    torch.save(string.format("%s/test_x.bin", DATA_DIR), x)
-- end

print("convert train data ...")
convert_train()
-- print("convert test data ...")
-- convert_test()
