class RemoveIntroduction < ActiveRecord::Migration[6.0]
  def change
     remove_column :users, :introduction, :string
  end
end
