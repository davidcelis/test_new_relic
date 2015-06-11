# Define root-level routes here, or mount your sub-apis that you've defined in
# the app/apis/ directory. Additionally, you can mount any Rack application.
Crepe.application.routes do
  respond_to :json

  # curl 0.0.0.0:9292/
  # => {"hello":"world"}
  get :health do
    { status: 'OK' }
  end

  namespace :v1 do
    get :health do
      { status: 'OK' }
    end

    mount UsersAPI   => :users
    mount WigglesAPI => :wiggles
  end
end
