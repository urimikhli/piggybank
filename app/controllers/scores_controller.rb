class ScoresController < ApplicationController
  
  #before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authenticate_user!
  
  # GET /scores
  # GET /scores.xml
  def index
    @scores = Score.all
    #@scores_by_game = Score.byGame
    @scores_by_game = Score.byUser(current_user.id)

    @redemption_by_adv = Redemption.byGame
    @redemption_by_game = Redemption.byGameNoAdv
    @adver = Advertiser.all
    if params[:score].present?
      @scoring_user = User.getIdByemail(current_user.email).first
      @new_score = Score.new({:game_name=>params[:game_name],:score=>params[:score],:user_id =>@scoring_user.user_id })
      respond_to do |format|
        if @new_score.save
          format.html { redirect_to(scores_url) }
        end
      end
    else if params[:advertiser].present?
        @announcment = "your gift card is on its way now"
      @redeemed = Redemption.new({:amount=>params[:amount],
                                   :advertiser_name=>params[:advertiser],
                                   :game_name=>params[:game_name],
                                   :developer_name=>params[:studio_name],
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
