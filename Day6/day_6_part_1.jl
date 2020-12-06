using DelimitedFiles

# Pre-proccess text in sublime using replace('\n\n', '|') followed by replace('\n', '')
# Then all groups are separated by a | and all responses smashed together within group

responses = readdlm("day_6_data_processed.txt", '|')

# split responses array to get all elements by group, split to individual elements, find unique,
# find length of SubArray and sum to get required value
part_1_sum = sum(length.(unique.(split.(responses,""))))