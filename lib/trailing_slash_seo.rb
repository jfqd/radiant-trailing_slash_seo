module TrailingSlashSeo
  def self.included(base)
    base.send :include, ClassMethods
    base.class_eval do
      alias_method_chain :process, :redirect
    end
  end
  
  module ClassMethods
    def process_with_redirect(request, response)
      if !self.virtual? && request.path != self.url && self.response_code == 200 && self.title.match(/robots.txt/).nil?
        return response.redirect(self.url, 301)
      end
      process_without_redirect(request, response)
    end
  end
end
