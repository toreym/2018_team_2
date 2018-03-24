class Fund < ApplicationRecord

  has_many :donors
  has_many :distributions
  has_and_belongs_to_many :donor_fund_relations
end

  def self.import_row(header, row)
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