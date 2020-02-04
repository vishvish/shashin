class CreateInspectors < ActiveRecord::Migration[6.0]
  def change
    create_table :inspectors do |t|

      t.timestamps
    end
  end
end
