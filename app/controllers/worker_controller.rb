
class WorkerController < ApplicationController
  def index
  end

  def start
    HardWorker.perform_async('manual job', 1000)
    flash[:notice] = 'HardWorker started its work'
    redirect_to :root
  end
end
