module Fibo
  class NotConfigured < Exception; end
  class << self
    attr_accessor :minimal_age, :canvas_page, :scope, :oauth_dialog_url
  end

  def self.canvas_page
    @canvas_page || raise_unconfigured_exception
  end

  def self.minimal_age
    @minimal_age || raise_unconfigured_exception
  end

  def self.scope
    @scope || raise_unconfigured_exception
  end

  def self.raise_unconfigured_exception
    raise NotConfigured.new("No configuration provided for Fibo. Either set the canvas_page and scope or call Fibo.load_fibo_yaml in an initializer")
  end

  def self.configuration=(hash)
    self.minimal_age = hash[:minimal_age] ? hash[:minimal_age] : 0
    self.canvas_page = hash[:canvas_page]
    self.scope       = hash[:scope]
    self.oauth_dialog_url = 'https://www.facebook.com/dialog/oauth'
  end

  def self.load_fibo_yaml
    config = (YAML.load(ERB.new(File.read(File.join(::Rails.root,"config","fibo.yml"))).result)[::Rails.env])
    raise NotConfigured.new("Unable to load configuration for #{::Rails.env} from fibo.yml. Is it set up?") if config.nil?
    self.configuration = config.with_indifferent_access
  end
end

require 'fibo/rails/controller'
require 'fibo/engine'
