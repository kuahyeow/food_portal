class HomeController < ApplicationController
  layout 'mobile'

  before_filter :initialise_shopping_list

  def index
  end

  def add_item
    item = params[:item]
    price = params[:price]
    @items << item
    # TODO show item that was added
    redirect_to :action => :index
  end

  def checkout
    @grouped_items = @items.group_by(&:to_s)
  end

  def list
    @grouped_items = @items.group_by(&:to_s)

    @other_lists = session[:lists].map{|l| [l[:list_name], l[:items].group_by(&:to_s)]}
  end

  def create_list
    session[:lists] << {:list_name => params[:list_name], :items => []}
    redirect_to :action => :list
  end

  protected
  def initialise_shopping_list
    session[:prices] ||= {}

    session[:lists] ||= []
    session[:current_list] ||= 'My List'
    if params[:selected_list]
      session[:current_list] = params[:selected_list]
    end
    @current_list = session[:current_list]
    list = session[:lists].detect{|l| l[:list_name] == @current_list}
    if list.nil?
      list = {:list_name => @current_list, :items => []}
      session[:lists] << list
    end

    @items = list[:items]

  end
end
