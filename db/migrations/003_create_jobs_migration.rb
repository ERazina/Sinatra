Sequel migration do
  change do
    create_table!(:jobs, ignore_index_errors=>true) do
      primary_key :id
      String :name, :text=>true, :null=>false
      String :stack, :text=>true, :null=>false
      foreign_key :company_id, :companies, :null=>false, :key=>[:id]

      DataTime :created_at
      DiteTime :updated_at

      inbox :id
    end
  end
end