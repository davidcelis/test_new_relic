require 'yaml'

# Establish a connection to the database.
database_yml = File.read(Crepe.root.join('config', 'database.yml'))
configurations = YAML.load(ERB.new(database_yml).result)
ActiveRecord::Base.configurations = configurations
ActiveRecord::Base.establish_connection(Crepe.env.to_sym)

# Store timestamps generated by ActiveRecord in UTC.
ActiveRecord::Base.default_timezone = :utc

# Log Database queries to Crepe.logger.
ActiveRecord::Base.logger = Crepe.logger
