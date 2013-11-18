module Configer
  Trackers = Konf.new('config/trackers.yml')[Rails.env]
  Domains = Konf.new('config/domains.yml')[Rails.env]
end
