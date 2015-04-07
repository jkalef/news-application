class AddReadingReferencesToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :reading, index: true, foreign_key: true
  end
end
