
Feature: Help Panel Scenarios

    @complete @fullreport @Smoke @UiReport
  @ADO-15514
    Scenario: User is logged-in to ONESOURCE Home Page
        Given I am Logging to "Onesource" Application
        When I try to login to "OneSource" by providing username and password
        Then I clicked Help Icon

    @complete @Smoke @UiReport
  @ADO-15515
  @ADO-15516
  @ADO-15517
  @ADO-15518
    Scenario Outline: Validate Product info "<product>"
        When I select a "<product>"
        And  I search "<value>" product support content
        Then Search page should be present
        When I click Technical Support
        Then Technical Support page should be present
        When I click Customer Center
        Then Customer Center page should be present
        When I click Interactive Tour
        Then Interactive Tour page should be present

        Examples:
            | product                               | value                              |
            | Calendar                              | NextGenCalendar                    |
            | Corporate Tax                         | CorporateTax                       |
            | Corporate Tax (Germany)               | CorporateTaxAWS                    |
            | E-Filing Manager (Indirect Tax)       | EFilingManagerAU                   |
            # | Fringe Benefits Tax                   | ONESOURCE_FBT                      |
            | International Tax Calculator          | Orbitax                            |
            | R&D Survey                            | RnDSurvey                          |
            | R&D Tax Credit Manager 2019           | ResearchDevelopmentTCM             |
            | Statutory Reporting                   | LS2TestingStatutoryReporting       |
            | Tax Provision Instance Administration | TaxProvisionInstanceAdministration |
            | Indirect Tax                          | IndirectTax                        |
            # | TAX ONE                               | OSMastersaf                        |

    @complete @UiReport
    Scenario Outline: Validate Product info "<product>"
        When I select a "<product>"
        # And  I search "<value>" product support content
        When I click Customer Center
        Then Customer Center page should be present
        When I click Interactive Tour
        Then Interactive Tour page should be present

        Examples:
            | product                                     | value                                   |
            | K-1 Analyzer                                | K1analyzer                              |
            | IncomeTax AWS (Chrome Beta)                 | IncomeTaxAWSChromeBeta                  |
            | IncomeTax AWS                               | IncomeTaxAWS                            |
            | E-Filing Manager (Corporate Tax – Germany)  | OCTEFilingManagerAWS                    |
            | Indirect Tax - AWS                          | IndirectTaxAWS                          |
            | Operational Transfer Pricing Administration | OperationalTransferPricingAdmin_Removed |
            | Reporting                                   | CorporateTaxRpt                         |
            # | Workpapers AWS                              | WorkPaperManagerAWS                     | workpapers is not present in QA
            | AWS–ONESOURCE Trust TAX                     | TrustTax                                |
            | Income Tax                                  | IncomeTax                               |
            | FileRoom                                    | FileRoom                                |
            | Data Provider                               | DataProvider                            |
            | Documents                                   | Documents                               |
            | Tax Information Reporting                   | OS1099                                  |
            | Analytics                                   | ANALYTICS                               |
            | Trust Tax Insight                           | TrustAdmin                              |


    @complete @UiReport
    Scenario Outline: Validate Product info "<product>"
        When I select a "<product>"
        # And  I search "<value>" product support content
        When I click Customer Center
        Then Customer Center page should be present
        And Validate CSMHelp mail
        When I click Interactive Tour
        And Interactive Tour page should be present

        Examples:
            | product                    | value          |
            | Indirect Tax Configuration | IndirectConfig |
            | Work Center                | WorkCenter     |

    @complete @UiReport
    Scenario Outline: Validate Product info "<product>"
        When I select a "<product>"
        And  I search "<value>" product support content
        Then Search page should be present
        When I click Technical Support
        Then Technical Support page should be present
        When I click Customer Center
        Then Customer Center page should be present
        When I click Interactive Tour
        Then Interactive Tour page should be present
        And Validate CSMHelp mail

        Examples:
            | product                                      | value                      |
            | Tax Provision                                | LS2TestingProvisions       |
            | Audit Manager                                | AuditManager3.0            |
            | BEPS Action Manager                          | LS2BAM                     |
            | BEPS Action Manager (Legacy)                 | BEPS                       |
            | DataFlow                                     | DataFlow                   |
            # | Calendar                                     | Calendar                   |
            | Data Query                                   | DataExchange               |
            | Estimated Payments                           | EstimatedPayments          |
            | General Ledger Manager                       | GeneralLedgerManager       |
            | Global Tax Audit Manager                     | ControversyManager         |
            # | Indirect Tax Compliance                      | ITC                        |
            | Operational Transfer Pricing                 | LS2OOXP                    |
            | Property Tax                                 | PropertyTax                |
            | Sales and Use Tax Compliance                 | SalesUse                   |
            | State Apportionment                          | StateApportionment         |
            | Operational Transfer Pricing v2015 and below | OperationalTransferPricing |
            | Workpapers                                   | WorkPaperManager           |
            | WorkFlow Manager                             | WorkFlowTools              |
            | Uncertain Tax Positions Support Selector     | UTPSupportSelector         |
            | Uncertain Tax Positions                      | UTP                        |
            | Tax Provision – v2014.1 and below            | Provision                  |
            | Tax Provision Administration                 | ProvisionAdmin             |
            # | Transfer Pricing                             | TransferPricing            |
            | Transfer Pricing Documenter                  | LS2OXP                     |

    @complete @fullreport @UiReport
  @ADO-15519
    Scenario Outline: Validate Search "<product>" product page
        When I select a "<product>"
        When I search "onesource" product support content
        Then Search page should be present

        Examples:
            | product        |
            | Administration |

    @fullreport @UiReport
  @ADO-15520
    Scenario Outline: Validate Technical Support with "<product>" product
        When I select a "<product>"
        When I click Technical Support
        Then Technical Support page should be present

        Examples:
            | product        |
            | Administration |

    @fullreport @UiReport
  @ADO-15521
    Scenario: Validate Customer Center
        When I click Customer Center
        Then Customer Center page should be present

    @fullreport @UiReport
  @ADO-15522
    Scenario: Validate Interactive Tour
        When I click Interactive Tour
        Then Interactive Tour page should be present

    @complete @UiReport
  @ADO-15523
    Scenario Outline: Validate View or Create a Case Link Works in Help Panel
        When I select a "<product>"
        And I click Search Box
        Then validate page opens successfully

        Examples:
            | product        |
            | Administration |

    @complete @UiReport
  @ADO-15524
    Scenario Outline: Validate Ask the ONESOURCE Community Link Works in Help Panel
        When I select a "<product>"
        And I click Search Box and Ask the ONESOURCE Community Link
        Then validate page opens successfully

        Examples:
            | product        |
            | Administration |
            | DAC6 Reporter  |

    @complete @UiReport
  @ADO-15525
    Scenario Outline: Validate All Other Support Options Link Works in Help Panel
        When I select a "<product>"
        And I click Search Box and All Other Support Options Link
        Then validate All Other Support Options page opens successfully

        Examples:
            | product        |
            | Administration |

    @complete @UiReport
  @ADO-15526
    Scenario Outline: Validate Live Chat with Support Link Works in Help Panel
        When I select a "<product>"
        And I click Search Box and Live Chat with Support Link
        Then validate Live Chat with Support page opens successfully

        Examples:
            | product        |
            | Administration |

    # @complete @UiReport @fullreport
    # Scenario: Verify Announcement Section is listed and Announcement header is in bold
    #     Then I clicked on Product Drop Down
    #     And I selected "Administration"
    #     And Validate Announcements section is listed and header is in bold

    @complete @UiReport @fullreport 
  @ADO-15527
    Scenario: Verify ONESOURCE Help – Where to Start pdf loaded properly
        Then I clicked on ONESOURCE Help – Where to Start link
        And Validate ONESOURCE Help – Where to Start pdf loaded

    @complete @endFeature @UiReport @fullreport
  @ADO-15528
    Scenario: Verify The link "ONESOURCE Help-Where to Start" appears for all products except Check point products
        Then I verify the help link for each product
         