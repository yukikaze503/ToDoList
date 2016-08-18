class TodosController < ApplicationController
  before_action :load_todo, only: [:edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos ||= todo_scope.all
    build_todo
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # # GET /todos/new
  # def new
  #   @todo = Todo.new
  # end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    build_todo
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    build_todo
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_path, notice: 'Todo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
    end
  end

  private
    def load_todo
      @todo ||= todo_scope.find(params[:id])
    end

    def build_todo
      @todo ||= todo_scope.new
      @todo.attributes = todo_params
    end

    def load_todos
      @todos ||= todo_scope.all
    end

    def todo_scope
     Todo.ordered
    end

    def todo_params
      todo_params = params[:todo]
      todo_params ? todo_params.permit(:title, :remark, :is_finished) : {}
    end
  end
