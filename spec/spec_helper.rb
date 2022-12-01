# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), '..', 'challenges', 'shared', '**', '*.rb')].sort.each do |file|
  require file
end

Dir[File.join(File.dirname(__FILE__), '..', 'challenges', '20*', '**', '*.rb')].sort.each do |file|
  require file
end

RSpec.configure do |config|
end
