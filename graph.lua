local gp = require('lua-gnuplot/gnuplot')
-- gp.bin = '/usr/local/bin/mygnuplot'
-- data is 'array-like' {0,1},{4,4}
function plot(data,path)
   local g = gp{
      -- all optional, with sane defaults
      width  = 640,
      height = 480,
      xlabel = "X axis",
      ylabel = "Y axis",
      key    = "top left",
      consts = {
	 gamma = 2.5
      },
      
      data = {
	 gp.array {  -- plot from an 'array-like' thing in memory. Could be a
	    -- numlua matrix, for example.
	    data,
--            title = "Title 2",          -- optional
--            using = {1,2},              -- optional
--            with  = 'linespoints'       -- optional
	 },
      }
   }
   g:plot(path)
end

-- local data = 
--    {{0,1,2,3,4,5,6,7,8,9},  -- x
--     {3,4,5,6,7,8,9,8,7,6}   -- y
--    }
-- plot(data,"test.pdf")