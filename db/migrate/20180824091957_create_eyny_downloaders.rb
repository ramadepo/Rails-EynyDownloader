class CreateEynyDownloaders < ActiveRecord::Migration[5.2]
  def change
    create_table :eyny_downloaders do |t|

      t.timestamps
    end
  end
end
