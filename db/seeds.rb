# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the 
######## rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# companies = Company.create([
# 	{name: "Chronicle X Media",
# 	about: "Chronicle X is a full service media agency, focusing on social, search and web development. We are located in the heart of Silicon Beach alongside many other successful startups. It is here where our unique approach, talented team and core vision has helped us flourish.",
# 	address: "1316 3rd Street Promenade, Suite B5, Santa Monica, California 90401"},
# 	{name: "Solien",
# 	about: "Solien is a Microsoft Gold Certified Partner and is a Microsoft Managed Partner in Southern California in the areas of Business Intelligence and SQL Server.",
# 	address: "510 Arizona Ave., Suite 200, Santa Monica, CA 90401"}])

	cb_key = ENV["CB_CLIENT_ID"]
	@users = User.all
	@companies = Company.all
	@info = CompanyInfo.all

	uri = HTTParty.get("http://api.crunchbase.com/v/2/organizations?user_key="+cb_key)
	crunchbase = JSON.parse(uri.body)
	@cbarray = []
	# @otherarray = []

	crunchbase['data']['items'].each do |x| 
		@cbarray.push(x)
	end
    # @cbarray.push(crunchbase['data']['items'].e)
   
    @cbarray.each do |p|
       @company_info  = Company.new(p)
       @company_info.save
    end