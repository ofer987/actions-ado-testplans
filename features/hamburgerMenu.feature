
Feature: One Source Hamburger Menu Scenarios

    @complete @UiReport
    Scenario: User is logged-in to ONESOURCE Home Page
        Given User logging to Onesource application
        When User login to OneSource by providing credentials
        Then Verify the user Logged in successfully

    @complete @UiReport
    Scenario Outline: Verify navigation to "<Links>" pages
        Given User navigates to ONESOURCE Home Page
        When User clicks the "<Links>"
        Then Verify user navigates to the page "<Title>"

        Examples:
            | Links             | Title                             |
            | Privacy Statement | Privacy statement                 |
            | System Status     | Thomson Reuters Corporates Status |

    @complete @UiReport
    Scenario Outline: Verify the page title for "<Menu>" page
        Given User navigates to ONESOURCE Home Page
        When User clicks the PageLink "<Menu>"
        Then Verify user navigates to the pageTitle "<Title>"

        Examples:
            | Menu                         | Title                                   |
            | Home                         | ONESOURCE Home                          |
            | Administration               | ONESOURCE: Administration               |
            | Corporate Tax                | Returns                                 |
            | Corporate Tax (Germany)      | ONESOURCE Home                          |
            | Documents                    | ONESOURCE: Documents                    |
            | IncomeTax AWS (Chrome Beta)  | ONESOURCE: IncomeTax AWS (Chrome Beta)  |
            | Indirect Tax                 | ONESOURCE Home                          |
            | Indirect Tax - AWS           | ONESOURCE Home                          |
            | Indirect Tax Configuration   | ONESOURCE Home                          |
            | Data Hub                     | ONESOURCE Home                          |
            | My Tasks                     | ONESOURCE Home                          |
            | Operational Transfer Pricing | ONESOURCE: Operational Transfer Pricing |
            | R&D Tax Credit Manager 2019  | ONESOURCE Home                          |
            | Sales and Use Tax Compliance | ONESOURCE Home                          |
            | Statutory Reporting          | ONESOURCE: Statutory Reporting          |
            | TAX ONE                      | ONESOURCE: TAX ONE                      |
            | Tax Provision                | ONESOURCE Home                          |
            | Test Target Application      | ONESOURCE: Test Target Application      |
            | DataFlow                     | ONESOURCE Home                          |
            | Analytics                    | ONESOURCE Home                          |
            | Indirect Tax Compliance      | ONESOURCE Home                          |

    @complete @UiReport @abcdef
    Scenario Outline: Verify the page window for "<Menu>" page
        Given User navigates to ONESOURCE Home Page
        When User clicks the Page "<Menu>"
        Then Verify user navigates to the pageWindow "<Title>"

        Examples:
            | Menu                                  | Title                               |
            | AWS–ONESOURCE Trust TAX               | ONESOURCE Trust Tax                 |
            | CHECKPOINT                            | Checkpoint                          |
            | Engagement Center                     | WorkFlow Manager                    |
            | AWS-Tax Information Reporting         | ONESOURCE Tax Information Reporting |
            | K-1 Analyzer                          | k1analyzer - Login Failed           |
            | Tax Information Reporting             | ONESOURCE Tax Information Reporting |
            # | State Apportionment                   | Security Error                      |
            | Tax Provision Instance Administration | Global Interface Launcher           |
            | International Tax Calculator          | Orbitax                             |
            # | Checkpoint World                      | Checkpoint™ World                   |
            # | Tax Provision – v2014.1 and below     | Error - Single Sign-On              |

    @complete @endFeature @UiReport
    Scenario: Verify the navigation to Fringe Benefits Tax
        Given User navigates to ONESOURCE Home Page
        When User clicks the Page
        Then Verify user navigates to the Fringe Benefits Tax