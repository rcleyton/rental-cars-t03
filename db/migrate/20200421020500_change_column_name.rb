class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :car_categories, :third_party_insurance, :third_part_insurance
  end
end
