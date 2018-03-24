class CreateDonorFundRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :donor_fund_relations do |t|
      t.belongs_to :donor, index: true
      t.belongs_to :fund, index: true

      t.timestamps
    end
    remove_column :donors, :fund_id
    remove_column :donors, :external_fund_id
  end
end
