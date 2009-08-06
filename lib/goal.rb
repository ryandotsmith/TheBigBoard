class Goal < CouchRest::ExtendedDocument
  include CouchRest::Validation
  use_database CouchRest.database!((SiteConfig.url_base_db || '') + SiteConfig.db_name)
  unique_id :id

  property :id
  property :name
  property :expectation
  property :actual

  validates_present :id, :name, :expectation, :actual
  
end
