# Module for scrapping data from Efficiency section, La Liga website
module LaligaStatsParser
  module_function

  # Efficiency section (only goalkpeers)
  private_class_method def get_efficiency_data(nokogiri_parsed_data)
    begin
      goals_conceded = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .eficiencia-portero .valor')
        .text
      )
      goals_conceded_inside_area = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[1]
        .css('tr')[0].css('td')[1].text
      )
      goals_conceded_outside_area = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[1]
        .css('tr')[1].css('td')[1].text
      )
      saves_inside_area = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[2]
        .css('tr')[0].css('td')[1].text
      )
      saves_outside_area = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[2]
        .css('tr')[1].css('td')[1].text
      )
      saves_caught = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[2]
        .css('tr')[2].css('td')[1].text
      )
      saves_parried = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[2]
        .css('tr')[3].css('td')[1].text
      )
      penalty_saves = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[2]
        .css('tr')[4].css('td')[1].text
      )
      clean_sheets = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[2]
        .css('tr')[6].css('td')[1].text
      )
      saves_per_goal = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-eficiencia .estadisticas_jugador_tabla')[2]
        .css('tr')[7].css('td')[1].text
      )
    rescue => exception
      puts 'get_efficiency_data: ' + exception.to_s +
      'Error processing data. Aborting...'
    end

    {
      goals_conceded: {
        total: goals_conceded || nil,
        inside_area: goals_conceded_inside_area || nil,
        outside_area: goals_conceded_outside_area || nil
      },
      shots_saved: {
        inside_area: saves_inside_area || nil,
        outside_area: saves_outside_area || nil,
        caught: saves_caught || nil,
        parried: saves_parried || nil,
        penalty_saves: penalty_saves || nil
      },
      clean_sheets: clean_sheets || nil,
      saves_per_goal: saves_per_goal || nil
    }
  end
end
