# The "@" annotations are tags
# One feature can have multiple scenarios
# The lines immediately after the feature title are just comments

Feature: Make Purchase
    As a shopper
    Scenario: Making Purchase
        Given I open SauceDemo
        When  I enter valid username password and click login button
        Then  I am successfully logged in
        Then  I add items to my cart
        Then  I go to cart
        Then  I enter my shipping details
        Then  I click finish button in cart
        Then  I close browser