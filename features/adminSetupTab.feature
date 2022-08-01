@setuppage
Feature: Admin Setup Page

    The purpose of this feature is to test the Admin Setup Page

    @complete @test @Smoke @fullreport @UiReport @chec
    Scenario: User is logged-in to ONESOURCE Home Page
        Given User logging to Onesource application
        When User login to OneSource by providing credentials

    @complete @Smoke @fullreport @UiReport
    Scenario: Verify the different tabs in Admin Setup Page
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        Then Verify Setup tab options displayed

    @complete @Smoke @fullreport @UiReport
    Scenario: Verify Minimum password length in Password Policy when you enter valid length
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User change the Minimum length to "9"
        Then Minimum length value should be "9"

    #OSCP ---5262 october release
    @complete @UiReport
    Scenario: Verify Restrict the number of times a character can be repeated
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User change the Minimum length "2"
        Then Maximum length value "255"

    @complete
    Scenario Outline: Verify Minimum password length in Password Policy when you enter invalid length
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User change the length to "<Header 1>" "<Header 2>" "<Header 3>"
        Then Length value should be "<Header 1>" "<Header 4>"

        Examples:
            | Header 1       | Header 2 | Header 3       | Header 4 |
            | Minimum length | 9        | Maximum length | 9        |
            | Minimum length | 7        | Maximum length | 8        |
            | Maximum length | 255      | Minimum length | 255      |
            # Maximum password length can only accept values up to 255 (default)
            | Maximum length | 256      | Minimum length | 25       |

    @complete
    Scenario Outline: Verify Minimum password length in Password Policy when you enter invalid length
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User is on Account Lockout Policy tab
        And User change the length to "<Header 1>" "<Header 2>" "<Header 3>"
        Then Length value should be "<Header 1>" "<Header 4>"

        Examples:
            | Header 1                      | Header 2 | Header 3                      | Header 4 |
            | Maximum password attempts     | 10       | Lockout duration (in minutes) | 10       |
            | Maximum password attempts     | 11       | Lockout duration (in minutes) | 3        |
            | Lockout duration (in minutes) | 1440     | User inactivity (in days)     | 1440     |
            | Lockout duration (in minutes) | 1441     | User inactivity (in days)     | 144      |
            | User inactivity (in days)     | 400      | Lockout duration (in minutes) | 400      |
            | User inactivity (in days)     | 401      | Lockout duration (in minutes) | 40       |

    @complete @test @fullreport
    Scenario: Verify 0 is not saved on saving a blank value for the Password Policy tab Minimum password age (in days) Field
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And I change the Minimum password age to ""
        And I click the Password Policy tab Save button
        Then validate the "The password policy settings have been saved." message     
        And Minimum password age should be ""
        And click logout of the application
        When User login to OneSource by providing credentials    
        And User on Administation page
        And User selects the Setup tab
        Then Minimum password age should be "90"

    @complete @test @fullreport
    Scenario: Verify 0 is not saved on saving a blank value for the Password Policy tab Expiring password notification (in days) Field
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And I change the Expiring password notification to ""
        And I click the Password Policy tab Save button
        Then validate the "The password policy settings have been saved." message     
        And Expiring password notification should be ""
        And click logout of the application
        When User login to OneSource by providing credentials      
        And User on Administation page
        And User selects the Setup tab
        Then Expiring password notification should be "30"

    @complete @test @fullreport
    Scenario: Verify 0 is not saved on saving a blank value for the Password Policy tab Restrict use of former passwords (in days) Field
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And I change the Restrict use of former passwords to ""
        And I click the Password Policy tab Save button
        Then validate the "The password policy settings have been saved." message
        And Restrict use of former passwords should be ""
        And click logout of the application
        When User login to OneSource by providing credentials     
        And User on Administation page
        And User selects the Setup tab
        Then Restrict use of former passwords should be "365"

    @complete @test @fullreport
    Scenario: Verify 0 is not saved on saving a blank value for the Password Policy tab Restrict the number of times a character can be repeated Field
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And I change the Restrict the number of times a character can be repeated to ""
        And I click the Password Policy tab Save button
        Then validate the "The password policy settings have been saved." message
        And Restrict the number of times a character can be repeated should be ""
        And click logout of the application
        When User login to OneSource by providing credentials  
        And User on Administation page
        And User selects the Setup tab
        Then Restrict the number of times a character can be repeated should be "255"

    @complete @test @fullreport
    Scenario: Verify 0 is not saved on saving a blank value for the Account Lockout Policy tab Lockout duration (in minutes) Field
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User is on Account Lockout Policy tab
        And I change the Lockout duration to ""
        And I click the Account Lockout Policy tab Save button
        Then validate the "The account lockout policy settings have been saved." message   
        Then Lockout duration should be ""
        Then click logout of the application
        When User login to OneSource by providing credentials     
        And User on Administation page
        And User selects the Setup tab
        And User is on Account Lockout Policy tab
        Then Lockout duration should be "1440"

    @complete @test @fullreport
    Scenario: Verify 0 is not saved on saving a blank value for the Account Lockout Policy tab User inactivity (in days) Field
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User is on Account Lockout Policy tab
        And I change the User inactivity to ""
        And I click the Account Lockout Policy tab Save button
        Then validate the "The account lockout policy settings have been saved." message    
        Then User inactivity should be ""
        Then click logout of the application
        When User login to OneSource by providing credentials     
        And User on Administation page
        And User selects the Setup tab
        And User is on Account Lockout Policy tab
        Then User inactivity should be "400"    

    @complete @Smoke @fullreport @UiReport
    Scenario: Verify MFA selection can be toggled ON and OFF
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User click the Multi-factor Authentication tab
        And User clicks Multi-factor Authentication toggle button
        Then "Multi-factor Authentication is ON" should be displayed!
        And User click the Multi-factor Authentication toggle button
        And "Multi-factor Authentication is OFF" should be displayed!

    @complete @UiReport
    Scenario Outline: Verify SSO Authentication selection can be toggled ON and OFF
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And User selects the "<Tab>"
        And User selects the Single Sign-On Authentication toggle button
        Then "Require Single Sign-On Authentication to login" should be displayed
        And "Allow Administrators to login without Single Sign-On Authentication" toggle should be displayed
        And Add the Client network URL field
        And Single Sign-On Authentication should be OFF

        Examples:
            | Tab                           |
            | Single Sign-On Authentication |

    @fullreport
    Scenario: Verify ONESOURCE Sales & Use Tax Compliance
        Given User navigates to ONESOURCE Home Page
        When User is on Sales & Use Tax Compliance Page
        And User clicks the Sales Tax Compliance tab
        Then Verify user navigates to the pageTitle "ONESOURCE: Sales and Use Tax Compliance"

    # ---- OSCP-7975 ---- Start ----
    @fullreport
    Scenario: Single Sign-on Exemptions section should display when SSO is Off
        Given Navigate to Single Sign-On setting page
        Then  I should see Single Sign-On Exemptions section

    @fullreport
    Scenario: Single Sign-on Exemptions section should display when SSO is On
        Given Navigate to Single Sign-On setting page
        When  I turned SSO button ON
        Then  I should see Single Sign-On Exemptions section
        And   I turned SSO button OFF

    @fullreport
    Scenario: Verify comment - Select which users will be able to log in without using Single Sign-on - is added.
        Given Navigate to Single Sign-On setting page
        Then  I should see SSO exception question displayed

    # Double check this scenario
    #@fullreport1
    #Scenario: Verify Transfer button is disabled when group is not selected
    #    Given Navigate to Single Sign-On setting page
    #   When  I checked the status of group selection and confirmed noneof them selected
    #   Then  I should see a disabled transfer button

    @fullreport
    Scenario: Verify Transfer button is enable in both tables when - select all - checkbox is selected from each table
        Given Navigate to Single Sign-On setting page
        When  Select groups from both table
        Then  I should see transfer buttons enabled in both tables

    @fullreport
    Scenario: Verify Transfer button is enable when single item is selected from each table
        Given Navigate to Single Sign-On setting page
        When  Select single item from both tables
        Then  I should see transfer buttons enabled in both tables

    @fullreport
    Scenario: Verify that user can select multiple items from both tables under SSO exception
        Given Navigate to Single Sign-On setting page
        Then  I should be able to select multiple item from both sso excetion tables

    @fullreport
    Scenario: Verify that user can uncheck multiple items from both tables under SSO exception
        Given Navigate to Single Sign-On setting page
        When  Select multiple item from both sso excetion tables
        Then  I should be able to uncheck elected items

    #Fix this scenario
    #@fullreport1
    # Scenario: Verify that user can sort Group names from both Sso exception table tables
    #   Given Navigate to Single Sign-On setting page
    #   Then  I should be able to sort tables using Group names

    @fullreport
    Scenario: Verify that groups can be transferred from left to right table
        Given Navigate to Single Sign-On setting page
        When  I transfer one item from left to right
        Then  I should be able to see the item in the right table

    @fullreport
    Scenario: Verify that groups can be transferred from right to left table
        Given Navigate to Single Sign-On setting page
        When  I transfer one item from right to left
        Then  I should be able to see the item in the left table

    @fullreport
    Scenario: Verify that users can navigate between pages on Available Group table - Left table
        Given Navigate to Single Sign-On setting page
        When  I update Available Group table item to be displayed per page from 25 to 10
        Then  Available Group pagination should work if number of items greater than 10

    @fullreport
    Scenario: Verify that users can navigate between pages on Selected Group table - Right table
        Given Navigate to Single Sign-On setting page
        When  I update selected Group table item to be displayed per page from 25 to 10
        Then  Selected Group pagination should work if number of items greater than 10

    @fullreport
    Scenario: Verify users can go to different pages directly by entering the page number on  Available Group table
        Given Navigate to Single Sign-On setting page
        When  I update Available Group table item to be displayed per page from 25 to 10
        Then  I should be able to navigate to different page by entering the page number on Available Group table

    @fullreport
    Scenario: Verify users can go to different page directly by entering the page number on   selected Group table
        Given Navigate to Single Sign-On setting page
        When  I update selected Group table item to be displayed per page from 25 to 10
        Then  I should be able to navigate to different page by entering the page number on selected Group table

    @fullreport
    Scenario Outline: Verify that user can select items per page as 10,25,50,100 on both table sections
        Given Navigate to Single Sign-On setting page
        Then  I select item per page as "<count>" at position "<index>"

        Examples:
            | count | index |
            | 10    | 0     |
            | 25    | 1     |
            | 50    | 2     |
            | 100   | 3     |

    # @fullreport
    #  Scenario: Verify that select items drop down is set as 25 by default on both sections
    #    Given Navigate to Single Sign-On setting page
    #   Then  Items drop down is set as 25 by default on both sections
    # ---- OSCP-7975 ---- End ----

    # ---- OSCP-8399 ---- Start ----
    @fullreport
    Scenario: Verify user can change the language to Japanese in the login page and SSO page is displayed in Japanese
        Given the user logged-in to Application
        When User try to change Language to "日本語" by clicking Dropdown
        And User login to OneSource by providing credentials
        And Verify user Logged in successfully and "ONESOURCE ホーム" is the title
        And User is on Administration Page
        When User selects the Setup tab
        And Verify Single Sign-On Authentication is displayed in Japanese
        And  I am in the ONESOURCE Home Page
        When User clicks MySettings button from dropdown
        And I click Language tab
        And I select "English" language and submit
        Then Language should be changed and the heading is "Select Language"
        Then click logout of the application

    @fullreport
    Scenario:Verify user can change the language to Japanese under My Settings -> Language and SSO page is displayed in Japanese
        Given the user is logged-in to ONESOURCE
        When User clicks MySettings button from dropdown
        And I click Language tab
        And I select "日本語" language and submit
        And Verify language is changed
        And User selects the Setup tab
        Then  Verify Single Sign-On Authentication is displayed in Japanese
        Then click logout of the application

    @fullreport
    Scenario: Verify user can change the language to SimplifiedChinese in the login page and SSO page is displayed in SimplifiedChinese
        Given the user is logged-in to Application
        When User try to change Language to "简体中文" by clicking Dropdown
        And User login to OneSource by providing credentials
        And Verify user Logged in successfully and "ONESOURCE 主页" is the title
        And User is on Administration Page
        When User selects the Setup tab
        And Verify Single Sign-On Authentication is displayed in SimplifiedChinese
        And  I am in the ONESOURCE Home Page
        When User clicks MySettings button from dropdown
        And I click Language tab
        And I select "English" language and submit
        Then Language should be changed and the heading is "Select Language"
        Then click logout of the application

    @fullreport
    Scenario:Verify user can change the language to Simplified Chinese under My Settings -> Language and SSO page is displayed in SimplifiedChinese
        Given the user is logged-in to ONESOURCE
        When User clicks MySettings button from dropdown
        And I click Language tab
        And I select "简体中文" language and submit
        And Verify language is changed
        And User selects the Setup tab
        Then Verify Single Sign-On Authentication is displayed in SimplifiedChinese
        And  I am in the ONESOURCE Home Page
        When User clicks MySettings button from dropdown
        And I click Language tab
        And I select "English" language and submit
        Then Language should be changed and the heading is "Select Language"
    # Then click the logout of the application
    # ---- OSCP-8399 ---- End ----

    # ---- OSCP-8410 ---- Start ----
    @fullreport
    Scenario: Verify that users tab will display the list of Users who can bypass SSO
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And user selects Single Sign-On Authentication
        And user selects Users tab
        Then list of user should be displayed

    @fullreport
    Scenario: Verify the text present below User tab
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And user selects Single Sign-On Authentication
        And user selects Users tab
        Then text "This is a read-only list. To Allow users to bypass the Single Sign-on requirements, add them to an appropriate group." should be present below User tab

    @fullreport
    Scenario: Verify that users can go different page directly by entering the page number
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And user selects Single Sign-On Authentication
        And user selects Users tab
        And user enter page number "2"
        Then users tab should be in "Page 2"

    @fullreport
    Scenario: Verify that user can select items per page as 10, 25, 50 ,100
        Given User navigates to ONESOURCE Home Page
        And User is on Administration Page
        When User selects the Setup tab
        And user selects Single Sign-On Authentication
        And user selects Users tab
        And user selects "10" items per page
        Then number of items should be "1 to 10"
        When user selects "25" items per page
        Then number of items should be "1 to 25"
    # ---- OSCP-8410 ---- End -----

    # ---- OSCP-9236 ---- Start ----
    @test
    Scenario: Verify the shared user between Parent and Child accounts in External User Access selection
        Given user logged-in as parent
        When user request access to child
        And user logged-in as child
        And user approved access to child
        And user logged-in as parent
        Then shared user should be able to switch to the child account successfully
    
    @test
    Scenario: Verify that shared user is removed from Parent account in External User Access selection
        Given user logged-in as parent
        When user remove shared user access
        And user logged-in as child
        Then shared user should not be available in child account
        When user logged-in as parent
        Then shared user cannot switch to child account 
     
    @test
    Scenario: Verify that User can share Multiple shared user accounts between Parent and Child accounts in External User Access selection 
        Given user logged-in as parent
        When user request access to child for more than one user
        And user logged-in as child
        And user approved access to child for more than one user
        And user logged-in as parent
        Then shared user should be able to switch to the child account successfully
        When user logged-in as second shared account
        Then shared user should be able to switch to the child account successfully
        When user logged-in as third shared account
        Then shared user should be able to switch to the child account successfully
    
    @test
    Scenario: Verify that User can reset all the settings from Child account in External User Access selection
        Given user logged-in as child
        When user remove shared user access for more than one user
        And user logged-in as parent
        Then shared user cannot switch to child account 
        When user logged-in as second shared account
        Then shared user cannot switch to child account 
        When user logged-in as third shared account
        Then shared user cannot switch to child account 

    @test
    Scenario: Verify that User can share Multiple shared user accounts between Parent and Child accounts in External User Access selection for Super Trust
        Given user logged-in as super trust
        When user request access to child for more than one user using super trust
        And user logged-in as child
        Then child tenant cannot remove shared user for super trust 
        When user logged-in as super trust
        Then shared user should be able to switch to the child account successfully
        When user logged-in as second shared account in super trust
        Then shared user should be able to switch to the child account successfully
        When user logged-in as third shared account in super trust
        Then shared user should be able to switch to the child account successfully
    
    @test
    Scenario: Verify that shared user is removed from Super Trust Parent account in External User Access selection
        Given user logged-in as super trust
        When user remove shared user access for more than one user using super trust
        And user logged-in as second shared account in super trust
        Then shared user cannot switch to child account 
        When user logged-in as third shared account in super trust
        Then shared user cannot switch to child account 

    @UiReport 
    #-------OSPIRELQA-1303------Start---------
    @fullreport
    Scenario: Verify that toggle button text on  Support access tab changed to Account Access for Thomson Reuters Support
        Given Navigate to Support Access tab in Administration setup page
        Then Toggle button text should be "Account Access for Thomson Reuters Support"
    #-------OSPIRELQA-1303------End---------

    #------ospirelqa-1304---Start----
    @fullreport @endFeature
    Scenario: Verify that MFA help page is loading as expected
        Given Navigate to Multi-Factor Auth tab in Administration setup page
        When User click on ? icon
        Then User should be able to see help center in new tab
    #------ospirelqa-1304---End----

    @UiReport
    Scenario: logout of the application
        Given click the logout of the application