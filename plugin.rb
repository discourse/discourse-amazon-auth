# frozen_string_literal: true

# name: discourse-login-with-amazon
# about: Enables login authentication via Login with Amazon
# meta_topic_id: 117564
# version: 0.0.1
# authors: Alan Tan
# url: https://github.com/discourse/discourse-login-with-amazon

enabled_site_setting :enable_login_with_amazon

gem "omniauth-amazon", "1.0.1"

register_svg_icon "fab-amazon"

%w[
  ../lib/auth/login_with_amazon_authenticator.rb
  ../lib/validators/enable_login_with_amazon_validator.rb
  ../lib/omniauth/strategies/amazon.rb
].each { |path| load File.expand_path(path, __FILE__) }

auth_provider authenticator: Auth::LoginWithAmazonAuthenticator.new, icon: "fab-amazon"
