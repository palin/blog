require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['NEGATIVE_CAPTCHA_SECRET'] = "d4c9be586766a905ea09649b9143cd4e3c8cbe5aaddb128d046cc374934b8155811dbad9b909bb4772c2a04d63ee258612de6ec068e72b94561fbb0dbff311d1"

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
