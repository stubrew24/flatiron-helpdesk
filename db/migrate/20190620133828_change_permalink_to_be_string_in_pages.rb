class ChangePermalinkToBeStringInPages < ActiveRecord::Migration[5.2]
  def change
    change_column :pages, :permalink, :string
  end
end
