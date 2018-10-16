class CreateWordlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wordlists do |t|
      t.string :word
      t.string :sorted_word

      t.timestamps
    end
    add_index :wordlists, :sorted_word
  end
end
