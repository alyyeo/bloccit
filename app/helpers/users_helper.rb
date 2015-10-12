module UsersHelper
    def any_posts?
        @user.posts.any?
    end
    
    def any_comments?
        @user.comments.any?
    end
    
    def any_favorites?
        @user.favorites.any?
    end
end
