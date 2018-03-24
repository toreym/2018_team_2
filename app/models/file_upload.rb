class FileUpload < ApplicationRecord

  def self.available_types
    [Fund, Donor, Organization, Distribution]
  end

  def import
    rows = []
    single_row = []
    self.file.split(',').each do |col|
      if col.include? "\n"
        split = col.split("\n")
        single_row.push(split[0].strip)
        rows.push(single_row)
        single_row = [split[1]]
      else
        single_row.push(col)
      end
    end
    header = rows.shift
    rows.each do |row|
      self.upload_type.constantize.import_row(header, row)
    end
  end
end
