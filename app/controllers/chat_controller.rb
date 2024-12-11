class ChatController < ApplicationController
  def ask
    if params[:question].present?
      service = ChatGptService.new
      begin
        @response = JSON.parse(service.chat("以下のお題に対して、有益な情報をタイトル(キー:title)とその具体例(キー:example)をJSON配列（キーは数字でお願いします）で5グループください 具体例は〜が良い、〜できるみたいな形で終わらせてください。お題：#{params[:question]}"))
        # @responseをeachで回してpostsテーブルに保存
        @response.each do |key, value|
          if value.key?("title") && value.key?("example")
            Post.create(
              title: value["title"],
              content: value["example"],
              question_content: params[:question],
              user_id: current_user.id
            )
          else
            Rails.logger.error("Missing keys in response: #{value}")
          end
        end
        # render json: { response: @response }
      rescue JSON::ParserError => e
        @response = { error: "エラーが発生しました: #{e.message}" }
      end
    end
    @categories = Category.where(user_id: current_user.id)
    @posts = current_user.posts.order("RAND()").all
    @post = Post.new
  end
end