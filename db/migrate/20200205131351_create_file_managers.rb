class CreateFileManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :file_managers do |t|

      t.timestamps
    end
  end
end
