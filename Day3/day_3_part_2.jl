using DelimitedFiles
trees = readdlm("day_3_tree_data.txt")

number_of_rows = size(trees,1)
width_of_infinite_field = length(trees[1])

function mod3(x,n)
	if x % n == 0 && x !== 0
		n 
	else 
		x % n
	end
end

function tree_count(right=1,down=3)
	how_many_trees = []
	for i = 1:Int(floor(number_of_rows/down))-down
		check = trees[1 + down*i][mod3((1 + right*i), width_of_infinite_field)]
		if check == '#'
			push!(how_many_trees,1)
		end
	end

	sum(how_many_trees)
end

tree_count(1,1) * tree_count(3,1) * tree_count(5,1) * tree_count(7,1) * tree_count(1,2) 
