module ApplicationHelper
	
	def bootstrap_class_for_flash(type)
  	case type
    	when 'notice' then "alert-success"
    	when 'alert' then "alert-warning"
  	end
	end
	
end
