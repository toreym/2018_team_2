class AddAttachedImages < ActiveRecord::Migration[5.0]
  def change
    add_attachment :funding_needs, :image
    add_attachment :organizations, :image
  end
end
