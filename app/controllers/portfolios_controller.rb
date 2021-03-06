class PortfoliosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_portfolio_items, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :react], user: {except: [:destroy, :new, :create, :edit, :update, :sort]}, site_admin: :all

    def index
        @portfolio_items = Portfolio.by_position
    end

    def sort
      params[:order].each do |key, value|
        Portfolio.find(value[:id]).update(position: value[:position])
      end

      head :ok
    end

    def react
      @react_portfolio_items = Portfolio.react_js
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params)
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
          else
            format.html { render :new }
          end
        end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def show
    end

    def destroy
      @portfolio_item.delete
      respond_to do |format|
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully destroyed.' }
      end
    end

    private
      def portfolio_params
        params.require(:portfolio).permit(
                                    :title, 
                                    :subtitle, 
                                    :body, 
                                    :thumb_image,
                                    :main_image,
                                    technologies_attributes: [:id, :name, :_destroy]
                                  )
      end
      def set_portfolio_items
        @portfolio_item = Portfolio.find(params[:id])
      end
end
