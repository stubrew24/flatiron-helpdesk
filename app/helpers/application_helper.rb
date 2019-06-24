module ApplicationHelper

    def error_messages_for(object)
        render(:partial => 'application/error_messages', :locals => {:object => object})
    end

    def status_tag(boolean, options={})
        options[:true_text] ||= ''
        options[:false_text] ||= ''
        if boolean
            content_tag(:span, options[:true_text], style: 'display: block; width: 16px; height: 16px; background-color: green; color:green;')
        else 
            content_tag(:span, options[:false_text], style: 'display: block; width: 16px; height: 16px; background-color: red; color:red;')
        end
    end
    
end
