class AddRequestDateToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :request_date, :date
  end
end
