class CreateTypes < ActiveRecord::Migration
  def change
    create_table :hit_types do |t|
      t.string :name
    end

    add_belongs_to :hits, :hit_type
  end
end
