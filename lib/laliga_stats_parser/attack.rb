# Module for scrapping data from Attack section, La Liga website
module LaligaStatsParser
  module_function

  # Attack section (only field players)
  private_class_method def get_attack_data(nokogiri_parsed_data)
    begin
      shots = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-ataque .estadisticas_jugador_tabla')[1]
        .css('tr')[0].css('td')[3].text
      )
      shots_on_target = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-ataque .estadisticas_jugador_tabla')[1]
        .css('tr')[1].css('td')[2].text
      )
      shots_on_target_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-ataque .estadisticas_jugador_tabla')[1]
        .css('tr')[1].css('td')[3].text
      )
      assists = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-ataque .estadisticas_jugador_tabla')[1]
        .css('tr')[3].css('td')[3].text
      )
      successful_dribbles = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-ataque .estadisticas_jugador_tabla')[1]
        .css('tr')[4].css('td')[1].text
      )
      unsuccessful_dribbles = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-ataque .estadisticas_jugador_tabla')[1]
        .css('tr')[4].css('td')[2].text
      )
      dribbles_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-ataque .estadisticas_jugador_tabla')[1]
        .css('tr')[4].css('td')[3].text
      )
    rescue => exception
      puts 'get_attack_data: ' + exception.to_s +
      'Error processing data. Aborting...'
    end

    {
      shots: {
        total: shots || nil,
        shots_on_target: shots_on_target || nil,
        shots_on_target_pct: shots_on_target_pct || nil
      },
      assists: assists || nil,
      dribbles: {
        successful_dribbles: successful_dribbles || nil,
        unsuccessful_dribbles: unsuccessful_dribbles || nil,
        dribbles_pct: dribbles_pct || nil
      }
    }
  end
end
