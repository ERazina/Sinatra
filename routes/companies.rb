namespace '/api/v1' do

  require 'json'

  # WORK!
  # All companies, filtered
  # get 'http://localhost:4567/companies?name=Mo
  get '/companies' do
    companies = Company.all
    puts "params = #{params.inspect}"
    puts "companies = #{companies.inspect}"
    return connection_to_api(companies) if params.empty?
    if params['name']
      puts 'name'
      companies_all = Company.by_name(params['name'])
      if params['location']
        puts 'name + location'
        companies = companies_all.by_location(params['location'])
        puts "companies = #{companies.inspect}"
      else
        puts 'name NO location'
        companies = companies_all
      end
    else
      if params['location']
        puts 'location'
        companies = Company.by_location(params['location'])
      end
    end
    collection_to_api(companies)
  end





  # def connection_to_api(collection)
  #   MultiJson.dump(connection.map { |s| s.to_api })
  # end

  def self.geeks_applied_unread(name)
    geeks_applied = Apply.unread
    return geeks_applications(geeks_applied) if name.blank?
    name_filtering(geeks_applied, name)
  end

  # WORK -
  # All jobs of the company
  # get http://localhost:4567/api/v1/company_jobs?name=Mo
  get '/company_jobs' do
    Company.company_jobs(params[:name])
    # call_one_method(Company, 'company_jobs', params[:name])
  end

  # WORK -
  # get http://localhost:4567/api/v1/company/2
  get '/company/:id' do
    puts "id = #{params[:id]}"
    company = Company.where(id: params[:id].to_i)
    puts "company.to_a = #{company.to_a}"
    puts "company.to_a[0].values.to_json = #{company.to_a[0].values.to_json}"
    company.to_a[0].values.to_json
  end

  # http://localhost:4567/api/v1/companies?name=Deter&location=Ubud
  post '/companies' do
    company = Company.create(params)
    company.nil? ? [].to_json : company.values.to_json
  end

end