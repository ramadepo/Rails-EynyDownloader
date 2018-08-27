require 'rails_helper'

RSpec.describe EynyDownloader, type: :model do
  describe "伊莉影片下載" do
    it "輸入網址成功" do 
      downloader = EynyDownloader.new
      correct_url = "http://video.eyny.com/watch?v=5iLJtYAxhmO"
      correct_target = downloader.load(correct_url)
      expect(correct_target.length == 0).to be false
    end
    it "輸入網址錯誤" do
      downloader = EynyDownloader.new
      wrong_url = "http://apple.com"
      wrong_target = downloader.load(wrong_url)
      expect(wrong_target).to be nil
    end
    it "下載成功" do
      downloader = EynyDownloader.new
      url = downloader.load("http://video.eyny.com/watch?v=5iLJtYAxhmO")
      downloader.download(url, "aaa")
      expect(downloader.result).to be true
    end
  end
end
