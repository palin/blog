Blog::Trackers = Konf.new('config/trackers.yml')[Rails.env]
Blog::Domains = Konf.new('config/domains.yml')[Rails.env]

