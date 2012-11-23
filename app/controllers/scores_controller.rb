class ScoresController < ApplicationController
  # GET /scores
  # GET /scores.xml
  def index
    @scores = Score.all
    @scores_by_game = Score.byGame
    @redemption_by_adv = Redemption.byGame
    @redemption_by_game = Redemption.byGameNoAdv
    if params[:score].present? 
      @new_score = Score.new({:game_name=>params[:game_name],:score=>params[:score]})
      respond_to do |format|
        if @new_score.save
          format.html { redirect_to(scores_url) }
        end
      end
    else if params[:advertiser].present?
        @announcment = "your gift card is on its way now"
      @redeemed = Redemption.new({:amount=>params[:amount],
                                   :advertiser=>params[:advertiser],
                                   :game_name=>params[:game_name],
                                   :developer_name=>params[:developer_name],
                                   :redemption_type=>params[:redemption_type]})
      respond_to do |format|
        if @redeemed.save
          format.html { redirect_to(scores_url) }
        end
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @scores }
      end
    end  
    end
  end

  # GET /scores/1
  # GET /scores/1.xml
  def show
    @score = Score.find(params[:id])

    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @score }
    end
  end
  
  # GET /scores/new
  # GET /scores/new.xml
  def new
    @score = Score.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @score }
    end
  end

  # GET /scores/1/edit
  def edit
    @score = Score.find(params[:id])
  end

  # POST /scores
  # POST /scores.xml
  def create
    @score = Score.new(params[:score])

    respond_to do |format|
      if @score.save
        format.html { redirect_to(@score, :notice => 'Score was successfully created.') }
        format.xml  { render :xml => @score, :status => :created, :location => @score }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scores/1
  # PUT /scores/1.xml
  def update
    @score = Score.find(params[:id])

    respond_to do |format|
      if @score.update_attributes(params[:score])
        format.html { redirect_to(@score, :notice => 'Score was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.xml
  def destroy
    @score = Score.find(params[:id])
    @score.destroy

    respond_to do |format|
      format.html { redirect_to(scores_url) }
      format.xml  { head :ok }
    end
  end
end
