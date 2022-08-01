
Feature: ONESource Build Date
    The purpose of this feature is to check the Build Date

    @fullreport
    Scenario: User navigates to build date Url
        Given User navigates to build date Url
        When  User Tries to retrieve Current Date
        # Then  Validate the build date with current Date