class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :reviewer
      t.integer :rating
      t.references :mp3

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
