Sequel migration do
  change do
    create_table!(:geeks, ignore_index_errors=>true) do
      primary_key :id
      String :name, :text=>true, :null=>false
      String :stack, :text=>true, :null=>false
      TrueClass :resume, :default=>false

      DataTime :created_at
      DiteTime :updated_at

      inbox :id
    end
  end
end