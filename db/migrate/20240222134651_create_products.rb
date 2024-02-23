class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :status, default: 'inprogress'
      t.datetime :approved_date
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
