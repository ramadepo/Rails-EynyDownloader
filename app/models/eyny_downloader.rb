require 'nokogiri'
require 'open-uri'

class EynyDownloader < ApplicationRecord
  attr_reader :result, :target
  def load(url)
    pre_web = URI::escape(url.to_s)
    web = Nokogiri::HTML(open(pre_web))
    source_tag = web.css('div#video_container video#mediaplayer source').first
    if source_tag
      @target = source_tag.attribute('src').to_s
    else
      @target = nil
    end
  end
  def download(url, filename)
    path = "~/Downloads/" unless path
    system_command = "wget -O #{path}#{filename}.mp4 #{url}"
    @result = system(system_command)
  end
end