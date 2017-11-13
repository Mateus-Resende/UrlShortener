require 'uri'

class UrlDatum
  include Mongoid::Document
  include Mongoid::Timestamps

  field :long_url, type: String
  field :short_url, type: String
  field :hits, type: Integer, default: 0

  index({long_url: 1, short_url: 1})
  index({short_url: 1})

  before_save :create_short_url

  def create_short_url
    charset = Array('A'..'Z') + Array('0'..'9') + Array('a'..'z') + Array('0'..'9') + Array('A'..'Z') + Array('0'..'9')
    self.short_url = Array.new(6) { charset.sample }.join
  end

  def get_complete_url
    final_url = ''

    if long_url =~ /https/
      final_url = long_url

    elsif long_url =~ /http/
      final_url = long_url
    else
      final_url = 'http://' + long_url
    end

    final_url
  end
end
