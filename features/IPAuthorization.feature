@ipAuth
Feature: Admin IP Authorization Page

    The purpose of this feature is to test the Admin IP Authorization Page

    @complete
    Scenario: User is logged-in to ONESOURCE Home Page
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        Then Verify the user Logged in successfully

    @complete
    Scenario: : Verify Toggle and notes section
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User Toggles IP Authorization button
        Then Verify notes template is displayed

    @complete
    Scenario: Verify Addition of IPs more than one
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User Toggles IP Authorization button
        Then Adding more IPs at a time

    @complete
    Scenario: Verify Deletion of IP and Message
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User Toggles IP Authorization button
        # Then Deletion of IP
        Then Verify PopUp message


    Scenario: Verify IP Address is being converted when user enters 100
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User Toggles IP Authorization button
        And Enters IP Address
        Then Verify the IPAddress Conversion


    Scenario: Verify Error message when user deletes IP Address
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User Toggles IP Authorization button
        And User deletes IPAddress
        Then Verify the message when there is one IP present

    @complete
    Scenario: Verify that user has View, edit and save access
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User Toggles IP Authorization button
        Then User edit and save the ip

    @complete
    Scenario: Verify that user can set page values to see all IP Ranges in one page.
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User Toggles IP Authorization button
        And User selects items per page
        Then All IP ranges are listed in one page


    Scenario: Verify IP Ranges has been Cancelled Message
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When I click on the Setup tab
        When User Toggles IP Authorization button
        And  User Selects Cancel button
        Then Verify Unable to save IP Authorization Settings Message

    @WithinRange
    Scenario: Verify user IP is within Range
        Given Retrieve the ip address of the system
        Then Capture and save the ip address in a variable

    @WithinRange
    Scenario: User is logged-in to ONESOURCE Home Page
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        Then Verify the user Logged in successfully

    @WithinRange
    Scenario: Adding Ip Address to the Ip Range
        Given User navigates to ONESOURCE Home Page
        And  User is in the Administration Page
        When I click on the Setup tab
        Then Adding the ip address to the ip range

    @WithinRange
    Scenario: Deleting the Ip address from the IP Range
        Given User navigates to ONESOURCE Home Page
        And  User is in the Administration Page
        When I click on the Setup tab
        Then Deleting the ip address from the ip range

    @outofRange @WithinRange @endFeature
    Scenario: Verify user IP is not within the Range
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        And The user should get error if ip address is not in range