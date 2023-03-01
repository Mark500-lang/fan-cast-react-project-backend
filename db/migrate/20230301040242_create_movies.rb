class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :release_date
      t.string :starring
      t.string :quote 
    end
  end
end
