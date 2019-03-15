class Post < ActiveRecord::Base
    belongs_to :category
    validates :title, :content, :category_id, presence: true
    has_many :line_items, inverse_of: :order

    def index
        if params[:category].blank?
          @posts = Post.all.order("created_at DESC")
          else
          @category_id = Category.find_by(name: params[:category]).id
          @posts = Post.where(category_id: @category_id).order("created_at DESC")
          end
        end
end
