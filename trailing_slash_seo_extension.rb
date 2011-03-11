require_dependency "#{File.expand_path(File.dirname(__FILE__))}/lib/trailing_slash_seo"

class TrailingSlashSeoExtension < Radiant::Extension
  version "1.0"
  description "Redirects Page urls without slash to version with slash to do some SEO"
  url "https://github.com/mikz/radiant-trailing_slash_seo"
    
  def activate
    Page.send :include, TrailingSlashSeo
  end
end
