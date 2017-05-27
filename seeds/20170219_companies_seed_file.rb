Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run
    puts 'run seed companies'
    dataset = DB[:companies]
    dataset.insert(:name => 'MoGo', :location => 'New York')
    dataset.insert(:name => 'Wrike', :location => 'Saint-Petersburg')
    dataset.insert(:name => 'Artesis', :location => 'London')
    dataset.insert(:name => 'NewAge-seed file', :location => 'Toronto')
  end
end

# Sequel.seed do # Wildcard Seed; applies to every environment
#   def run
#     [
#       ['NewAgeArr', 'BostonArr'],
#       ['OldSoft', 'Brazilia']
#     ].each do |name, location|
#       Company.create name: name, location: location
#     end
#   end
# end



# 2-nd way:

# [
#     ['MoGo', 'New York'],
#     ['Wirkkle', 'London'],
#     ['Artesis', 'Saint-Petersburg'],
#     ['BuildEmpire', 'London']
#   ].each do |name, location|
#     Company.create name: name, location: location
#   end