# Module for scrapping data from Build up play section, La Liga website
module LaligaStatsParser
  module_function

  # Build up play section (only field players)
  private_class_method def get_buildup_play_data(nokogiri_parsed_data)
    begin
      passes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .construccion .valor')[0].text
      )
      successful_long_passes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[0].css('td')[1].text
      )
      unsuccessful_long_passes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[0].css('td')[2].text
      )
      long_passes_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[0].css('td')[3].text
      )
      successful_short_passes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[1].css('td')[1].text
      )
      unsuccessful_short_passes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[1].css('td')[2].text
      )
      short_passes_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[1].css('td')[3].text
      )
      successful_total_passes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[2].css('td')[1].text
      )
      unsuccessful_total_passes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[2].css('td')[2].text
      )
      total_passes_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[0]
        .css('tr')[2].css('td')[3].text
      )
      successful_into_space = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[0].css('td')[1].text
      )
      unsuccessful_into_space = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[0].css('td')[2].text
      )
      into_space_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[0].css('td')[3].text
      )
      total_forward = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[1].css('td')[3].text
      )
      total_backward = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[2].css('td')[3].text
      )
      successful_crosses = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[3].css('td')[1].text
      )
      unsuccessful_crosses = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[3].css('td')[2].text
      )
      crosses_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[3].css('td')[3].text
      )
      successful_corners_taken = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[4].css('td')[1].text
      )
      unsuccessful_corners_taken = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[4].css('td')[2].text
      )
      corners_taken_pct = format_pct_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[4].css('td')[3].text
      )
      key_passes = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-contruccion .estadisticas_jugador_tabla')[1]
        .css('tr')[5].css('td')[3].text
      )
    rescue => exception
      puts 'get_buildup_play_data: ' + exception.to_s +
      'Error processing data. Aborting...'
    end

    {
      passes: passes || nil,
      long_passes: {
        successful_long_passes: successful_long_passes || nil,
        unsuccessful_long_passes: unsuccessful_long_passes || nil,
        long_passes_pct: long_passes_pct || nil
      },
      short_passes: {
        successful_short_passes: successful_short_passes || nil,
        unsuccessful_short_passes: unsuccessful_short_passes || nil,
        short_passes_pct: short_passes_pct || nil
      },
      total_passes: {
        successful_total_passes: successful_total_passes || nil,
        unsuccessful_total_passes: unsuccessful_total_passes || nil,
        total_passes_pct: total_passes_pct || nil
      },
      into_space: {
        successful_into_space: successful_into_space || nil,
        unsuccessful_into_space: unsuccessful_into_space || nil,
        into_space_pct: into_space_pct || nil
      },
      total_forward: total_forward || nil,
      total_backward: total_backward || nil,
      crosses: {
        successful_crosses: successful_crosses || nil,
        unsuccessful_crosses: unsuccessful_crosses || nil,
        crosses_pct: crosses_pct || nil
      },
      corners_taken: {
        successful_corners_taken: successful_corners_taken || nil,
        unsuccessful_corners_taken: unsuccessful_corners_taken || nil,
        corners_taken_pct: corners_taken_pct || nil
      },
      key_passes: key_passes || nil
    }
  end
end
