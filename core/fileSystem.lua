function read()
-- Path for the file to read
local path = system.pathForFile( "save.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "r" )
 
if not file then
    -- Error occurred; output the cause
    --print( "File error: " .. errorString )
else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    --print( "Contents of " .. path .. "\n" .. contents )
    -- Close the file handle


    io.close( file )

    return contents
end
 
file = nil
end

function save(data)
	-- Path for the file to write
	local path = system.pathForFile( "save.txt", system.DocumentsDirectory )
	--print(path , system.DocumentsDirectory)
	-- Open the file handle
	local file, errorString = io.open( path, "w" )
	--print(file,errorString)
	if not file then
	    -- Error occurred; output the cause
	    --print( "File error: " .. errorString )
	else
	    -- Write data to file
	    file:write(data)
	    -- Close the file handle
	    io.close( file )
	end

	file = nil
end
