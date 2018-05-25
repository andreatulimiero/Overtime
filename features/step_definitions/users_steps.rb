Given("I am a logged in user") do
    @user = User.create!(:email => 'user@user.com', :password => 'passpass')
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
        visit('/users/sign_up')
        fill_in('Email', :with => email)
        fill_in('First name', :with => email)
        fill_in('Last name', :with => email)
        fill_in('Password', :with => password)
        fill_in('Password confirmation', :with => password)
        click_button('Sign up')
    end
end
  
  World(LoginSteps)