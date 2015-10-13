module TopicsHelper
    def user_is_authorized_for_topics?
        current_user && current_user.admin?
    end
    
    def topic_type_button
        if @topic.public
            link_to "Public", topics_path(:scope => "publicly_viewable"), class: 'btn-xs btn-success'
        else
            link_to "Private", topics_path(:scope => "privately_viewable"), class: 'btn-xs btn-danger'
        end
    end
end
