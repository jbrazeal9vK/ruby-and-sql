# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# puts "There are #{Company.all.count} companies"

# 2. insert new rows in companies table

new_company = Company.new

# puts new_company.inspect

new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "California"
new_company["url"] = "https://www.apple.com"

new_company.save # inserts data into the table

company_2 = Company.new

company_2["name"] = "Amazon"
company_2["city"] = "Seattle"
company_2["state"] = "Washington"
# new_company["url"] = "https://www.amazon.com"

company_2.save # inserts data into the table

company_3 = Company.new

company_3["name"] = "Twitter"
company_3["city"] = "San Francisco"
company_3["state"] = "California"
# new_company["url"] = "https://www.amazon.com"

company_3.save # inserts data into the table

# puts new_company.inspect

# puts "There are #{Company.all.count} companies"

# 3. query companies table to find all row with California company

all_companies = Company.all
# puts all_companies.inspect

# 4. query companies table to find single row for Apple

cali_companies = Company.where({"state" => "California"}) #chooses for multiple rows
# puts cali_companies.inspect
puts "CA companies: #{cali_companies.count}"

apple = Company.find_by({"name" => "Apple"}) #chooses the one element from the array (first element)
puts apple.inspect

# 5. read a row's column value

puts apple["url"]

# 6. update a row's column value

amazon = Company.find_by({"name" =>"Amazon"})
amazon["url"] = "https://amazon.com"
amazon.save
puts amazon["url"]

# 7. delete a row
twitter = Company.find_by({"name" => "Twitter"})
twitter.destroy 