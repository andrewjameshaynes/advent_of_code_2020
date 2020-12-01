using CSV
using DataFrames

expense_data = CSV.read("day_1_expense_data.csv")

for i = 1:nrow(expense_data)
	for j = 1:nrow(expense_data)
			for k = 1:nrow(expense_data)

			if expense_data[i,"expenses"] + expense_data[j, "expenses"] + expense_data[k, "expenses"] == 2020
			  println(expense_data[i,"expenses"] * expense_data[j, "expenses"] * expense_data[k, "expenses"])
			  break
			end
		end
	end
end
