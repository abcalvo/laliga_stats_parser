# Common functions for scrapping
module LaligaStatsParser
  module_function

  # Removes point from numbers, ex from 1.960 to 1960
  # and returns it as integer
  private_class_method def format_number(number)
    number.gsub(/\D/, '').to_i
  end

  # Removes comma from floats, ex from 1,96 to 1.96
  # and returns it as float
  private_class_method def format_float_number(number)
    number.tr(',', '.').to_f
  end

  # Removes comma and ' %' from pct, ex from 1,96 % to 1.96
  # and returns it as float
  private_class_method def format_pct_number(number)
    number.tr(',', '.').gsub(/ %/, '').to_f
  end

  # Format the player position
  private_class_method def format_position(position)
    case position
    when 'Portero' then 'Goalkeeper'
    when 'Defensa' then 'Defender'
    when 'Centrocampista' then 'Midfielder'
    when 'Delantero' then 'Forward'
    else position
    end
  end

  # Delete last spaces from the string
  private_class_method def delete_last_spaces(string)
    string.gsub(/( )*$/, '')
  end
end
