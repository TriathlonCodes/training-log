# require 'roo'

module ConvertDate

  def parse_mmddyyyy(date) #in format mm/dd/yyyy
    year = date[-4..-1]
    p year
    month = date[/^\d{1,2}/]
    day = date.gsub!(/^\d{1,2}\W/, "").gsub!(/\W\d{4}$/, "")
    Date.parse("#{day}/#{month}/#{year}")
  end
end



