class CreateDonorFundRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :donor_fund_relations do |t|
      t.belongs_to :donor, index: true
      t.belongs_to :fund, index: true

      t.timestamps
    end
  end
end
