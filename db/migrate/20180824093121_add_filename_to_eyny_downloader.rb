class AddFilenameToEynyDownloader < ActiveRecord::Migration[5.2]
  def change
    add_column :eyny_downloaders, :filename, :string
  end
end
