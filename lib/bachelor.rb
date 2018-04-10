require 'pry'

def get_first_name_of_season_winner(data, season)
  #return the first name of that season's winner. data is a hash
  winner = "Could not find winner"
  data.each do |season_key, season_array|
    if season_key == season
      winner = find_winner_first_name(season_array)
    end
  end
  winner
end

def find_winner_first_name(season_array)
  winner = ""
  season_array.each do |contestant|
    if contestant["status"] == "Winner"
      name_array = contestant["name"].split(" ")
      winner = name_array[0]
    end
  end
  winner
end

def get_contestant_name(data, occupation)
  person_name = "cound not find occupation"
  data.each do |season_key, season_array|
    season_array.each do |contestant|
      if contestant["occupation"] == occupation
        person_name = contestant["name"]
      end
    end
  end
  person_name
end

def count_contestants_by_hometown(data, hometown)
  hometown_counter = 0
  data.each do |season_key, season_array|
    season_array.each do |contestant|
      if contestant["hometown"] == hometown
        hometown_counter += 1
      end
    end
  end
  hometown_counter
end

def get_occupation(data, hometown)
  occupation = []
  data.each do |season_key, season_array|
    season_array.each do |contestant|
      if contestant["hometown"] == hometown
        occupation.push(contestant["occupation"])
      end
    end
  end
  occupation[0]
end

def get_average_age_for_season(data, season)
  ages = []
  total_age = 0
  data.each do |season_key, season_array|
    if season_key == season
      season_array.each do |contestant|
        ages.push(contestant["age"].to_f)
      end
    end
  end
  ages.each do |age|
    total_age = total_age + age
  end
  #binding.pry
  average_age = (total_age / ages.length)
  average_age.round
end
