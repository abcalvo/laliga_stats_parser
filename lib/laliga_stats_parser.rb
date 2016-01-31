require "laliga_stats_parser/version"

require 'laliga_stats_parser/common_functions'

require 'laliga_stats_parser/attack'
require 'laliga_stats_parser/buildup_play'
require 'laliga_stats_parser/defence'
require 'laliga_stats_parser/discipline'
require 'laliga_stats_parser/efficiency'
require 'laliga_stats_parser/events'
require 'laliga_stats_parser/goals'
require 'laliga_stats_parser/profile'

# LaLigaParser
# Module for scrapping player statistics from La Liga website
module LaligaStatsParser
  module_function

  # Main URL for scrapping data
  LALIGA_BASE_URL = 'http://www.laliga.es/liga-bbva'.freeze

  # Get parsed Nokogiri HTML
  private_class_method def get_nokogiri_data(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new(uri.request_uri)
    response = http.request(request)

    Nokogiri::HTML(response.body)
  end

  # Get player data. Returns a hash with all the stats
  private_class_method def get_player_data(url)
    page = get_nokogiri_data(url)

    profile = get_profile_data(page)
    discipline = get_discipline_data(page)

    # If player position is Goalkeeper, parse the sections of goalkeepers.
    # Else parse the sections of field players
    if profile[:position] == 'Goalkeeper'
      efficiency = get_efficiency_data(page)
      events = get_events_data(page)

      data = profile
             .merge(efficiency)
             .merge(events)
             .merge(discipline)
    else
      defence = get_defence_data(page)
      buildup = get_buildup_play_data(page)
      atack = get_attack_data(page)
      goals = get_goals_data(page)

      data = profile
             .merge(defence)
             .merge(buildup)
             .merge(atack)
             .merge(goals)
             .merge(discipline)
    end

    data
  end

  private_class_method def get_team_data(url)
    page = get_nokogiri_data(url)
    team_data = []

    page.css('.posiciones-equipo').each do |position|
      position_name = position.css('.titulo_posicion').text
      puts '= ' + position_name

      position.css('.posiciones a').each do |player|
        puts player.css('.nombre-perfil').text

        player_data = get_player_data(player.attr('href'))

        team_data << player_data

        sleep 2
      end
    end

    team_data
  end

  # Flattens fetched data into only one array
  private_class_method def flatten(array_data)
    flattened_data = []

    array_data.each do |team|
      team.each do |player|
        flattened_data << player
      end
    end

    flattened_data
  end

  def scrap_laliga_stats
    page = get_nokogiri_data(LALIGA_BASE_URL)
    laliga_data = []

    page.css('#equipos .columna.liga-bbva a').each do |team|
      team_name = team.css('.nombre').text
      team_url = team.attr('href')
      puts '== Starting ' + team_name + ' -> ' + team_url
      team_data = get_team_data(team.attr('href'))

      laliga_data << team_data
      puts '== Ending ' + team_name
    end

    flatten(laliga_data)
  end
end
