class CreateSwimmings < ActiveRecord::Migration[5.2]
  def change
    create_table :swimmings do |t|
      t.string :name
      t.date :date
      t.text :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
