class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :color
      t.integer :seats
      t.boolean :tape

      t.timestamps
    end
  end
end
