require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def all_players 
  # players = []
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_players + away_players
end

def num_points_scored name_player
  found_player = all_players.find {|player| player[:player_name] == name_player}
  found_player[:points]
end

def shoe_size name_player
  found_player = all_players.find {|player| player[:player_name] == name_player}
  found_player[:shoe]
end


def team_colors name_team
  game_hash.each do |team, team_info| 
    if team_info[:team_name] ==  name_team
      return team_info[:colors]
    end
  end
end

def team_names
  team_names = game_hash.map {|team, team_info| team_info[:team_name]}
  team_names
end

def player_numbers name_team
  game_hash.each do |team, team_info| 
    if team_info[:team_name] ==  name_team
      team_players = team_info[:players]
      number_arr = team_players.map{|player| player[:number]}
      return number_arr
    end
  end
end

def player_stats name_player
  found_player = all_players.find {|player| player[:player_name] == name_player}
end

def most_points_scored
  most_points = all_players.map {|player| player[:points]}.max()
  most_points_player = all_players.find{|player| player[:points] == most_points}
  most_points_player[:player_name]
end

def winning_team
  home = game_hash[:home][:players].map{|player| player[:points]}
  away = game_hash[:away][:players].map{|player| player[:points]}
  total_points = {home.sum => game_hash[:home][:team_name], away.sum => game_hash[:away][:team_name]}
  high_points = [home.sum, away.sum].max
  return total_points[high_points]
  binding.pry
end
binding.pry

def big_shoe_rebounds 
  max_shoe_size = all_players.map {|player| player[:shoe]}.max()
  big_foot_player = all_players.find{|player| player[:shoe] == max_shoe_size}
  big_foot_player[:rebounds]
end


# game_hash[:home][:players].map{|player| puts player[:player_name]}