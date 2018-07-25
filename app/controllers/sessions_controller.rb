class SessionsController < ApplicationController


  def create
    # user = User.find_by_email(params[:email])
    # # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])
    #   # Save the user id inside the browser cookie. This is how we keep the user 
    #   # logged in when they navigate around our website.
    # else
    #   # If user's login doesn't work, send them back to the login form.
      
    # end
    
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      puts 'inside session controller user = ' + user.to_s
      session[:user_id] = user.id
      #     # success logic, log them in
      redirect_to '/'
    else
      #     # failure, render login form
      redirect_to '/login'
    end

    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  

end

