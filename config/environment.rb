# Load the Rails application.
#
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

=begin
require 'amazon/ecs'
Amazon::Ecs.debug = true
Amazon::Ecs.options = {
  :AWS_access_key_id => "AKIAIXOA2MM3UKO5RXWQ",
  :AWS_secret_key => "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",
  :associate_tag => "asa518649-22",
}
=end
