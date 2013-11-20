Blog::Trackers = Konf.new('config/trackers.yml')[Rails.env]
Blog::Domains = Konf.new('config/domains.yml')[Rails.env]
Blog::SeoData = Konf.new('config/seo_data.yml')
