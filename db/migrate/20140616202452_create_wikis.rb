class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :name
      t.boolean :public, default: true
      t.text :description

      t.timestamps
    end
  end
end
