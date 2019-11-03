class ChangePhotosColumnNill < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:photos, :photo, false)
  end
end
