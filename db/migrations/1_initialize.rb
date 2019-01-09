Sequel.migration do
  up do
    File.open 'db/ddl.sql', 'r' do |file|
      run file.read
    end
  end

  down do
    %w{office president}.each do |table|
      drop_table table
    end
  end
end
