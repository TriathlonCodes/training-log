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

module ConvertExcel
  def excel_to_csv(file)

    p xlsx.info
  end
end


xlsx = Roo::Spreadsheet.open(ARGV[0])
p xlsx.sheet(0)
p xlsx.sheet(0).parse(headers: true)
p xlsx.sheet(0).header_line



