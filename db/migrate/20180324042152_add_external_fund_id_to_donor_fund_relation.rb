class AddExternalFundIdToDonorFundRelation < ActiveRecord::Migration[5.0]
  def change
    add_column :donor_fund_relations, :external_fund_id, :string
  end
end
