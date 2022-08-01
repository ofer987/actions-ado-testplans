@fullreport
Feature: Resources Tab Page

      The purpose of this feature is to test the Resources Tab Page

      @complete @Smoke
  @ADO-15584
      Scenario: User is logged-in to ONESOURCE Home Page
            Given User logging to Onesource application
            When User login to OneSource by providing credentials
            Then Verify the user Logged in successfully


  @ADO-15585
      Scenario: Static text in MORE ONESOURCE APPLICATIONS and SUPPPORT section
            Given User navigates to ONESOURCE Home Page
            When User Navigates to Resources tab
            Then Verify the text in SUPPPORT and MORE ONESOURCE APPLICATIONS section


  @ADO-15586
  @ADO-15587
      Scenario: Verify help page navigation
            Given User navigates to ONESOURCE Home Page
            When User Navigates to Resources tab
            And Clicks Questions about ONESOURCE
            Then Verify the help section opened

      @endFeature
      Scenario: Verify help page navigation
            Given User navigates to ONESOURCE Home Page
            When User Navigates to Resources tab
            And Clicks Learn More button
            Then Verify the Corporate tax software Page navigation