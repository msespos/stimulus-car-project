class AddCarIdToVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :car_id, :bigint
  end
end
