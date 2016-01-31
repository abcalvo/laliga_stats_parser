# Module for scrapping data from Profile section, La Liga website
module LaligaStatsParser
  module_function

  # Profile section (common for goalkpeers and field players)
  private_class_method def get_profile_data(nokogiri_parsed_data)
    begin
      name = delete_last_spaces(nokogiri_parsed_data
                                .css('#datos-perfil #nombre')[0].text)
      nickname = delete_last_spaces(nokogiri_parsed_data
                                    .css('#datos-perfil #nickname')[0].text)
      team = nokogiri_parsed_data.css('.cabecera-seccion .titulo')[0].text
      position = format_position(nokogiri_parsed_data
                                 .css('.datos-sidebar-jugador .box-dato')
                                 .last.css('.dato').text)
      minutes_played = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-minutos .datos_extra
        .estadisticas_jugador_dato.destacado')[0].text
      )
      games_played = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-minutos .estadisticas_jugador_tabla tr')[1]
        .css('td')[1].text
      )
      starter = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-minutos .estadisticas_jugador_tabla tr')[2]
        .css('td')[1].text
      )
      substitution_on = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-minutos .estadisticas_jugador_tabla tr')[3]
        .css('td')[1].text
      )
      substitution_off = format_number(
        nokogiri_parsed_data
        .css('#estadisticas-minutos .estadisticas_jugador_tabla tr')[4]
        .css('td')[1].text
      )
    rescue => exception
      puts 'get_profile_data: ' + exception.to_s +
      'Error processing data. Aborting...'
    end

    {
      name: name || nil,
      nickname: nickname || nil,
      team: team || nil,
      position: position || nil,
      minutes_played: minutes_played || nil,
      games_played: games_played || nil,
      starter: starter || nil,
      substitution_on: substitution_on || nil,
      substitution_off: substitution_off || nil
    }
  end
end
