require 'nokogiri'
require 'open-uri'

class EynyDownloader < ApplicationRecord
  attr_reader :result, :target, :filename, :download_path
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
  def download(url, name)
    @filename = name.to_s + ".mp4"
    @download_path = File.join(Rails.root, 'public', 'my_temp', filename)
    system_command = "wget -O #{download_path} #{url}"
    @result = system(system_command)
  end
  
end