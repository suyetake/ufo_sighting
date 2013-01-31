class SightingsController < ApplicationController
  # GET /sightings
  # GET /sightings.json
  def index
    latitude = params[:latitude].to_d
    longitude = params[:longitude].to_d

    @sightings = Sighting.
        where("x_coord BETWEEN #{latitude - 1} AND #{latitude + 1}").
        where("y_coord BETWEEN #{longitude - 1} AND #{longitude + 1}").
        limit(500).
        all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sightings, methods: [:latitude, :longitude] }
    end
  end

  # GET /sightings/1
  # GET /sightings/1.json
  def show
    @sighting = Sighting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sighting }
    end
  end

  # GET /sightings/new
  # GET /sightings/new.json
  def new
    @sighting = Sighting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sighting }
    end
  end

  # GET /sightings/1/edit
  def edit
    @sighting = Sighting.find(params[:id])
  end

  # POST /sightings
  # POST /sightings.json
  def create
    @sighting = Sighting.new(params[:sighting])

    respond_to do |format|
      if @sighting.save
        format.html { redirect_to @sighting, notice: 'Sighting was successfully created.' }
        format.json { render json: @sighting, status: :created, location: @sighting }
      else
        format.html { render action: "new" }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sightings/1
  # PUT /sightings/1.json
  def update
    @sighting = Sighting.find(params[:id])

    respond_to do |format|
      if @sighting.update_attributes(params[:sighting])
        format.html { redirect_to @sighting, notice: 'Sighting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sightings/1
  # DELETE /sightings/1.json
  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy

    respond_to do |format|
      format.html { redirect_to sightings_url }
      format.json { head :no_content }
    end
  end
end
