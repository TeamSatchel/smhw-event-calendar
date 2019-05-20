class User::Create
  include Interactor

  expose :user

  def initialize(user:)
    @user_params = user
  end

  def call
    @user = User.new(@user_params)

    validate(@user)

    @user.save!
  end

end
