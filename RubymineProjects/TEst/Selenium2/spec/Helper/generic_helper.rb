module GenericHelper

  def emailaddress()
    number = rand(1...898989)
    returnemail = "test" + "#{number}" + "@gmail.com"
    return returnemail
  end

  def wait_true(no_of_sec,&block)
    wait = Selenium::WebDriver::Wait.new(:timeout => no_of_sec)
    wait.until &block
  end

end