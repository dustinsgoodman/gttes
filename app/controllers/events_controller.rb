class EventsController < ApplicationController

  before_filter :load_event, :only => [:show, :edit, :update, :destroy]

  # GET /calendars
  # GET /calendars.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /calendars/new
  # GET /calendars/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calendars/1
  # PUT /calendars/1.json
  def update

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to calendars_url }
      format.json { head :no_content }
    end
  end

  private

  def load_event
    @event = Event.find(params[:id])
  end
end
