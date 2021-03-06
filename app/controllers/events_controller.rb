class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'event was successfully created.' }
        format.json { render action: 'show', status: :created, location: event_path(@event) }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'event was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: event_path(@event) }
      else
        format.html { render action: 'edit' }
        format.json { render json: event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end


  private

  def set_event
      @event = Event.find(params[:id])
    end

  def event_params
    params.require(:event).permit(:title, :body, :company_id)
  end
end
