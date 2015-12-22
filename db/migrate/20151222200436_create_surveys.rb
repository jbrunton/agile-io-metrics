class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.text :description
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
