# Module for scrapping data from Events section, La Liga website
module LaligaStatsParser
  module_function

  # Events section (only goalkpeers)
  private_class_method def get_events_data(nokogiri_parsed_data)
    begin
      saves = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .acciones-portero .valor')
        .text
      )
      clearances = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[1]
        .css('tr')[0].css('td')[1].text
      )
      off_lines = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[1]
        .css('tr')[1].css('td')[1].text
      )
      tackles = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[1]
        .css('tr')[2].css('td')[1].text
      )
      successful_goalkicks = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[2]
        .css('tr')[0].css('td')[1].text
      )
      unsuccessful_goalkicks = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[2]
        .css('tr')[0].css('td')[2].text
      )
      goalkicks_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[2]
        .css('tr')[0].css('td')[3].text
      )
      crosses_intercepted = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[3]
        .css('tr')[0].css('td')[1].text
      )
      crosses_not_intercepted = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[3]
        .css('tr')[1].css('td')[1].text
      )
      crosses_punched = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-portero-acciones .estadisticas_jugador_tabla')[3]
        .css('tr')[2].css('td')[1].text
      )
    rescue => exception
      puts 'get_events_data: ' + exception.to_s +
      'Error processing data. Aborting...'
    end

    {
      saves: saves || nil,
      clearances: clearances || nil,
      off_lines: off_lines || nil,
      tackles: tackles || nil,
      goalkicks: {
        successful_goalkicks: successful_goalkicks || nil,
        unsuccessful_goalkicks: unsuccessful_goalkicks || nil,
        goalkicks_pct: goalkicks_pct || nil
      },
      crosses_gk: {
        crosses_intercepted: crosses_intercepted || nil,
        crosses_not_intercepted: crosses_not_intercepted || nil,
        crosses_punched: crosses_punched || nil
      }
    }
  end
end
