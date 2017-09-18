require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("pg")

DB = PG.connect({:dbname => "to_do"})


get ('/') do
  @contacts = Contact.all
  erb(:input)
end

post ('/')do
  @first_name = params.fetch('first_name')
  @last_name = params.fetch('last_name')
  @job_title = params.fetch('job_title')
  @company = params.fetch('company')
  @type = params.fetch('type')
  @street_address = params.fetch('street_address')
  @city = params.fetch('city')
  @state = params.fetch('state')
  @zip = params.fetch('zip')
  attributes = {:first_name=> @first_name, :last_name=> @last_name, :job_title=> @job_title, :company=> @company, :type=> @type, :street_address=> @street_address, :city=> @city, :state=> @state, :zip=> @zip}
  @contact = Contact.new(attributes)
  @contact.save()
  @contacts = Contact.all
  erb(:input)
end

get('/output/:id') do
  @contact = Contact.find(params[:id])
  erb(:output)
end

post('/')do
  @phone = Phone.new( )
end
