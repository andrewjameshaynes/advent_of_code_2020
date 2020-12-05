using DelimitedFiles
boarding_passes = readdlm("boarding_passes.txt")
test = "BFFFBBFRRR"

# define functions 
right = function(x, n) 
	SubString(x,length(x)-n+1, length(x))
end

left = function(x, n) 
	SubString(x, 1, n)
end


function r(x, l) # r for rows
	if x[1] !== x[2]
	difference = (x[2] + 1) - x[1] 
    difference_add = Int(difference / 2)
		if l in ["F", "L"]
			x[2] = x[2] - difference_add
			x
		elseif l in ["B", "R"]
			x[1] = x[1] + difference_add
			x
		end
	else 
		x[1]
	end
end

# run over data 
# hard call multiple times for `r` function due to awkward julia scoping
hold = []

for id in boarding_passes
    row_to_check = left(id, 7)
    columns_to_check = right(id, 3)

	s = split(row_to_check,"")
	row = minimum(r(r(r(r(r(r(r([0,127], s[1]),s[2]),s[3]),s[4]),s[5]),s[6]),s[7]))

	c = split(columns_to_check, "")
	column = minimum(r(r(r([0,7],c[1]),c[2]),c[3]))

	result = (row * 8) + column

	push!(hold, result)
end

maximum(hold)

