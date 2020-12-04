using DelimitedFiles

# Pre-proccess text in sublime using replace('\n\n', '|') followed by replace('\n', ' ')
passports = readdlm("passport_data.txt", '|')

how_many_passports = []
for i = 1:size(passports,2)

	check1 = occursin("byr",passports[i]) + occursin( "iyr",passports[i]) + occursin("eyr",passports[i]) + occursin("hgt",passports[i]) +
	          occursin("hcl",passports[i]) + occursin("ecl",passports[i]) + occursin("pid",passports[i])# + occursin("cid",passports[i])
	println([i, check1])

	if check1 == 7 
		d = Dict(split.(split(passports[i], ' '), ':'))

		byr_check = 2002 >= parse(Int64,d["byr"]) >= 1920
		iyr_check = 2020 >= parse(Int64,d["iyr"]) >= 2010
		eyr_check = 2030 >= parse(Int64,d["eyr"]) >= 2020

		hgt_check = match(r"[A-z]{2}", d["hgt"]) !== nothing ? (match(r"[A-z]{2}", d["hgt"]).match == "cm" ? 150<=parse(Int64,match(r"[0-9]+", d["hgt"]).match)<=193 : (match(r"[A-z]{2}", d["hgt"]).match == "in" ? 59<=parse(Int64,match(r"[0-9]+", d["hgt"]).match)<=76 : false)) : false 

		hcl_check = occursin(r"#([0-9a-f]{6})", d["hcl"])

		ecl_check = d["ecl"]  in ("amb", "blu", "brn", "gry", "grn", "hzl", "oth")

		pid_check = length(d["pid"]) == 9 && length(match(r"[0-9]+", d["pid"]).match) == 9

	    check2 = byr_check + iyr_check + eyr_check + hgt_check + hcl_check + ecl_check + pid_check

	    println([byr_check, iyr_check, eyr_check, hgt_check, hcl_check, ecl_check, pid_check])

		if check2 == 7
			push!(how_many_passports,1)
		end
	end
end

sum(how_many_passports)