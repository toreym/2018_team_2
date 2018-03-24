class Fund < ApplicationRecord

  has_many :distributions
  has_and_belongs_to_many :donors, :join_table => :donor_fund_relations

  def self.where_not_valid_fund_upload(header)
    !(header.find_index("Account ID") && header.find_index("Spendable Balance") && header.find_index("Account Name"))
  end

  def self.import_row(header, row)
    if where_not_valid_fund_upload(header)
      raise ArgumentError.new('Invalid data for this Fund upload type.')
    end

    external_id = row[header.find_index("Account ID")] if header.find_index("Account ID")
    return if external_id.nil?

    name = row[header.find_index("Account Name")] if header.find_index("Account Name")
    spendable_balance = row[header.find_index("Spendable Balance")] if header.find_index("Spendable Balance")

    fund = Fund.find_by_external_id(external_id)

    if fund
      fund.update_attributes(:name => name, :spendable_balance => spendable_balance)
    else
      Fund.create(:name => name, :external_id => external_id, :spendable_balance => spendable_balance)
    end
  end

end
