module ApplicationHelper
	def selected_params
	  "#{add_space(params[:search].try(:[], 'category'))}
	   #{add_space(params[:search].try(:[], 'category1'))}
	   #{add_space(params[:search].try(:[], 'category2'))}
	   #{add_space(params[:search].try(:[], 'category3'))}"
	end

	def add_params(searched_params)
	  searched_param << "&nbsp;&nbsp;&nbsp;" if searched_param.present?
	end
end
