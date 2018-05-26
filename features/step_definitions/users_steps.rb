Given("I am a logged in user") do
    @user = User.create!(:email => 'user@user.com', :password => 'passpass')
    @current_user = @user
    login(@user.email, 'passpass')
end  

Given("I am another logged in user") do
    @user = User.create!(:email => 'otheruser@user.com', :password => 'passpass')
    @current_user = @user
    login(@user.email, 'passpass')
end

module LoginSteps
    def login(email, password)
        visit('/users/sign_in')
        fill_in('Email', :with => email)
        fill_in('Password', :with => password)
        click_button('Log in')
    end
    def register(email, password)
        pass
    end
end
  
  World(LoginSteps)