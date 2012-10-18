
class WorkerController < ApplicationController
  def index
  end

  def start
    HardWorker.perform_async('bob', 5)
    flash[:notice] = 'HardWorker started its work'
    redirect_to :root
  end
end
