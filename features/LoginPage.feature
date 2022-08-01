
Feature: Login Page

    The purpose of this feature is to test the Login Page

    @complete @UiReport @Smoke
  @ADO-15445
    Scenario: [ADO-14094] OneSource Login
        Given User logging to Onesource application
        When User login to OneSource by providing credentials

    @complete @Smoke @UiReport
  @ADO-15446
    Scenario: [ADO-14095] OneSource Login and logout
        Given click the logout of the application
        Then Verify the user Logged in successfully
        Then verify whether the user logged out successfully

    @complete @UiReport
  @ADO-15447
    Scenario: [ADO-14096] LoginPage Elements verification
        Given I am Logging to "Onesource" Application
        Then verify Information Icon is displayed
        And TRLogo in the footer is displayed

    @UiReport
  @ADO-15448
    Scenario: [ADO-14097] Forget Password Functionality
        Given I am Logging to "Onesource" Application
        When I navigate to the Forget Password page and click the Next button
        Then Verify the error message to enter username and Email ID

    @ignore
  @ADO-15449
    Scenario: [ADO-14098] Forget Password Functionality
        Given I am Logging to "Onesource" Application
        When I navigate to the Forget Password page, Enter details and click Next button
        Then Verify whether the success message displayed

    @ignore
  @ADO-15450
    Scenario: [ADO-14099] Login with Invalid Credentials
        Given I am Logging to "Onesource" Application
        When I try to login to "OneSource" by providing invalid username and password
        Then Verify the Error POP UP Message for invalid login

    @HyperlinkCantAccessAccount @ignore
  @ADO-15451
    Scenario: [ADO-14100] Click on Hyperlink CantAccessAccount
        Given I am Logging to "Onesource" Application
        When I try to to click on hyperlinkCantAccessAccount
        Then Verify that hyperlink Navigation

    @changeLanguage @complete @fullreport @UiReport @Smoke
  @ADO-15452
    Scenario: [ADO-14101] Change Language to English (Australia) and OneSource Login
        Given I am Logging to "Onesource" Application
        When I try to change Language to EnglishAustralia by clicking Dropdown
        When I try to login to "OneSource" by providing username and password
        Then Verify the user Logged in successfully after changing Language to EnglishAustralia

    @complete @UiReport
  @ADO-15453
    Scenario Outline: [ADO-14102] Hyperlinks Verification
        Given User logging to Onesource application
        When I try to to click on "<hyperlink>"
        Then Verify that "<title>" Navigation

        Examples:
            | hyperlink        | title             |
            | ContactUs        | onesource         |
            | SystemStatus     | corporates-status |
            | PrivacyStatement | privacy-statement |

    @complete1 @complete @UiReport
  @ADO-15454
    Scenario Outline: [ADO-14103] Change Language and OneSource Login
        Given User logging to Onesource application
        When User try to change Language to "<product>" by clicking Dropdown
        And User login to OneSource by providing credentials
        Then Verify the user Logged in successfully and "<title>" is the title

        Examples:
            | product                  | title                                |
            | العربية                  | فحة ONESOURCE الرئيسية               |
            | Български                | Начална страница на ONESOURCE        |
            | 繁體中文                 | ONESOURCE 首頁                       |
            | Čeština                  | Domovská stránka aplikace ONESOURCE  |
            | hrvatski                 | Početna stranica sustava ONESOURCE   |
            | dansk                    | ONESOURCE-startside                  |
            | Nederlands (België)      | ONESOURCE Home                       |
            | Nederlands (Nederland)   | ONESOURCE Home                       |
            # |English (Australia)       | ONESOURCE Home                       |
            # |Svenska                   | ONESOURCE Hem                        |
            | English (India)          | ONESOURCE Home                       |
            | English (Ireland)        | ONESOURCE Home                       |
            | English (Malta)          | ONESOURCE Home                       |
            | English (New Zealand)    | ONESOURCE Home                       |
            | English (Singapore)      | ONESOURCE Home                       |
            | English (South Africa)   | ONESOURCE Home                       |
            | English (United Kingdom) | ONESOURCE Home                       |
            | English (United States)  | ONESOURCE Home                       |
            | Eesti                    | ONESOURCE'i avaleht                  |
            | suomi                    | ONESOURCE-aloitussivu                |
            | Filipino                 | Tahanan ng ONESOURCE                 |
            | Français (Canada)        | Accueil ONESOURCE                    |
            | Français (France)        | Accueil ONESOURCE                    |
            | Français (Luxembourg)    | Accueil ONESOURCE                    |
            | Deutsch (Österreich)     | ONESOURCE-Startseite                 |
            | Deutsch (Deutschland)    | ONESOURCE-Startseite                 |
            | Deutsch (Luxemburg)      | ONESOURCE-Startseite                 |
            | Deutsch (Schweiz)        | ONESOURCE-Startseite                 |
            | magyar (Magyarország)    | ONESOURCE-kezdőlap                   |
            | Ελληνικά (Κύπρος)        | Αρχική σελίδα του ONESOURCE          |
            | Ελληνικά (Ελλάδα)        | Αρχική σελίδα του ONESOURCE          |
            | Bahasa Indonesia         | Beranda ONESOURCE                    |
            | Italiano                 | Pagina iniziale ONESOURCE            |
            | 日本語                   | ONESOURCE ホーム                     |
            | 한국어                   | ONESOURCE 홈                         |
            | Latvian                  | ONESOURCE sākums                     |
            | Lietuvių                 | ONESOURCE Pradžios Puslapis          |
            | Bahasa Malaysia          | Laman Utama ONESOURCE                |
            | Norsk (bokmål)           | ONESOURCE Hjem                       |
            | polski                   | Strona główna ONESOURCE              |
            | Português (Brasil)       | Página inicial da ONESOURCE          |
            | Português (Portugal)     | Página inicial da ONESOURCE          |
            | Română                   | Pagina principală ONESOURCE          |
            | slovenský                | Domovská stránka platformy ONESOURCE |
            | slovensko                | ONESOURCE Začetna stran              |
            | Español (Argentina)      | Inicio de ONESOURCE                  |
            | Español (Chile)          | Inicio de ONESOURCE                  |
            | Español (Colombia)       | Inicio de ONESOURCE                  |
            | Español (España)         | Inicio de ONESOURCE                  |
            | Español (México)         | Inicio de ONESOURCE                  |
            | Español (Latinoamérica)  | Inicio de ONESOURCE                  |
            | ภาษาไทย                  | หน้าหลักของ ONESOURCE                |
            | Türkçe                   | ONESOURCE Ana Sayfası                |
            | Tiếng Việt               | Trang chủ ONESOURCE                  |

    @complete @fullreport @UiReport @Smoke
  @ADO-15455
    Scenario Outline: [ADO-14104] Verify Language changed from the Login page should be overridden for the next login
        Given User logging to Onesource application
        When User try to change Language to "<product>" by clicking Dropdown
        And User login to OneSource by providing credentials
        Then Verify the user Logged in successfully and "<title>" is the title
        And Validate the language from dropdown and it should "<product>"

        Examples:
            | product  | title          |
            | 繁體中文 | ONESOURCE 首頁 |


    @complete @fullreport @UiReport @Smoke
  @ADO-15456
    Scenario: [ADO-14105] Verify Language changed from the User Settings should be overridden by the language set on the login screen after the next login
        Given the user is logged-in to ONESOURCE
        When User clicks MySettings button from dropdown
        And I click Language tab
        And I select "English (India)" language and clicked change language
        And Verify language is changed and logout from the application
        Then Validate the language from dropdown and it should "English (India)"

    @complete @fullreport @UiReport @Smoke
  @ADO-15457
    Scenario: [ADO-14106] Verify user is taken to the onsourcetax home page if the URL at OSTarget is not whitelisted
        Given Launch the application with OSTarget and non whitelisted url
        Then Verify application redirect to Onesource login page

    @complete @fullreport @UiReport @Smoke
  @ADO-15458
    Scenario: [ADO-14107] Verify Administration tile is enabled when logged in user has any permissions for "Adjustments", "Clients" and "Reference Data"
        Given Login to OneSource application using special credential with username id as "spl_un_oscp_10033" and password id as "spl_pwd_oscp_10033"
        Then Verify user is able to navigate to Admin tile
        And Verify application redirect to Onesource login page