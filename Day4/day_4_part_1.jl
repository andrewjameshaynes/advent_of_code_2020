using DelimitedFiles

# Pre-proccess text in sublime using replace('\n\n', '|') followed by replace('\n', ' ')
passports = readdlm("passport_data.txt", '|')

how_many_passports = []
for i = 1:size(passports,2)
	check = occursin("byr",passports[i]) + occursin( "iyr",passports[i]) + occursin("eyr",passports[i]) + occursin("hgt",passports[i]) +
	          occursin("hcl",passports[i]) + occursin("ecl",passports[i]) + occursin("pid",passports[i])# + occursin("cid",passports[i])
	println([i, check])

	if check == 7
		push!(how_many_passports,1)
	end
end

sum(how_many_passports)
