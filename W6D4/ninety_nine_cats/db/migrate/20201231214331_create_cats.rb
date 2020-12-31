class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|

      t.date :birth_date, null: false
      t.string :color, null: false, inclusion: { in: %w(red yellow blue) } 
      t.string :name, null: false
      t.string :sex, null: false, limit: 1, inclusion: { in: %w(M F) } 
      t.text :description, null: false

      t.timestamps
    end
  end
end
