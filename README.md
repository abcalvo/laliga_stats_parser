# LaligaStatsParser

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'laliga_stats_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install laliga_stats_parser

## Usage

```ruby
stats = LaligaStatsParser.scrap_laliga_stats
```

```LaligaStatsParser.scrap_laliga_stats``` returns an array of hashes representing players with this structure:

#### Goalkeepers
```
name
nickname
team
position
minutes_played
games_played
starter
substitution_on
substitution_off
goals_conceded:
  total
  inside_area
  outside_area
shots_saved:
  inside_area
  outside_area
  caught
  parried
  penalty_saves
clean_sheets
saves_per_goal
saves
clearances
off_lines
tackles
goalkicks:
  successful_goalkicks
  unsuccessful_goalkicks
  goalkicks_pct
crosses_gk:
  crosses_intercepted
  crosses_not_intercepted
  crosses_punched
yellow_cards
second_yellow_cards
red_cards
sent_off
offsides
fouls_suffered
fouls_commited
penalties_awarded
penalties_commited
handball
```

#### Field players
```
name
nickname
team
position
minutes_played
games_played
starter
substitution_on
substitution_off
recoveries
blocked_shots
interceptions
clearances
tackles:
  successful_tackles
  unsuccessful_tackles
  last_man_tackles
challenges:
  successful_challenges
  unsuccessful_challenges
  challenges_pct
air_duels:
  successful_air_duels
  unsuccessful_air_duels
  air_duel_pct
passes
long_passes:
  successful_long_passes
  unsuccessful_long_passes
  long_passes_pct
short_passes:
  successful_short_passes
  unsuccessful_short_passes
  short_passes_pct
total_passes:
  successful_total_passes
  unsuccessful_total_passes
  total_passes_pct
into_space:
  successful_into_space
  unsuccessful_into_space
  into_space_pct
total_forward
total_backward
crosses:
  successful_crosses
  unsuccessful_crosses
  crosses_pct
corners_taken:
  successful_corners_taken
  unsuccessful_corners_taken
  corners_taken_pct
key_passes
shots:
  total
  shots_on_target
  shots_on_target_pct
assists
dribbles:
  successful_dribbles
  unsuccessful_dribbles
  dribbles_pct
goals:
  total
  ratio
  inside_area
  inside_area_pct
  outside_area
  outside_area_pct
  penalties
  penalties_pct
  right_foot
  right_foot_pct
  left_foot
  left_foot_pct
  head
  head_pct
  free_kicks
  free_kicks_pct
  own_goals
penalties_shot
yellow_cards
second_yellow_cards
red_cards
sent_off
offsides
fouls_suffered
fouls_committed
penalties_awarded
penalties_committed
handball
```

You can transform this array into JSON data:
```ruby
require 'laliga_stats_parser'
require 'json'

stats = LaligaStatsParser.scrap_laliga_stats

File.open("laliga.json", "wb") do |file|
  file << JSON.pretty_generate(stats)
end
```

And import the resultant file into MongoDB (database name laliga, collection name statistics):
```
mongoimport -d laliga -c statistics laliga.json --jsonArray
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abcalvo/laliga_stats_parser.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
