class CreatePrefs < ActiveRecord::Migration[6.0]
  def change
    create_table :prefs do |t|

      t.timestamps
    end
  end
end
