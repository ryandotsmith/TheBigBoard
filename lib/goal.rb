class Goal < CouchRest::ExtendedDocument
  include CouchRest::Validation
  use_database CouchRest.database!((SiteConfig.url_base_db || '') + SiteConfig.db_name)

  property :name
  property :expectation
  property :actual

  validates_present  :name, :expectation, :actual

  view_by :name

  def self.find(search_id)
    Goal.by_name.select { |g| g.id == search_id }.first
  end

  def chart() 
    Gchart.bar :data  => [ [self.actual.to_i],[self.expectation.to_i] ],
               :bar_colors => ['FF0000', '00FF00'],
               :bar_width_and_spacing => {:width => 40}
  end

end
