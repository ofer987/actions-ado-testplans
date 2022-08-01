@fullreport
Feature: Image Services

    The purpose of this feature is to verify images in ONESOURCE Administration

    @Smoke
  @ADO-15505
    Scenario: Background image is displayed in the ONESOURCE login page
        Given User logging to Onesource application
        Then the background image is displayed in the login page

    @Smoke
  @ADO-15506
    Scenario: Background image is displayed HOME page
        Given the user is logged-in to ONESOURCE
        And I am in the ONESOURCE Home Page
        Then the background image is displayed in home page

    @Smoke
  @ADO-15507
    Scenario: verify thumbnails in home page
        Given the user selects Change Background
        Then all the thumbnail images should be displayed

    @Smoke
  @ADO-15508
    Scenario: Verify user can change background to no image
        Given I am in the ONESOURCE Home Page
        And the user selects Change Background
        When user selects no image
        Then no image is selected as the background

    @Smoke
  @ADO-15509
    Scenario Outline: verify user can change background by selecting thumbnail image "<Image>"
        Given I am in the ONESOURCE Home Page
        And the user selects Change Background
        When user selects thumbnail "<Image>"
        Then background "<Image>" should be updated

        Examples:
            | Image |
            | 1     |
            | 2     |
            | 3     |
            | 4     |
            | 5     |
            | 6     |
            | 7     |
            | 8     |
            | 9     |
            | 10    |
            | 11    |
            | 12    |
            | 13    |
            | 14    |
            | 15    |
            | 16    |
            | 17    |
            | 18    |
            | 19    |
            | 20    |
            | 21    |


    @Smoke 
  @ADO-15510
    Scenario: verify background image is displayed on log out
        Given I am in the ONESOURCE Home Page
        And the user logs off the application
        Then verify background image is displayed