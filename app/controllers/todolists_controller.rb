class TodolistsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    list = List.new(list_params)
    list.save
    redirect_to todolist_path(list.id)
  end
  # １. データを新規登録するためのインスタンス作成
  # ２. データをデータベースに保存するためのsaveメソッド実行
  # ３. 投稿詳細画面へリダイレクト
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end
  # データ（レコード）を1件取得
  # データ（レコード）を削除
  # 投稿一覧画面へリダイレクト
  
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  # ストロングパラメータ
end
