class ChatController < ApplicationController
  def ask
    if params[:question].present?
      service = ChatGptService.new
      begin
        @response = JSON.parse(service.chat("以下のお題に対して、有益な情報をタイトルとその具体例をJSON配列（キーは必要ありません）で5個ください 具体例は〜が良いや、〜できるみたいな形で終わらせてください。お題：#{params[:question]}"))
        # @responseをeachで回してpostsテーブルに保存
        @response.each do |key, value|
          Post.create(
            title: value["title"],
            content: value["example"],
            question_content: params[:question],
            user_id: current_user.id
          )
        end
      rescue JSON::ParserError => e
        @response = { error: "エラーが発生しました: #{e.message}" }
      end
    end
    # render json: { response: @response }
    @categories = Category.where(user_id: current_user.id)
    @posts = current_user.posts.order("RAND()").all
    @post = Post.new
  end
end