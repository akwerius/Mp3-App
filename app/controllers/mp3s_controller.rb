class Mp3sController < ApplicationController
  # GET /mp3s
  # GET /mp3s.xml
  def index

    @mp3s = Mp3.all
 	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mp3s }
    end
  end

  # GET /mp3s/filter
  # GET /mp3s/filter.xml
  def filter

 if (params[:Mp3][:Artist].empty? && params[:Mp3][:Rating].empty?)   
	 	 @filtered_mp3s = Mp3.all
 else
 	if (params[:Mp3][:Artist] && params[:Mp3][:Rating].empty?)
  		@filtered_mp3s = Mp3.by_artist(params[:Mp3][:Artist]).all
	else
	 if (params[:Mp3][:Artist].empty? && params[:Mp3][:Rating])  
		@filtered_mp3s = Mp3.by_rating(params[:Mp3][:Rating]).all   
	 else
  		@filtered_mp3s = Mp3.by_artist(params[:Mp3][:Artist]).by_rating(params[:Mp3][:Rating]).all	
	 end
  	end
 end


    respond_to do |format|
      format.html { render "mp3s/m3u" }
      format.xml  { render :xml => @mp3 }

      end
  end


  # GET /mp3s/1
  # GET /mp3s/1.xml
  def show
    @mp3 = Mp3.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mp3 }
    end
  end

  # GET /mp3s/new
  # GET /mp3s/new.xml
  def new
    @mp3 = Mp3.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mp3 }
    end
  end

  # GET /mp3s/1/edit
  def edit
    @mp3 = Mp3.find(params[:id])
  end

  # POST /mp3s
  # POST /mp3s.xml
  def create
    @mp3 = Mp3.new(params[:mp3])

    respond_to do |format|
      if @mp3.save
        format.html { redirect_to(@mp3, :notice => 'Mp3 was successfully created.') }
        format.xml  { render :xml => @mp3, :status => :created, :location => @mp3 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mp3.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mp3s/1
  # PUT /mp3s/1.xml
  def update
    @mp3 = Mp3.find(params[:id])

    respond_to do |format|
      if @mp3.update_attributes(params[:mp3])
        format.html { redirect_to(@mp3, :notice => 'Mp3 was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mp3.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mp3s/1
  # DELETE /mp3s/1.xml
  def destroy
    @mp3 = Mp3.find(params[:id])
    @mp3.destroy

    respond_to do |format|
      format.html { redirect_to(mp3s_url) }
      format.xml  { head :ok }
    end
  end
end
