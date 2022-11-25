class BasesController < ApplicationController
  before_action :set_base, only: [:edit, :update, :destroy]
  before_action :admin_user
  
  
  def index
    @bases = Base.all
    
  end
  
  def new
    @base = Base.new
  end
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = "拠点情報を作成しました。"
      redirect_to bases_url
    else
      flash[:danger] = '拠点情報の作成に失敗しました。'
      render  :new
    end
  end
  
  def edit
  end
  
  def update
    if @base.update_attributes(base_params)
      flash[:success] = "拠点情報を更新しました。"
      redirect_to bases_url
    else
      flash[:danger] = '拠点情報の更新に失敗しました。'
      redirect_to bases_url
    end
  end
  
  def destroy
    @base.destroy
    flash[:success] = "#{@base.name}のデータを削除しました。"
    redirect_to bases_url
  end 
  
  private
  
    def base_params
       params.require(:base).permit(:base_id, :name, :attendance)
    end
    
     def set_base
      @base = Base.find(params[:id])
     end

end
