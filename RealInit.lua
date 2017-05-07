
	local function CompileFile(exefile)
        print("Compile if need "..exefile.." "..node.heap())
		if file.open(exefile..".lua") then
			file.close()
			
			if file.open(exefile..".lc") then
			  file.close()
			  file.remove(exefile..".lc")
			end
		
			print("Compile File:"..exefile)
			node.compile(exefile..".lua")
			print("Remove File:"..exefile..".lua")
			file.remove(exefile..".lua")
		end
     exefile=nil
	end
 
    local function DoFiles(exefile)
        if gpio.read(1) == 1 then
            if file.open(exefile..".lc") then
                --print(exefile..".lc non voulu")
                dofile(exefile..".lc")
            else
                print(exefile..".lc not exist")
            end
            print("Heap ",node.heap()) 
        end
        exefile=nil
    end

		
	local ToCompileFiles = {
	   'Client',
	   'Server',
	}

	local ToDoFiles = {
	   'Client',
	   'Server',
	}

	for i, f in ipairs(ToCompileFiles) do 
		CompileFile(f);
	end
	ToCompileFiles = nil  
	CompileFile=nil

	for i, f in ipairs(ToDoFiles) do 
		DoFiles(f);
	end
	ToDoFiles=nil
	DoFile=nil
	
