class AddUrlToEynyDownloader < ActiveRecord::Migration[5.2]
  def change
    add_column :eyny_downloaders, :url, :string
  end
end
