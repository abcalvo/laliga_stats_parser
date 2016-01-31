# Module for scrapping data from Goals section, La Liga website
module LaligaStatsParser
  module_function

  # Goals section (only field players)
  private_class_method def get_goals_data(nokogiri_parsed_data)
    begin
      goals = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .goles .valor')[0].text
      )
      goal_ratio = format_float_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[0].css('td')[2].text
      )
      inside_area = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[1].css('td')[1].text
      )
      inside_area_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[1].css('td')[2].text
      )
      outside_area = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[2].css('td')[1].text
      )
      outside_area_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[2].css('td')[2].text)
      penalties_raw =
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[3].css('td')[1].text
      # Parse penalties goals and penalties shot: #GOALS (de #SHOT)
      # --penalties (de penalties_shot)--
      penalties = penalties_raw[0..penalties_raw.index(' ') - 1].to_i
      # Get the chars from the position of ' (de ' plus ' (de'
      # until the number of penalties shot
      separator = ' (de '
      penalties_shot = format_number(
        penalties_raw[penalties_raw.index(separator) + separator.length..penalties_raw.length - 2]
      )
      penalties_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[3].css('td')[2].text
      )
      right_foot = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[4].css('td')[1].text
      )
      right_foot_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[4].css('td')[2].text
      )
      left_foot = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[5].css('td')[1].text
      )
      left_foot_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[5].css('td')[2].text
      )
      head = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[6].css('td')[1].text
      )
      head_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[6].css('td')[2].text
      )
      free_kicks = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[7].css('td')[1].text
      )
      free_kicks_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[7].css('td')[2].text
      )
      own_goals = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-goles .estadisticas_jugador_tabla')[0]
        .css('tr')[8].css('td')[2].text
      )
    rescue => exception
      puts 'get_goals_data: ' + exception.to_s +
      'Error processing data. Aborting...'
    end

    {
      goals: {
        total: goals || nil,
        ratio: goal_ratio || nil,
        inside_area: inside_area || nil,
        inside_area_pct: inside_area_pct || nil,
        outside_area: outside_area || nil,
        outside_area_pct: outside_area_pct || nil,
        penalties: penalties || nil,
        penalties_pct: penalties_pct || nil,
        right_foot: right_foot || nil,
        right_foot_pct: right_foot_pct || nil,
        left_foot: left_foot || nil,
        left_foot_pct: left_foot_pct || nil,
        head: head || nil,
        head_pct: head_pct || nil,
        free_kicks: free_kicks || nil,
        free_kicks_pct: free_kicks_pct || nil,
        own_goals: own_goals || nil
      },
      penalties_shot: penalties_shot || nil
    }
  end
end
