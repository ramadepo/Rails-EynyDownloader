class EynyDownloaderController < ApplicationController
  def index
    @downloader = EynyDownloader.new
  end
  def download
    @downloader = EynyDownloader.new
    target = @downloader.load(params[:eyny_downloader][:url])
    @downloader.download(target, params[:eyny_downloader][:filename])
    redirect_to eyny_downloader_path
  end
end
