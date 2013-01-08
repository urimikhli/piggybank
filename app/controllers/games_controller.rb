class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all
    @studios = Studio.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])
    @rand_score = 1+rand(1000)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
    
   
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new
    #@studios = Studio.getStudios
    @studios = Studio.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    @studios = Studio.all
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])
    @studios = Studio.all
    
    #@game.studio_name = Studio.getSingleStudioNameById(params[:studio_id])
    respond_to do |format|
      if @game.save
        format.html { redirect_to(@game, :notice => 'Game was successfully created.') }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])
    @studios = Studio.all
    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to(@game, :notice => 'Game was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end
end
