class FileUpload < ApplicationRecord

  def self.available_types
    [Fund, Donor, Organization, Distribution]
  end
end
