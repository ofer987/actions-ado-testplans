
Feature: Landing Page Scenarios

    @complete @Smoke @fullreport @landing2 @UiReport
  @ADO-15571
    Scenario: OneSource Login
        Given I am Logging to "Onesource" Application
        When I try to login to "OneSource" by providing username and password

    @OneSourceAdmin @complete @Smoke @UiReport
  @ADO-15572
    Scenario: Verify User Administration Page navigation
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        Then search for the existing user
        And click on Homepage icon and validate Homepage is landed

    @complete1 @UiReport
  @ADO-15573
    Scenario: Latest News Functionality
        Given the user is in the dashboard
        And click the Latest News tab
        Then verify that "LATEST NEWS" displays
        And click on Homepage icon and validate Homepage is landed

    @complete1 @activity @UiReport
  @ADO-15574
    Scenario: Activity Card validations
        And click the Test Target Application and navigate to ActivityCardService
        And Add the Activity
        Then validate Activity got added
        And verify activity got added in Dashboard
        And delete the added activity
        And validate the activity got deleted
        And click on Homepage icon and validate Homepage is landed

    @complete1 @UiReport
  @ADO-15575
    Scenario: Resources Functionality
        When click the Resources tab
        Then verify that "RESOURCES" displayed
        And click on Homepage icon and validate Homepage is landed

    @complete @UiRepor
  @ADO-15576
    Scenario: University tab validations
        #When click the University tab
        Then validate that the university page opens
        Then click on Homepage icon and validate Homepage is landed

    @complete1 @Smoke  @fullreport @UiReport @endFeatur
  @ADO-15577
    Scenario: Checkpoint tab validations
        When I click the checkpoint tab
        Then validate that the checkpoint page opens
        Then click on Homepage icon and validate Homepage is landed

    @complete1 @UiReport
  @ADO-15578
    Scenario: Analytics tab validations
        When click the Analytics tab
        Then validate that the Analytics page opens
        Then click on Homepage icon and validate Homepage is landed

    #OSCP 4741---- Digital Tax Reporting -- October release
    @complete @UiReport
  @ADO-15579
    Scenario: Digital Tax Reporting tab validations
        When click the Digital Tax Reporting tile
        Then validate that the Digital Tax Reporting page opens
        Then click on Homepage icon and validate Homepage is landed

    @complete @landing @UiReport
  @ADO-15580
    Scenario Outline: Verify that "<tile>" page opens
        Given User is in the ONESOURCE Homepage
        When User selects the "<tile>" tile
        Then validate that the "<title>" page opens

        Examples:
            | tile                                 | title                       |
            | CHECKPOINT‎                           | Checkpoint                  |
            | University-Training & Certifications | ONESOURCE University        |
            | Data Query‎                           | ONESOURCE Data Query        |
            | Trust Tax Insight‎                    | ONESOURCE Trust Tax Insight |
            | DAC6 Reporter                        | International Tax           |
            | AWS–ONESOURCE Trust TAX‎              | ONESOURCE Trust Tax         |

    @complete @landing2 @UiReport
  @ADO-15581
    Scenario Outline: Verify the navigation of "<tile>" page
        Given User is in the ONESOURCE Homepage
        When User selects the "<tile>" tile
        Then validate that the "<title>" page navigation

        Examples:
            | tile                        | title                                  |
            | TAX ONE                     | ONESOURCE: TAX ONE                     |
            | Statutory Reporting         | ONESOURCE: Statutory Reporting         |
            | Workpapers                  | ONESOURCE: Workpapers                  |
            | TAX ONE                     | ONESOURCE: TAX ONE                     |
            | Transfer Pricing Documenter | ONESOURCE: Transfer Pricing Documenter |
            | BEPS Action Manager         | ONESOURCE: BEPS Action Manager         |
            | Corporate Tax               | Returns                                |
            | Documents                   | ONESOURCE: Documents                   |
            | DataFlow                    | ONESOURCE: DataFlow                    |
            | Indirect Tax                | ONESOURCE Home                         |
    
    @fullreport @UiReport
  @ADO-15582
    Scenario Outline: Verify "Browser not supported" Label on "<tile>" tile when browser not supported
        Given User is in the ONESOURCE Homepage
        When the "<tile>" tile is disabled
        Then the "<label>" label on "<tile>" tile should be displayed

        Examples:
            | tile                            | label                 |
            | Audit Manager                   | Browser not supported |
            | Classic ONESOURCE               | Browser not supported |
            | DataFlow Classic                | Browser not supported |
            | Estimated Payments              | Browser not supported |            

    @fullreport @endFeature
  @ADO-15583
    Scenario: Verify Help menu dropdown when a tile is clicked
        Given I am in the ONESOURCE Home Page
        And I am in the Administration Page
        When User clicks help icon and validates the tile name
        And navigates to Homepage
        Then validates the "please choose a product" in dropdown        