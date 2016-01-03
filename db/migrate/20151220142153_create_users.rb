class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :unique_identifier

      t.timestamps null: false
    end
  end
end
