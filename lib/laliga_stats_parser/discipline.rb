# Module for scrapping data from Discipline section, La Liga website
module LaligaStatsParser
  module_function

  # Discipline section (common for goalkpeers and field players)
  private_class_method def get_discipline_data(nokogiri_parsed_data)
    begin
      yellow_cards = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[0].css('td')[2].text
      )
      second_yellow_cards = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[1].css('td')[2].text
      )
      red_cards = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[2].css('td')[2].text
      )
      sent_off = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[3].css('td')[2].text
      )
      offsides = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[4].css('td')[2].text
      )
      fouls_suffered = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[5].css('td')[2].text
      )
      fouls_committed = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[6].css('td')[2].text
      )
      penalties_awarded = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[7].css('td')[2].text
      )
      penalties_committed = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[8].css('td')[2].text
      )
      handball = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-disciplina .estadisticas_jugador_tabla')[0]
        .css('tr')[9].css('td')[2].text
      )
    rescue => exception
      puts 'get_discipline_data: ' + exception.to_s +
      'Error processing data. Aborting...'
    end

    {
      yellow_cards: yellow_cards || nil,
      second_yellow_cards: second_yellow_cards || nil,
      red_cards: red_cards || nil,
      sent_off: sent_off || nil,
      offsides: offsides || nil,
      fouls_suffered: fouls_suffered || nil,
      fouls_committed: fouls_committed || nil,
      penalties_awarded: penalties_awarded || nil,
      penalties_committed: penalties_committed || nil,
      handball: handball || nil
    }
  end
end
