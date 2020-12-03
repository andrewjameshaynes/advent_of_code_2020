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

how_many_trees = []
for i = 1:number_of_rows
    print([i, 1+i, mod2((1 + 3*i), width_of_infinite_field)])
	check = trees[1 + i][mod3((1 + 3*i), width_of_infinite_field)]
	if check == '#'
		push!(how_many_trees,1)
	end
end

sum(how_many_trees)

