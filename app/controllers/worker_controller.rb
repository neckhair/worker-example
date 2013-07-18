
class WorkerController < ApplicationController
  def index
  end

  def start
    if HardWorker.perform_async("manual job", 10000000)
      flash[:notice] = 'HardWorker started its work'
    end
    redirect_to :root
  end
end
