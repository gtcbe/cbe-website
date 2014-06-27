class DynamicRouter
	
	def self.load
		Gtcbe::Application.routes.draw do
			Blogpost.all.each do |post|
				puts "Routing #{post.name}"
				get "blog/#{post.name}", :to => "blogposts#show", defaults: { id: post.id }
			end
			WikiPage.all.each do |page|
				puts "Routing #{page.name}"
				get "wiki/#{page.name}", :to => "wiki_pages#show", defaults: { id: page.id }
			end
		end
	end
	
	def self.reload
		Gtcbe::Application.routes_reloader.reload!
	end
	
end
