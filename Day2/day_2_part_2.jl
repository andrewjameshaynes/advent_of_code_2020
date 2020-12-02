using DelimitedFiles
passwords = readdlm("day_2_passwords.txt")

# Separate out first column into min and max allowed characters
min_max_array = split.(passwords[:,1],"-")

# remove ":" from 2nd column
check_letter_array = replace.(passwords[:,2], ":"=>"")

# run size(findall()) on chosen letter for 
holder=[]
for i = 1:size(passwords, 1)
    println(i)
	min_count = minimum(parse.(Int64, min_max_array[i]))
	max_count = maximum(parse.(Int64, min_max_array[i]))
    
    if xor(SubString(passwords[i,3],min_count,min_count) == check_letter_array[i], SubString(passwords[i,3],max_count,max_count) == check_letter_array[i])
    	push!(holder, 1)
    end
end

sum(holder)
