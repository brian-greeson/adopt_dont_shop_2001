class ChangeForeignKeyForShelters < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :shelters_id, :shelter_id
  end
end
