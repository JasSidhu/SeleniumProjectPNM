require 'rspec'
include WaitHelper
include GenericHelper

describe 'Signup : ' do

  it 'should allow user to login' do

    #step 1 Enter email or phone
    wait_true(15) {@driver.find_element(:id, "input-email_or_phone").displayed?}
    @driver.find_element(:id, "input-email_or_phone").send_keys(emailaddress())

    #step 2 Enter password
    wait_true(15) {@driver.find_element(:id, "input-password").displayed?}
    @driver.find_element(:id, "input-password").send_keys("1qaz@WSX")

    #step 3 Enter postalcode
    wait_true(15) {@driver.find_element(:id, "input-postalcode").displayed?}
    @driver.find_element(:id, "input-postalcode").send_keys("95035")

    sleep(2)

    #step 3 Press submit button
    wait_true(15) {@driver.find_element(:id, "button-sign-up").displayed?}
    @driver.find_element(:id, "button-sign-up").click

    sleep(10)

  end

  it 'should throw error for entering wrong email format' do
    wait_true(15) {@driver.find_element(:id, "input-email_or_phone").displayed?}
    @driver.find_element(:id, "input-email_or_phone").send_keys("testemail&gmail.com")

    wait_true(15) {@driver.find_element(:id, "button-sign-up").displayed?}
    @driver.find_element(:id, "button-sign-up").click

    wait_true(15) {@driver.find_element(:id, "error-email_or_phone").displayed?}
    @driver.find_element(:id, "error-email_or_phone").text.should eq"Email or phone number is not valid."

  end

  it 'should throw error for entering wrong password' do

    #step 3 Enter postalcode
    wait_true(15) {@driver.find_element(:id, "input-password").displayed?}
    @driver.find_element(:id, "input-password").send_keys("1ryryraz@WSX")

    wait_true(15) {@driver.find_element(:id, "button-sign-up").displayed?}
    @driver.find_element(:id, "button-sign-up").click

    wait_true(15) {@driver.find_element(:id, "error-password").displayed?}
    @driver.find_element(:id, "error-password").text.should eq"Password must be at least 8 characters long with at least one letter AND a number or symbol."

  end

  it 'should throw error for entering wrong zip code' do

    #step 3 Enter postalcode
    wait_true(15) {@driver.find_element(:id, "input-postalcode").displayed?}
    @driver.find_element(:id, "input-postalcode").send_keys("95e05")

    wait_true(15) {@driver.find_element(:id, "button-sign-up").displayed?}
    @driver.find_element(:id, "button-sign-up").click

    wait_true(15) {@driver.find_element(:id, "error-postalcode").displayed?}
    @driver.find_element(:id, "error-postalcode").text.should eq"Zip code is not valid."

  end

end
