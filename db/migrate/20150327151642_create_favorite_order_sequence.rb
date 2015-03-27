class CreateFavoriteOrderSequence < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE SEQUENCE favoris_ordre_seq;
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE favoris_ordre_seq;
    SQL
  end
end
