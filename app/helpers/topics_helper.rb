module TopicsHelper
    def user_is_authorized_for_topics?
        current_user && !current_user.member?
    end
    
    def user_can_delete_topic?
        current_user && current_user.admin?
    end
end
