# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

salesperson = Salesperson.find_by({"first_name" => "Jim", "last_name" => "Brazeal"})
# puts Salesperson.all.inspect

contact_1 = Contact.find_by({"first_name" => "Tim", "last_name" => "Cook"})
contact_2 = Contact.find_by({"first_name" => "Jeff", "last_name" => "Bezos"})
# puts Contact.all.inspect

new_activity1 = Activity.new

new_activity1["notes"] = "Phase 1 call"
new_activity1["salesperson_id"] = salesperson["id"]
new_activity1["contact_id"] = contact_1["id"]
new_activity1.save

new_activity2 = Activity.new

new_activity2["notes"] = "Phase 2 call"
new_activity2["salesperson_id"] = salesperson["id"]
new_activity2["contact_id"] = contact_1["id"]
new_activity2.save

new_activity3 = Activity.new

new_activity3["notes"] = "Phase 1 call"
new_activity3["salesperson_id"] = salesperson["id"]
new_activity3["contact_id"] = contact_2["id"]
new_activity3.save

# puts "#{new_activity1["notes"]} #{new_activity2["id"]} #{new_activity3["id"]}"

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

activities = Activity.where({"salesperson_id" => salesperson["id"], "contact_id" => contact_1["id"]})
puts activities

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

for activity in activities


# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
