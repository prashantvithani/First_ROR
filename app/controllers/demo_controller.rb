class DemoController < ApplicationController
  def index
  	render('demo/index')
  	# redirect_to(:action => 'other_hello')
  end

  def hello
  	# redirect_to("http://www.facebook.com")
  	@array = [1,2,3,4,5]
  end

  def other_hello
  	render(:text => "hello every one")
  end
end
