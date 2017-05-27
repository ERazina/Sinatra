namespace '/api/v1' do

  #  # WORK -
  # get '/jobs -- http://localhost:4567/jobs?company=Spring
  # http://localhost:4567/jobs?place=Remo
  # http://localhost:4567/jobs?company= - all
  get '/jobs' do
    logger.info "Logger In get /gobs"
    jobs = Job.all
    [:place, :name].each do |filter|
      jobs = jobs.send(filter, params[filter]) if params[filter]
    end
    collection_to_api(jobs)
  end

  # WORK -
  get '/job/:id' do
    job = Job.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
    puts "job id = #{job.id.inspect} "
    puts "job = #{job.values.inspect} "
    job.values.to_json # serialization
  end

  # WORK -
  # http://localhost:4567/api/v1/jobs_company/Wirkkle
  get '/jobs_company/:name' do
    company = Company.where(name: params[:name]).first
    halt(404, { message:'Company Document Not Found', status: 404, params_id: params[:id]}.to_json) unless company
    company_id = company.id
    puts "company id = #{company_id.inspect}"

    jobs = Job.where(company_id: company_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless jobs
    # puts "job id = #{job.id.inspect} "
    # puts "job = #{job.values.inspect} "
    collection_to_api(jobs)
  end


  # POST!
  # Create new job by one company
  # http://localhost:4567/api/v1/job?company_id=2;name=Jira;place=Remote
  post '/job' do
    job = Job.new(request.params)
    halt(422, { message:'Unprocessible Entity', status: 422, params: request.params}.to_json) unless job
    puts "json_params = ", request.params.to_json
    if job.save
      status 200
      job.to_json
    else
      raise StandardError.new("In POST '/geeks' - Unprocessible Entity 422")
    end
  end

  # job found by id:, to be deleted
  # http://localhost:4567/api/v1/job/58a566d6e61837294749441a
  delete '/job/:id' do
    job = Job.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
    puts "job id = #{job.id.inspect} "
    if job.delete
      status 204
      puts "Status = #{status} = deleted"
    else
      raise StandardError.new("In DELETE '/job/:id' - Unprocessible Entity 422")
    end
  end
end
