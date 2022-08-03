
Feature: Test Login Pages 1

    The purpose of this feature is to Test Page Login 1
    @story:15661 @bug:15662
    Scenario Outline: Change Language and Test Login
        Given User logging to Test application
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



    @story:15661 @bug:15662
    Scenario Outline: Change Language and SauceDemo Login - TEST
        Given User logging to Onesource application TEST
        When User try to change Language to "<product>" by clicking Dropdown
        And User login to OneSource by providing credentials
        Then Verify the user Logged in successfully and "<title>" is the title

        Examples:
            | product                  | title                                |
            | العربية                  | فحة ONESOURCE الرئيسية               |
