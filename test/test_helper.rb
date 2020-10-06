require 'simplecov'
SimpleCov.start do
  add_filter 'test/'
end
require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new