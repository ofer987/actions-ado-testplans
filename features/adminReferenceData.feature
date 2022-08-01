
Feature: Admin Reference Data Page

    The purpose of this feature is to test the Reference Data pages

    @refData @UiReport
    Scenario: OneSource Login
        Given User logging to Onesource application
        When  User login to OneSource by providing credentials

    @refData @UiReport
    Scenario Outline: Reference data options validation "<optionLabel>"
        Given User navigates to ONESOURCE Home Page
        And   User is in the Administration Page
        When  User validates the page loads for the product "<optionLabel>"
        Then  Validate the reference data option page "<refDataOptionName>" opened

        Examples:
            | optionLabel         | refDataOptionName  |
            | Authorities         | authority          |
            | Currencies          | currency           |
            | Domains             | manageDomainType   |
            | Financial Hierarchy | financialHierarchy |
            | Jurisdictions       | manageJurisdiction |

    @UiReport
    Scenario: logout of the application
        Given click the logout of the application