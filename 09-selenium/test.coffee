assert = require 'assert'
test = require 'selenium-webdriver/testing'
chrome = require('selenium-webdriver/chrome')
path = require('chromedriver').path
webdriver = require 'selenium-webdriver'


test.describe 'Adslot website', ->

  # Browser (or driver) instance
  browser = null

  # Init browser before we begin
  test.before -> browser = new webdriver.Builder().usingServer().withCapabilities({browserName: 'chrome'}).build()

  # Close browser after all tests
  test.after -> browser.quit()

  test.it 'should navigate to website on successful google search', ->

    browser.get 'https://www.google.com'

    browser.findElement(webdriver.By.name('q')).sendKeys('adslot')
    browser.findElement(webdriver.By.name('btnG')).click()
    browser.wait(webdriver.until.titleIs('adslot - Google Search'), 2000)
    browser.findElement(webdriver.By.xpath("//div[(@class='rc')and(@data-hveid='25')]/h3[@class='r']/a")).click()
    browser.wait(webdriver.until.titleIs('Adslot'), 1000)

    assert browser.getTitle(), 'Adslot'

  test.it 'should contain a form on "Login" page', ->

    browser.get 'https://symphony.facilitatedigital.com/public/login.aspx'


    browser.findElement(webdriver.By.id('UserName')).isDisplayed()
    browser.findElement(webdriver.By.id('Password')).isDisplayed()
    browser.findElement(webdriver.By.id('Login')).isDisplayed()
    
  test.it 'should have 8 offices on careers page', ->

    browser.get 'http://adslot.com/careers'

    browser.findElements(webdriver.By.css('.ui-tabs-nav h4, .ui-tabs-nav h2')).then (menuItems) ->
      assert menuItems.length, 8


  test.it 'should contain a form on "contact us" page', ->

    browser.get 'http://www.adslot.com/contact-us'

    browser.findElement(webdriver.By.id('first_name')).isDisplayed()
    browser.findElement(webdriver.By.id('last_name')).isDisplayed()
    browser.findElement(webdriver.By.id('message')).isDisplayed()
    browser.findElement(webdriver.By.id('company')).isDisplayed()
    browser.findElement(webdriver.By.id('email')).isDisplayed()
    browser.findElement(webdriver.By.id('website')).isDisplayed()
    browser.findElement(webdriver.By.id('00N90000004oGQH')).isDisplayed()
    browser.findElement(webdriver.By.css('button[type=submit]')).isDisplayed()

  

