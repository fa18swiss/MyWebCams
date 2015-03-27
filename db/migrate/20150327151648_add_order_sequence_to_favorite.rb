class AddOrderSequenceToFavorite < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER SEQUENCE favoris_ordre_seq OWNED BY favoris.ordre;
      ALTER TABLE favoris ALTER COLUMN ordre SET DEFAULT nextval('favoris_ordre_seq');
    SQL
  end

  def down
    execute <<-SQL
      ALTER SEQUENCE favoris_ordre_seq OWNED BY NONE;
      ALTER TABLE favoris ALTER COLUMN ordre DROP DEFAULT;
    SQL
  end
end
