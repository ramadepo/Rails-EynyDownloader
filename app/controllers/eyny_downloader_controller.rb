class EynyDownloaderController < ApplicationController
  def index
    @downloader = EynyDownloader.new
  end
  def download
    @downloader = EynyDownloader.new
    target = @downloader.load(params[:eyny_downloader][:url])
    @downloader.download(target, params[:eyny_downloader][:filename])
    if @downloader.result
      sent_to_user
    else
      redirect_to eyny_downloader_path
    end
  end
  def sent_to_user
    data = open(@downloader.download_path)
    send_data(data.read, filename: @downloader.filename)
    File.delete(@downloader.download_path)
  end
end
