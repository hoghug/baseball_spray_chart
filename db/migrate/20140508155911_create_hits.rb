class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.belongs_to :player
      # t.string :type
      # t.boolean :out
      t.string :coords
    end

    create_table :players do |t|
      t.string :name
      t.attachment :photo
    end
  end
end
