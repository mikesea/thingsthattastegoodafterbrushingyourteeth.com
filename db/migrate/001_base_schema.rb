Sequel.migration do
  change do
    create_table(:things) do
      primary_key :id
      String :name, :text=>true
      String :url, :text=>true
    end
  end
end
