class ClothsController < ApplicationController
  before_action :set_cloth, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:home, :cloth_by_category]
 
  # GET /cloths
  # GET /cloths.json
  def home
      @cloths = Cloth.where(:category => "Heros" )
      @cart = current_cart
      @number_of_cloths = Cloth.count('id', :distinct => true)

  end

  def home_mobile
      @cloths = Cloth.all
      @cart = current_cart
      @number_of_cloths = Cloth.count('id', :distinct => true)

  end

  def cloth_by_category
      if params[:category]
        @cloths = Cloth.where("category = ? ", params[:category ])
      end
  end

  def index
    @cloths = Cloth.all
  end

  # GET /cloths/1
  # GET /cloths/1.json
  def show
  end

  # GET /cloths/new
  def new
    @cloth = Cloth.new
  end

  # GET /cloths/1/edit
  def edit
  end


  # POST /cloths
  # POST /cloths.json
  def create
    @cloth = Cloth.new(cloth_params)

    respond_to do |format|
      if @cloth.save
        format.html { redirect_to @cloth, notice: 'Cloth was successfully created.' }
        format.json { render :show, status: :created, location: @cloth }
      else
        format.html { render :new }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cloths/1
  # PATCH/PUT /cloths/1.json
  def update
    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to @cloth, notice: 'Cloth was successfully updated.' }
        format.json { render :show, status: :ok, location: @cloth }
      else
        format.html { render :edit }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cloths/1
  # DELETE /cloths/1.json
  def destroy
    @cloth.avatar = nil
    @cloth.save
    @cloth.destroy
    respond_to do |format|
      format.html { redirect_to cloths_url, notice: 'Cloth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloth
      @cloth = Cloth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cloth_params
      params.require(:cloth).permit(:avatar, :price, :item_code, :item_name, :category,:available_size,:available_color,:brand)
 

    end



  def layout_per_action
   if action_name == "home_mobile"
    false
   else
    "application"
   end
  end
  
end
