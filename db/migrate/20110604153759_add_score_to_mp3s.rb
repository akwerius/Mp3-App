class AddScoreToMp3s < ActiveRecord::Migration
  def self.up
    add_column :mp3s, :score, :decimal
    end

  def self.down
  	remove_column :mp3s, :score
  end
end
