class CreateStars < ActiveRecord::Migration
  def self.up
    create_table :stars do |t|
      t.string :reviewer
      t.integer :mp3_id
      t.references :mp3

      t.timestamps
    end
  end

  def self.down
    drop_table :stars
  end
end
