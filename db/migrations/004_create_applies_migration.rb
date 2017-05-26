Sequel migration do
  change do
    create_table!(:jobs, ignore_index_errors=>true) do
      primary_key :id
      TrueClass :read, :default=>false
      TrueClass :invited, :default=>false
      foreign_key :job_id, :jobs, :null=>false, :key=>[:id]
      foreign_key :geeks_id, :geeks, :null=>false, :key=>[:id]


      DataTime :created_at
      DiteTime :updated_at

      inbox :id
    end
  end
end