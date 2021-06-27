# require 'rails_helper'
# describe "#update" do
#   # 別ユーザーのTaskを更新しようとした場合
#   context "if logged in customer updates another customer" do
#     # 各example(it〜end)の前に「@user」「other_user」「(other_userの)@task」を作成
#     before do
#       @customer = FactoryBot.create(:customer)
#       other_customer = FactoryBot.create(:customer)
#       @task = FactoryBot.create(:task,
#         owner: other_user,
#         name: "Same Old Name")
#     end
    
#     # プロジェクトを更新できないことを確認
#     it "does not update the task" do
#       # nameを更新するための式を、変数「task_params」に格納
#       task_params = FactoryBot.attributes_for(:task, name: "New Name")
#       # @userとしてログイン
#       sign_in @customer
#       #「task_params」を、@taskに対してPATCHで送信する
#       patch :update, params: { id: @task.id,task: task_params }
#       # @taskのnameを更新しても、変更されていないことを確認
#       expect(@task.reload.name).to eq "Same Old Name"
#     end
    
#     # ルートページへリダイレクトすること
#     it "redirects to the dashboard" do
#       # Taskのインスタンスを生成するための情報を「task_params」に格納
#       task_params = FactoryBot.attributes_for(:task)
#       # @userとしてログイン
#       sign_in @customer
#       #「task_params」を、@taskに対してPATCHで送信する
#       patch :update, params: { id: @task.id,task: task_params }
#       # ルートページに遷移することを確認
#       expect(response).to redirect_to root_path
#     end
#   end
# end