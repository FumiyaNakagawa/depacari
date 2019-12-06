class AddDpcariPointToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :depacari_point, :integer
  end
end
