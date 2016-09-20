require 'sufia_migrate/import/import_service'

desc "Imports Sufia 6 GenericFiles into Sufia 7 GenericWorks"
task :import => :environment do
  # Credentials for the Fedora instance with the content of the files to be imported
  # (this is the Fedora instance used by the *Sufia 6* application)
  config = YAML::load(File.open("#{Rails.root.to_s}/config/sufia_migrate.yml"))

  # Will be true for the real import
  # (leave as false so that we can re-run the import without running into duplicate IDs)
  preserve_ids = config[Rails.env]['preserve_ids'] || false

  # Set to false to test metadata import only. True to test including
  # the binary content of GenericFiles.
  import_binary = config[Rails.env]['import_binary'] || true

  # Files exported from Sufia 6
  files_to_import = File.join(Dir.pwd, "gf_*.json")

  settings = Importer::ImportSettings.new(config[Rails.env]['user'], config[Rails.env]['password'], config[Rails.env]['root_uri'], preserve_ids, import_binary)
  service = Importer::ImportService.new(settings)
  service.import(files_to_import)

  if config[Rails.env]['preserve_ids']
    files_to_import = File.join(Dir.pwd, "coll_*.json")
    service.import(files_to_import)
  end
end
