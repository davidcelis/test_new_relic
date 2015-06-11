class UsersAPI < BaseAPI
  USERS = [
    { username: 'davidcelis', awesome: true },
    { username: 'jasonrclark', awesome: true },
    { username: '1337807', awesome: true },
    { username: 'benweint', awesome: false, traitorous: true }
  ]

  let(:user_params) { params.require(:user).permit(:username, :awesome, :traitorous) }

  get { USERS }

  post do
    USERS << user_params.dup

    head :created
  end

  param :username do
    let(:user) do
      USERS.find { |u| u[:username] == params[:username] } or error! :not_found
    end

    get { user }

    patch do
      user.merge!(user_params)

      user
    end

    delete do
      USERS.delete(user)

      head :no_content
    end
  end
end
