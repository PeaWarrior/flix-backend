class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.text :overview
      t.integer :released
      t.string :runtime
      t.string :poster
      t.string :backdrop
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
