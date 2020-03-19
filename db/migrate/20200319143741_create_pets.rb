class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image
      t.integer :age
      t.string :sex
      t.references :shelter_id, foreign_key: true
    end
  end
end
