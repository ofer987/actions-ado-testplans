
Feature: Top Navigation scenarios

    @complete @fullreport @UiReport @Smoke 
  @ADO-15543
    Scenario: OneSource Login
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        Then Verify the user Logged in successfully

    @complete @UiReport
  @ADO-15544
    Scenario: AddToDo Navigation
        Given the user is in the dashboard
        When User selects Add To Do from My-To-Do
        Then the Add To Do section Pops up

    @complete @fullreport @UiReport @Smoke
  @ADO-15545
    Scenario: MyToDo Navigation
        Given User selects the My To Do Icon-My To Do
        When User verifies that My To Do Page is Navigated
        Then click on Homepage icon and validate Homepage is landed

    @complete @UiReport
  @ADO-15546
    Scenario:  Home Page and MySettings validation
        Given the user is in the dashboard
        When User clicks MySettings button from dropdown
        Then click on Homepage icon and validate Homepage is landed
        # And click Community icon in Onesource page and validate page is loaded

    @fullreport @complete @UiReport
  @ADO-15547
    Scenario:  Community icon validation
        Given the user is in the dashboard
        When User selects Community icon in Onesource page and verify its Navigation
        Then click on Homepage icon and validate Homepage is landed

    # NOTE: Before testing Alerts, please run API automation test first to populate alerts. 
    #       Please refer to N-39 test scenario of NotificationNewServices.feature
    @fullreport @complete @UiReport 
  @ADO-15548
    Scenario:  Alert icon validation
        Given the user is in the dashboard
        And create few alerts  
        When user click on alert icon and verify its navigation        
        Then click on Homepage icon and validate Homepage is landed

    @fullreport @complete @UiReport 
  @ADO-15549
    Scenario:  Verify pagination is displayed in the left bottom of the page and items per page is displayed on the right
        When user click on alert icon and verify its navigation
        Then Verify pagination controls are displayed

    @fullreport @complete @UiReport 
  @ADO-15550
    Scenario:  Verify filter option is available for the columns Alert and Application
        When user click on alert icon and verify its navigation
        Then Verify filter textbox is available for the Alert and Application

    @fullreport @complete @UiReport 
  @ADO-15551
    Scenario:  Verify the functionality of next page,previous page,first,last page and page number dropdown
        When user click on alert icon and verify its navigation
        Then Verify the functionalities of alert table pagination controls

    @fullreport 
  @ADO-15552
    Scenario: Verify alerts are displayed
        Given the user is in the dashboard
        When the user open alerts
        Then alerts are displayed with Alert, Application, DateTime and Description columns

    @fullreport 
  @ADO-15553
    Scenario: Verify delete button is disabled when no alerts are selected
        Given the user is in the dashboard
        When the user open alerts
        Then delete button is disabled

    @fullreport  
  @ADO-15554
    Scenario: Verify that alerts are not more than thirty days old
        Given the user is in the dashboard
        When the user open alerts
        Then alerts are not more than thirty days old

    @fullreport 
  @ADO-15555
    Scenario: Verify that the message "Items older than 30 days will be deleted automatically" is displayed in the grid
        Given the user is in the dashboard
        When the user open alerts
        Then the message "Items older than 30 days will be deleted automatically" is displayed in the grid

    @fullreport 
  @ADO-15556
    Scenario Outline: Verify user is able to filter the results by <column>
        Given the user is in the dashboard
        When the user open alerts
        And the user filters by "<column>" using "<keyword>"
        Then results are filtered by "<column>" using "<keyword>"

        Examples:
            | column      | keyword   |
            | Alert       | Important |
            | Application | FileRoom  |

    @fullreport 
  @ADO-15557
    Scenario Outline: Negative - Verify that message "No Alerts" is displayed when using invalid filter in <column>
        Given the user is in the dashboard
        When the user open alerts
        And the user filters by "<column>" using "<keyword>"
        Then the message "No Alerts" is displayed

        Examples:
            | column      | keyword |
            | Alert       | Invalid |
            | Application | Invalid |

    @fullreport 
  @ADO-15558
    Scenario: Verify user can toggle the filter button and the filters appear and disappear accordingly
        Given the user is in the dashboard
        When the user open alerts
        Then the user can toggle the filter button

    @fullreport 
  @ADO-15559
    Scenario: Verify that delete is enabled when user selects any alert for deletion
        Given the user is in the dashboard
        When the user open alerts
        And the user selects any alert
        Then delete button is enabled

    @fullreport 
  @ADO-15560
    Scenario: Verify that delete is enabled when user checks Select All checkbox
        Given the user is in the dashboard
        When the user open alerts
        And the user checks Select All checkbox
        Then delete button is enabled

    @fullreport 
  @ADO-15561
    Scenario: Verify alert details are displayed in a popup including html content on clicking the Application hyperlink
        Given the user is in the dashboard
        When the user open alerts
        And the user open Application hyperlink
        Then alert details are displayed in a popup

    @fullreport 
  @ADO-15562
    Scenario: Verify that user can delete two or more alerts
        Given the user is in the dashboard
        When the user open alerts
        And the user selects multiple alerts
        Then user can delete the alerts successfully

    @fullreport 
  @ADO-15563
    Scenario: Verify that user can delete all alerts
        Given the user is in the dashboard
        When the user open alerts
        And the user checks Select All checkbox
        Then user can delete the alerts successfully

    @fullreport @endFeature 
  @ADO-15564
    Scenario: Verify the message "There are no alerts at this time" is displayed when there are no alerts
        Given the user is in the dashboard
        When the user open alerts
        Then the message "There are no Alerts at this time" is displayed in main grid