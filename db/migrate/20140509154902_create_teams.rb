class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :lineup, :array => true, :default => '{}'
      t.string :address
      t.float :latitude
      t.float :longitude
      t.attachment :logo
      t.attachment :stadium_chart
    end

    add_belongs_to :players, :team
  end
end
