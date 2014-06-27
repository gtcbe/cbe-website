module WikiPagesHelper

	def process_text text
		regex = /(@(\w+))/
	
		text.gsub(regex) do |match|
			page_name = $2
			page = WikiPage.find_by(name: page_name)
			if(page)
				link_to page.title, "#{wiki_path}/#{page_name}", :class => "valid_link"
			else
				link_to page_name.humanize, "#{wiki_path}/#{page_name}", :class => "invalid_link"
			end
		end
	end

	def cache_key_for_wiki_pages
		count          = WikiPage.count
		max_updated_at = WikiPage.maximum(:updated_at).try(:utc).try(:to_s, :number)
		"wiki_pages/all-#{count}-#{max_updated_at}"
	end
	
end
