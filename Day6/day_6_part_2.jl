using DelimitedFiles

# Pre-proccess text in sublime using replace('\n\n', '|') followed by replace('\n', ',')
# Then all groups are separated by a | and all member responses by group are separated by a comma

responses = readdlm("day_6_data_processed_comma_between_members.txt", '|')

# count group members, by comma + 1
# then run code from part 1 to get unique counts

group_member_count = length(split(responses[1], ","))

sum(split(responses[1], "") .== "p")


group_count = []
for i = 1:length(responses)
	group_member_count = length(split(responses[i], ","))
	response_count = []
	for letter in ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
		# check if a letter appears as many times as the number of members
		# don't have to remove , as it will always appear N-1 times and never be selected
		if sum(split(responses[i], "") .== letter) == group_member_count
			push!(response_count, 1)
		end
	end
	if length(response_count) > 0
		push!(group_count, sum(response_count))
	end
end



part_1_sum = sum(length.(unique.(split.(responses,""))))