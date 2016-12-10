class SubmitRequestsController < ApplicationController
  before_action :set_submit_request, only: [:show, :edit, :update, :destroy, :approve]
  before_action :authenticate_user!

  # GET /submit_requests
  # GET /submit_requests.json
  def index
    @submit_requests = SubmitRequest.where(user_id: current_user.id)
  end

  # GET /submit_requests/1
  # GET /submit_requests/1.json
  def show
  end

  # GET /submit_requests/new
  def new
    @submit_request = current_user.submit_requests.build
  end

  # GET /submit_requests/1/edit
  def edit
  end

  # POST /submit_requests
  # POST /submit_requests.json
  def create
    @submit_request = current_user.submit_requests.build(submit_request_params)

    respond_to do |format|
      if @submit_request.save
        format.html { redirect_to @submit_request, notice: 'Submit request was successfully created.' }
        format.json { render :show, status: :created, location: @submit_request }
      else
        format.html { render :new }
        format.json { render json: @submit_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submit_requests/1
  # PATCH/PUT /submit_requests/1.json
  def update
    respond_to do |format|
      if @submit_request.update(submit_request_params)
        format.html { redirect_to @submit_request, notice: 'Submit request was successfully updated.' }
        format.json { render :show, status: :ok, location: @submit_request }
      else
        format.html { render :edit }
        format.json { render json: @submit_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submit_requests/1
  # DELETE /submit_requests/1.json
  def destroy
    @submit_request.destroy
    respond_to do |format|
      format.html { redirect_to submit_requests_url, notice: 'Submit request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #承認
  def approve
    if @submit_request.update(submit_request_params)
      @submit_request.task.update(charge_id: current_user.id)
      redirect_to inbox_submit_requests_path, notice: '依頼を承認しました。'
    else
      redirect_to inbox_submit_requests_path, notice: '不具合が発生しました。もう一度操作を行ってください。'
    end
  end
  
  #却下
  def reject
    if @submit_request.update(submit_request_params)
      redirect_to inbox_submit_requests_path, notice: '依頼を却下しました。'
    else
      redirect_to inbox_submit_requests_path, notice: '不具合が発生しました。もう一度操作を行ってください。'
    end
  end
  
  def inbox
    @submit_requests = SubmitRequest.where(request_user_id: current_user.id).where(status: 1)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submit_request
      @submit_request = SubmitRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submit_request_params
      params.require(:submit_request).permit(:user_id, :task_id, :message, :request_user_id, :status)
    end
end
