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

```LaligaStatsParser.scrap_laliga_stats``` returns an array of players with this structure:

Goalkeeper
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

goals_conceded
  total
  inside_area
  outside_area
shots_saved
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
goalkicks
  successful_goalkicks
  unsuccessful_goalkicks
  goalkicks_pct
crosses_gk
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

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/laliga_stats_parser.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
