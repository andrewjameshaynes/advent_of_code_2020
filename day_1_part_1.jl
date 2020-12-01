using CSV
using DataFrames

expense_data = CSV.read("day_1_expense_data.csv")

for i = 1:nrow(expense_data)
	for j = 1:nrow(expense_data)

		if expense_data[i,"expenses"] + expense_data[j, "expenses"] == 2020
		  println(expense_data[i,"expenses"] * expense_data[j, "expenses"])
		  break
		end
	end
end
