class ItemsController < ApplicationController
  before_action :set_todo_list

  def create
    @item = @todo_list.items.create(item_params)
    redirect_to @todo_list
  end

  def destroy
    @item = @todo_list.items.find(params[:id])
    if @item.destroy
      flash[:success] = 'Todo List task has been deleted.'
    else
      flash[:error] = 'Todo List task could not be deleted'
    end
    redirect_to @todo_list
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def item_params
    params[:item].permit(:content)
  end
end
