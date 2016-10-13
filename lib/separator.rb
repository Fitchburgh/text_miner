#
class Separator
  # def words(string)
  #   if string.to_i.to_s == string
  #     return nil
  #   else
  #     p string.split
  #   end
  # end

  def phone_number(number)
    full_number = /.*(\d{3}).*[. -]*(\d{3})[. -]*(\d{4})/.match(number)
    return nil if full_number.nil?
    { area_code: full_number[1], number: full_number[2] + '-' + full_number[3] }
  end

  def money(dolla_billz)

    if !dolla_billz.include?(',')
      amount = /(.{1})(\d*[.,]*\d*)/.match(dolla_billz)
      { currency: amount[1], amount: amount[2].to_f }
    else
      amount = /(.{1})(\d*)[.,]*(\d*)/.match(dolla_billz)
      { currency: amount[1], amount: (amount[2] + amount[3]).to_f}
    end
  end
end
