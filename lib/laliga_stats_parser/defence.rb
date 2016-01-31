# Module for scrapping data from Defence section, La Liga website
module LaligaStatsParser
  module_function

  # Defence sections (only field players)
  private_class_method def get_defence_data(nokogiri_parsed_data)
    begin
      blocked_shots = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[0]
        .css('tr')[0].css('td')[1].text
      )
      interceptions = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[0]
        .css('tr')[1].css('td')[1].text
      )
      recoveries = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[0]
        .css('tr')[2].css('td')[1].text
      )
      clearances = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[0]
        .css('tr')[3].css('td')[1].text
      )
      successful_tackles = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[1]
        .css('tr')[0].css('td')[1].text
      )
      unsuccessful_tackles = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[1]
        .css('tr')[1].css('td')[1].text
      )
      last_man_tackes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[1]
        .css('tr')[2].css('td')[1].text
      )
      successful_challenges = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[2]
        .css('tr')[0].css('td')[1].text
      )
      unsuccessful_challenges = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[2]
        .css('tr')[0].css('td')[2].text
      )
      challenges_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[2]
        .css('tr')[0].css('td')[3].text
      )
      successful_air_duels = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[2]
        .css('tr')[1].css('td')[1].text
      )
      unsuccessful_air_duels = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[2]
        .css('tr')[1].css('td')[2].text
      )
      air_duel_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-defensa .estadisticas_jugador_tabla')[2]
        .css('tr')[1].css('td')[3].text
      )
    rescue => exception
      puts 'get_defence_data: ' + exception.to_s +
      'Error processing data. Aborting...'
    end

    {
      recoveries: recoveries || nil,
      blocked_shots: blocked_shots || nil,
      interceptions: interceptions || nil,
      clearances: clearances || nil,
      tackles: {
        successful_tackles: successful_tackles || nil,
        unsuccessful_tackles: unsuccessful_tackles || nil,
        last_man_tackes: last_man_tackes || nil
      },
      challenges: {
        successful_challenges: successful_challenges || nil,
        unsuccessful_challenges: unsuccessful_challenges || nil,
        challenges_pct: challenges_pct || nil
      },
      air_duels: {
        successful_air_duels: successful_air_duels || nil,
        unsuccessful_air_duels: unsuccessful_air_duels || nil,
        air_duel_pct: air_duel_pct || nil
      }
    }
  end
end
