North Wind Data Set - SQL
================

GitHub Documents
----------------

This is an R Markdown format used for publishing markdown documents to GitHub. When you click the **Knit** button all R code chunks are run and a markdown file (.md) suitable for publishing to GitHub is generated.

Including Code
--------------

You can include R code in the document as follows:

``` r
library(XLConnect)
```

    ## Loading required package: XLConnectJars

    ## XLConnect 0.2-12 by Mirai Solutions GmbH [aut],
    ##   Martin Studer [cre],
    ##   The Apache Software Foundation [ctb, cph] (Apache POI, Apache Commons
    ##     Codec),
    ##   Stephen Colebourne [ctb, cph] (Joda-Time Java library),
    ##   Graph Builder [ctb, cph] (Curvesapi Java library)

    ## http://www.mirai-solutions.com ,
    ## http://miraisolutions.wordpress.com

``` r
library(sqldf)
```

    ## Loading required package: gsubfn

    ## Loading required package: proto

    ## Loading required package: RSQLite

``` r
Work_Book <- loadWorkbook("Northwind.xls")

Categories <- readWorksheet(Work_Book , sheet = "Categories")
Customers <- readWorksheet(Work_Book , sheet = "Customers")
Employees <- readWorksheet(Work_Book , sheet = "Employees")
Orders_Details <- readWorksheet(Work_Book , sheet = "Orders Details")

Orders <- readWorksheet(Work_Book , sheet = "Orders")
Product <- readWorksheet(Work_Book , sheet = "Product")
Shippers <- readWorksheet(Work_Book , sheet = "Shippers")
Suppliers <- readWorksheet(Work_Book , sheet = "Suppliers")
```

SELECT DISTINCT COUNTRIES
=========================

``` r
sqldf("SELECT DISTINCT Country
       FROM Customers;")
```

    ##        Country
    ## 1      Germany
    ## 2       Mexico
    ## 3           UK
    ## 4       Sweden
    ## 5       France
    ## 6        Spain
    ## 7       Canada
    ## 8    Argentina
    ## 9  Switzerland
    ## 10      Brazil
    ## 11     Austria
    ## 12       Italy
    ## 13    Portugal
    ## 14         USA
    ## 15   Venezuela
    ## 16     Ireland
    ## 17     Belgium
    ## 18      Norway
    ## 19     Denmark
    ## 20     Finland
    ## 21      Poland

COUNT OF DISTINCT COUNTRIES
===========================

``` r
sqldf("SELECT COUNT(DISTINCT Country)
       FROM Customers;")
```

    ##   COUNT(DISTINCT Country)
    ## 1                      21

SQL statement selects all the customers from the country "Mexico", in the "Customers" table
===========================================================================================

``` r
sqldf("SELECT * 
      FROM Customers
      WHERE Country = 'Mexico';")
```

    ##   CustomerID                        CompanyName          ContactName
    ## 1      ANATR Ana Trujillo Emparedados y helados         Ana Trujillo
    ## 2      ANTON            Antonio Moreno Taquería       Antonio Moreno
    ## 3      CENTC         Centro comercial Moctezuma      Francisco Chang
    ## 4      PERIC          Pericles Comidas clásicas  Guillermo Fernández
    ## 5      TORTU                Tortuga Restaurante Miguel Angel Paolino
    ##           ContactTitle                       Address        City Region
    ## 1                Owner Avda. de la Constitución 2222 México D.F.   <NA>
    ## 2                Owner               Mataderos  2312 México D.F.   <NA>
    ## 3    Marketing Manager       Sierras de Granada 9993 México D.F.   <NA>
    ## 4 Sales Representative      Calle Dr. Jorge Cash 321 México D.F.   <NA>
    ## 5                Owner              Avda. Azteca 123 México D.F.   <NA>
    ##   PostalCode Country        Phone          Fax
    ## 1      05021  Mexico (5) 555-4729 (5) 555-3745
    ## 2      05023  Mexico (5) 555-3932         <NA>
    ## 3      05022  Mexico (5) 555-3392 (5) 555-7293
    ## 4      05033  Mexico (5) 552-3745 (5) 545-3745
    ## 5      05033  Mexico (5) 555-2933         <NA>

SQL statement selects all fields from "Customers" where country is "Germany" AND city is "Berlin"
=================================================================================================

``` r
sqldf("SELECT *
      FROM Customers
      WHERE Country = 'Germany' AND city = 'Berlin';")
```

    ##   CustomerID         CompanyName  ContactName         ContactTitle
    ## 1      ALFKI Alfreds Futterkiste Maria Anders Sales Representative
    ##         Address   City Region PostalCode Country       Phone         Fax
    ## 1 Obere Str. 57 Berlin   <NA>      12209 Germany 030-0074321 030-0076545

SQL statement selects all fields from "Customers" where country is NOT "Germany"
================================================================================

``` r
sqldf("SELECT *
      FROM Customers
      WHERE Country <> 'Germany';")
```

    ##    CustomerID                          CompanyName             ContactName
    ## 1       ANATR   Ana Trujillo Emparedados y helados            Ana Trujillo
    ## 2       ANTON              Antonio Moreno Taquería          Antonio Moreno
    ## 3       AROUT                      Around the Horn            Thomas Hardy
    ## 4       BERGS                   Berglunds snabbköp      Christina Berglund
    ## 5       BLONP                 Blondel père et fils      Frédérique Citeaux
    ## 6       BOLID            Bólido Comidas preparadas           Martín Sommer
    ## 7       BONAP                             Bon app'        Laurence Lebihan
    ## 8       BOTTM                Bottom-Dollar Markets       Elizabeth Lincoln
    ## 9       BSBEV                        B's Beverages       Victoria Ashworth
    ## 10      CACTU           Cactus Comidas para llevar        Patricio Simpson
    ## 11      CENTC           Centro comercial Moctezuma         Francisco Chang
    ## 12      CHOPS                    Chop-suey Chinese               Yang Wang
    ## 13      COMMI                     Comércio Mineiro            Pedro Afonso
    ## 14      CONSH                Consolidated Holdings         Elizabeth Brown
    ## 15      DUMON                      Du monde entier          Janine Labrune
    ## 16      EASTC                   Eastern Connection               Ann Devon
    ## 17      ERNSH                         Ernst Handel           Roland Mendel
    ## 18      FAMIA                   Familia Arquibaldo               Aria Cruz
    ## 19      FISSA FISSA Fabrica Inter. Salchichas S.A.              Diego Roel
    ## 20      FOLIG                    Folies gourmandes           Martine Rancé
    ## 21      FOLKO                       Folk och fä HB           Maria Larsson
    ## 22      FRANR                  France restauration          Carine Schmitt
    ## 23      FRANS                       Franchi S.p.A.           Paolo Accorti
    ## 24      FURIB       Furia Bacalhau e Frutos do Mar          Lino Rodriguez
    ## 25      GALED               Galería del gastrónomo        Eduardo Saavedra
    ## 26      GODOS                  Godos Cocina Típica       José Pedro Freyre
    ## 27      GOURL                  Gourmet Lanchonetes           André Fonseca
    ## 28      GREAL              Great Lakes Food Market           Howard Snyder
    ## 29      GROSR                 GROSELLA-Restaurante          Manuel Pereira
    ## 30      HANAR                        Hanari Carnes            Mario Pontes
    ## 31      HILAA                     HILARIÓN-Abastos        Carlos Hernández
    ## 32      HUNGC           Hungry Coyote Import Store           Yoshi Latimer
    ## 33      HUNGO         Hungry Owl All-Night Grocers        Patricia McKenna
    ## 34      ISLAT                       Island Trading           Helen Bennett
    ## 35      LACOR                 La corne d'abondance           Daniel Tonini
    ## 36      LAMAI                     La maison d'Asie          Annette Roulet
    ## 37      LAUGB        Laughing Bacchus Wine Cellars         Yoshi Tannamuri
    ## 38      LAZYK                 Lazy K Kountry Store              John Steel
    ## 39      LETSS                    Let's Stop N Shop            Jaime Yorres
    ## 40      LILAS                    LILA-Supermercado         Carlos González
    ## 41      LINOD                     LINO-Delicateses        Felipe Izquierdo
    ## 42      LONEP             Lonesome Pine Restaurant             Fran Wilson
    ## 43      MAGAA         Magazzini Alimentari Riuniti        Giovanni Rovelli
    ## 44      MAISD                         Maison Dewey         Catherine Dewey
    ## 45      MEREP                       Mère Paillarde          Jean Fresnière
    ## 46      NORTS                          North/South          Simon Crowther
    ## 47      OCEAN               Océano Atlántico Ltda.          Yvonne Moncada
    ## 48      OLDWO               Old World Delicatessen           Rene Phillips
    ## 49      PARIS                    Paris spécialités          Marie Bertrand
    ## 50      PERIC            Pericles Comidas clásicas     Guillermo Fernández
    ## 51      PICCO                     Piccolo und mehr             Georg Pipps
    ## 52      PRINI               Princesa Isabel Vinhos        Isabel de Castro
    ## 53      QUEDE                          Que Delícia        Bernardo Batista
    ## 54      QUEEN                        Queen Cozinha          Lúcia Carvalho
    ## 55      RANCH                        Rancho grande        Sergio Gutiérrez
    ## 56      RATTC           Rattlesnake Canyon Grocery            Paula Wilson
    ## 57      REGGC                   Reggiani Caseifici         Maurizio Moroni
    ## 58      RICAR                   Ricardo Adocicados          Janete Limeira
    ## 59      RICSU                   Richter Supermarkt            Michael Holz
    ## 60      ROMEY                     Romero y tomillo        Alejandra Camino
    ## 61      SANTG                        Santé Gourmet        Jonas Bergulfsen
    ## 62      SAVEA                   Save-a-lot Markets          Jose Pavarotti
    ## 63      SEVES                   Seven Seas Imports              Hari Kumar
    ## 64      SIMOB                        Simons bistro          Jytte Petersen
    ## 65      SPECD                 Spécialités du monde       Dominique Perrier
    ## 66      SPLIR                Split Rail Beer & Ale      Art Braunschweiger
    ## 67      SUPRD                     Suprêmes délices        Pascale Cartrain
    ## 68      THEBI                       The Big Cheese               Liz Nixon
    ## 69      THECR                      The Cracker Box                Liu Wong
    ## 70      TORTU                  Tortuga Restaurante    Miguel Angel Paolino
    ## 71      TRADH               Tradição Hipermercados       Anabela Domingues
    ## 72      TRAIH    Trail's Head Gourmet Provisioners          Helvetius Nagy
    ## 73      VAFFE                         Vaffeljernet             Palle Ibsen
    ## 74      VICTE                 Victuailles en stock            Mary Saveley
    ## 75      VINET            Vins et alcools Chevalier            Paul Henriot
    ## 76      WARTH                       Wartian Herkku        Pirkko Koskitalo
    ## 77      WELLI               Wellington Importadora           Paula Parente
    ## 78      WHITC                 White Clover Markets          Karl Jablonski
    ## 79      WILMK                          Wilman Kala         Matti Karttunen
    ## 80      WOLZA                       Wolski  Zajazd Zbyszek Piestrzeniewicz
    ##                      ContactTitle
    ## 1                           Owner
    ## 2                           Owner
    ## 3            Sales Representative
    ## 4             Order Administrator
    ## 5               Marketing Manager
    ## 6                           Owner
    ## 7                           Owner
    ## 8              Accounting Manager
    ## 9            Sales Representative
    ## 10                    Sales Agent
    ## 11              Marketing Manager
    ## 12                          Owner
    ## 13                Sales Associate
    ## 14           Sales Representative
    ## 15                          Owner
    ## 16                    Sales Agent
    ## 17                  Sales Manager
    ## 18            Marketing Assistant
    ## 19             Accounting Manager
    ## 20          Assistant Sales Agent
    ## 21                          Owner
    ## 22              Marketing Manager
    ## 23           Sales Representative
    ## 24                  Sales Manager
    ## 25              Marketing Manager
    ## 26                  Sales Manager
    ## 27                Sales Associate
    ## 28              Marketing Manager
    ## 29                          Owner
    ## 30             Accounting Manager
    ## 31           Sales Representative
    ## 32           Sales Representative
    ## 33                Sales Associate
    ## 34              Marketing Manager
    ## 35           Sales Representative
    ## 36                  Sales Manager
    ## 37            Marketing Assistant
    ## 38              Marketing Manager
    ## 39                          Owner
    ## 40             Accounting Manager
    ## 41                          Owner
    ## 42                  Sales Manager
    ## 43              Marketing Manager
    ## 44                    Sales Agent
    ## 45            Marketing Assistant
    ## 46                Sales Associate
    ## 47                    Sales Agent
    ## 48           Sales Representative
    ## 49                          Owner
    ## 50           Sales Representative
    ## 51                  Sales Manager
    ## 52           Sales Representative
    ## 53             Accounting Manager
    ## 54            Marketing Assistant
    ## 55           Sales Representative
    ## 56 Assistant Sales Representative
    ## 57                Sales Associate
    ## 58          Assistant Sales Agent
    ## 59                  Sales Manager
    ## 60             Accounting Manager
    ## 61                          Owner
    ## 62           Sales Representative
    ## 63                  Sales Manager
    ## 64                          Owner
    ## 65              Marketing Manager
    ## 66                  Sales Manager
    ## 67             Accounting Manager
    ## 68              Marketing Manager
    ## 69            Marketing Assistant
    ## 70                          Owner
    ## 71           Sales Representative
    ## 72                Sales Associate
    ## 73                  Sales Manager
    ## 74                    Sales Agent
    ## 75             Accounting Manager
    ## 76             Accounting Manager
    ## 77                  Sales Manager
    ## 78                          Owner
    ## 79      Owner/Marketing Assistant
    ## 80                          Owner
    ##                                           Address            City
    ## 1                   Avda. de la Constitución 2222     México D.F.
    ## 2                                 Mataderos  2312     México D.F.
    ## 3                                 120 Hanover Sq.          London
    ## 4                                 Berguvsvägen  8           Luleå
    ## 5                                24, place Kléber      Strasbourg
    ## 6                                  C/ Araquil, 67          Madrid
    ## 7                            12, rue des Bouchers       Marseille
    ## 8                              23 Tsawassen Blvd.       Tsawassen
    ## 9                               Fauntleroy Circus          London
    ## 10                                    Cerrito 333    Buenos Aires
    ## 11                        Sierras de Granada 9993     México D.F.
    ## 12                                   Hauptstr. 29            Bern
    ## 13                           Av. dos Lusíadas, 23       São Paulo
    ## 14                Berkeley Gardens\r\n12  Brewery          London
    ## 15                   67, rue des Cinquante Otages          Nantes
    ## 16                                 35 King George          London
    ## 17                                   Kirchgasse 6            Graz
    ## 18                                   Rua Orós, 92       São Paulo
    ## 19                             C/ Moralzarzal, 86          Madrid
    ## 20                       184, chaussée de Tournai           Lille
    ## 21                                   Åkergatan 24          Bräcke
    ## 22                                 54, rue Royale          Nantes
    ## 23                            Via Monte Bianco 34          Torino
    ## 24                         Jardim das rosas n. 32          Lisboa
    ## 25                         Rambla de Cataluña, 23       Barcelona
    ## 26                                  C/ Romero, 33         Sevilla
    ## 27                                Av. Brasil, 442        Campinas
    ## 28                               2732 Baker Blvd.          Eugene
    ## 29                      5ª Ave. Los Palos Grandes         Caracas
    ## 30                                Rua do Paço, 67  Rio de Janeiro
    ## 31     Carrera 22 con Ave. Carlos Soublette #8-35   San Cristóbal
    ## 32              City Center Plaza\r\n516 Main St.           Elgin
    ## 33                               8 Johnstown Road            Cork
    ## 34                   Garden House\r\nCrowther Way           Cowes
    ## 35                         67, avenue de l'Europe      Versailles
    ## 36                          1 rue Alsace-Lorraine        Toulouse
    ## 37                                   1900 Oak St.       Vancouver
    ## 38                           12 Orchestra Terrace     Walla Walla
    ## 39                         87 Polk St.\r\nSuite 5   San Francisco
    ## 40 Carrera 52 con Ave. Bolívar #65-98 Llano Largo    Barquisimeto
    ## 41                        Ave. 5 de Mayo Porlamar I. de Margarita
    ## 42                             89 Chiaroscuro Rd.        Portland
    ## 43                        Via Ludovico il Moro 22         Bergamo
    ## 44                            Rue Joseph-Bens 532       Bruxelles
    ## 45                             43 rue St. Laurent        Montréal
    ## 46                South House\r\n300 Queensbridge          London
    ## 47         Ing. Gustavo Moncada 8585\r\nPiso 20-A    Buenos Aires
    ## 48                                2743 Bering St.       Anchorage
    ## 49                        265, boulevard Charonne           Paris
    ## 50                       Calle Dr. Jorge Cash 321     México D.F.
    ## 51                                    Geislweg 14        Salzburg
    ## 52                         Estrada da saúde n. 58          Lisboa
    ## 53                        Rua da Panificadora, 12  Rio de Janeiro
    ## 54                      Alameda dos Canàrios, 891       São Paulo
    ## 55                         Av. del Libertador 900    Buenos Aires
    ## 56                                2817 Milton Dr.     Albuquerque
    ## 57                         Strada Provinciale 124   Reggio Emilia
    ## 58                            Av. Copacabana, 267  Rio de Janeiro
    ## 59                              Grenzacherweg 237          Genève
    ## 60                                    Gran Vía, 1          Madrid
    ## 61                         Erling Skakkes gate 78         Stavern
    ## 62                                187 Suffolk Ln.           Boise
    ## 63                                90 Wadhurst Rd.          London
    ## 64                                   Vinbæltet 34       København
    ## 65                              25, rue Lauriston           Paris
    ## 66                                   P.O. Box 555          Lander
    ## 67                           Boulevard Tirou, 255       Charleroi
    ## 68                    89 Jefferson Way\r\nSuite 2        Portland
    ## 69                            55 Grizzly Peak Rd.           Butte
    ## 70                               Avda. Azteca 123     México D.F.
    ## 71                        Av. Inês de Castro, 414       São Paulo
    ## 72                              722 DaVinci Blvd.        Kirkland
    ## 73                                  Smagsløget 45           Århus
    ## 74                             2, rue du Commerce            Lyon
    ## 75                             59 rue de l'Abbaye           Reims
    ## 76                                    Torikatu 38            Oulu
    ## 77                             Rua do Mercado, 12         Resende
    ## 78                 305 - 14th Ave. S.\r\nSuite 3B         Seattle
    ## 79                                  Keskuskatu 45        Helsinki
    ## 80                                ul. Filtrowa 68        Warszawa
    ##           Region PostalCode     Country             Phone
    ## 1           <NA>      05021      Mexico      (5) 555-4729
    ## 2           <NA>      05023      Mexico      (5) 555-3932
    ## 3           <NA>    WA1 1DP          UK    (171) 555-7788
    ## 4           <NA>   S-958 22      Sweden     0921-12 34 65
    ## 5           <NA>      67000      France       88.60.15.31
    ## 6           <NA>      28023       Spain    (91) 555 22 82
    ## 7           <NA>      13008      France       91.24.45.40
    ## 8             BC    T2F 8M4      Canada    (604) 555-4729
    ## 9           <NA>    EC2 5NT          UK    (171) 555-1212
    ## 10          <NA>       1010   Argentina      (1) 135-5555
    ## 11          <NA>      05022      Mexico      (5) 555-3392
    ## 12          <NA>       3012 Switzerland       0452-076545
    ## 13            SP  05432-043      Brazil     (11) 555-7647
    ## 14          <NA>    WX1 6LT          UK    (171) 555-2282
    ## 15          <NA>      44000      France       40.67.88.88
    ## 16          <NA>    WX3 6FW          UK    (171) 555-0297
    ## 17          <NA>       8010     Austria         7675-3425
    ## 18            SP  05442-030      Brazil     (11) 555-9857
    ## 19          <NA>      28034       Spain    (91) 555 94 44
    ## 20          <NA>      59000      France       20.16.10.16
    ## 21          <NA>   S-844 67      Sweden     0695-34 67 21
    ## 22          <NA>      44000      France       40.32.21.21
    ## 23          <NA>      10100       Italy       011-4988260
    ## 24          <NA>       1675    Portugal      (1) 354-2534
    ## 25          <NA>      08022       Spain     (93) 203 4560
    ## 26          <NA>      41101       Spain    (95) 555 82 82
    ## 27            SP  04876-786      Brazil     (11) 555-9482
    ## 28            OR      97403         USA    (503) 555-7555
    ## 29            DF       1081   Venezuela      (2) 283-2951
    ## 30            RJ  05454-876      Brazil     (21) 555-0091
    ## 31       Táchira       5022   Venezuela      (5) 555-1340
    ## 32            OR      97827         USA    (503) 555-6874
    ## 33      Co. Cork       <NA>     Ireland          2967 542
    ## 34 Isle of Wight   PO31 7PJ          UK    (198) 555-8888
    ## 35          <NA>      78000      France       30.59.84.10
    ## 36          <NA>      31000      France       61.77.61.10
    ## 37            BC    V3F 2K1      Canada    (604) 555-3392
    ## 38            WA      99362         USA    (509) 555-7969
    ## 39            CA      94117         USA    (415) 555-5938
    ## 40          Lara       3508   Venezuela      (9) 331-6954
    ## 41 Nueva Esparta       4980   Venezuela      (8) 34-56-12
    ## 42            OR      97219         USA    (503) 555-9573
    ## 43          <NA>      24100       Italy        035-640230
    ## 44          <NA>     B-1180     Belgium    (02) 201 24 67
    ## 45        Québec    H1J 1C3      Canada    (514) 555-8054
    ## 46          <NA>    SW7 1RZ          UK    (171) 555-7733
    ## 47          <NA>       1010   Argentina      (1) 135-5333
    ## 48            AK      99508         USA    (907) 555-7584
    ## 49          <NA>      75012      France   (1) 42.34.22.66
    ## 50          <NA>      05033      Mexico      (5) 552-3745
    ## 51          <NA>       5020     Austria         6562-9722
    ## 52          <NA>       1756    Portugal      (1) 356-5634
    ## 53            RJ  02389-673      Brazil     (21) 555-4252
    ## 54            SP  05487-020      Brazil     (11) 555-1189
    ## 55          <NA>       1010   Argentina      (1) 123-5555
    ## 56            NM      87110         USA    (505) 555-5939
    ## 57          <NA>      42100       Italy       0522-556721
    ## 58            RJ  02389-890      Brazil     (21) 555-3412
    ## 59          <NA>       1203 Switzerland       0897-034214
    ## 60          <NA>      28001       Spain     (91) 745 6200
    ## 61          <NA>       4110      Norway       07-98 92 35
    ## 62            ID      83720         USA    (208) 555-8097
    ## 63          <NA>   OX15 4NB          UK    (171) 555-1717
    ## 64          <NA>       1734     Denmark       31 12 34 56
    ## 65          <NA>      75016      France   (1) 47.55.60.10
    ## 66            WY      82520         USA    (307) 555-4680
    ## 67          <NA>     B-6000     Belgium (071) 23 67 22 20
    ## 68            OR      97201         USA    (503) 555-3612
    ## 69            MT      59801         USA    (406) 555-5834
    ## 70          <NA>      05033      Mexico      (5) 555-2933
    ## 71            SP  05634-030      Brazil     (11) 555-2167
    ## 72            WA      98034         USA    (206) 555-8257
    ## 73          <NA>       8200     Denmark       86 21 32 43
    ## 74          <NA>      69004      France       78.32.54.86
    ## 75          <NA>      51100      France       26.47.15.10
    ## 76          <NA>      90110     Finland        981-443655
    ## 77            SP  08737-363      Brazil     (14) 555-8122
    ## 78            WA      98128         USA    (206) 555-4112
    ## 79          <NA>      21240     Finland       90-224 8858
    ## 80          <NA>     01-012      Poland     (26) 642-7012
    ##                  Fax
    ## 1       (5) 555-3745
    ## 2               <NA>
    ## 3     (171) 555-6750
    ## 4      0921-12 34 67
    ## 5        88.60.15.32
    ## 6     (91) 555 91 99
    ## 7        91.24.45.41
    ## 8     (604) 555-3745
    ## 9               <NA>
    ## 10      (1) 135-4892
    ## 11      (5) 555-7293
    ## 12              <NA>
    ## 13              <NA>
    ## 14    (171) 555-9199
    ## 15       40.67.89.89
    ## 16    (171) 555-3373
    ## 17         7675-3426
    ## 18              <NA>
    ## 19    (91) 555 55 93
    ## 20       20.16.10.17
    ## 21              <NA>
    ## 22       40.32.21.20
    ## 23       011-4988261
    ## 24      (1) 354-2535
    ## 25     (93) 203 4561
    ## 26              <NA>
    ## 27              <NA>
    ## 28              <NA>
    ## 29      (2) 283-3397
    ## 30     (21) 555-8765
    ## 31      (5) 555-1948
    ## 32    (503) 555-2376
    ## 33         2967 3333
    ## 34              <NA>
    ## 35       30.59.85.11
    ## 36       61.77.61.11
    ## 37    (604) 555-7293
    ## 38    (509) 555-6221
    ## 39              <NA>
    ## 40      (9) 331-7256
    ## 41      (8) 34-93-93
    ## 42    (503) 555-9646
    ## 43        035-640231
    ## 44    (02) 201 24 68
    ## 45    (514) 555-8055
    ## 46    (171) 555-2530
    ## 47      (1) 135-5535
    ## 48    (907) 555-2880
    ## 49   (1) 42.34.22.77
    ## 50      (5) 545-3745
    ## 51         6562-9723
    ## 52              <NA>
    ## 53     (21) 555-4545
    ## 54              <NA>
    ## 55      (1) 123-5556
    ## 56    (505) 555-3620
    ## 57       0522-556722
    ## 58              <NA>
    ## 59              <NA>
    ## 60     (91) 745 6210
    ## 61       07-98 92 47
    ## 62              <NA>
    ## 63    (171) 555-5646
    ## 64       31 13 35 57
    ## 65   (1) 47.55.60.20
    ## 66    (307) 555-6525
    ## 67 (071) 23 67 22 21
    ## 68              <NA>
    ## 69    (406) 555-8083
    ## 70              <NA>
    ## 71     (11) 555-2168
    ## 72    (206) 555-2174
    ## 73       86 22 33 44
    ## 74       78.32.54.87
    ## 75       26.47.15.11
    ## 76        981-443655
    ## 77              <NA>
    ## 78    (206) 555-4115
    ## 79       90-224 8858
    ## 80     (26) 642-7012

SQL statement selects all fields from "Customers" where country is "Germany" AND
================================================================================

city must be "Berlin" OR "München" (use parenthesis to form complex expressions)
================================================================================

``` r
sqldf("SELECT *
       FROM Customers
       WHERE country = 'Germany' AND  (City = 'Berlin' OR City = 'München');")
```

    ##   CustomerID         CompanyName   ContactName         ContactTitle
    ## 1      ALFKI Alfreds Futterkiste  Maria Anders Sales Representative
    ## 2      FRANK      Frankenversand Peter Franken    Marketing Manager
    ##             Address    City Region PostalCode Country       Phone
    ## 1     Obere Str. 57  Berlin   <NA>      12209 Germany 030-0074321
    ## 2 Berliner Platz 43 München   <NA>      80805 Germany 089-0877310
    ##           Fax
    ## 1 030-0076545
    ## 2 089-0877451

SQL statement selects all fields from "Customers" where country is NOT "Germany" and NOT "USA"
==============================================================================================

``` r
sqldf("SELECT *
       FROM Customers
       WHERE Country <> 'Germany' AND Country <> 'USA' ;")
```

    ##    CustomerID                          CompanyName             ContactName
    ## 1       ANATR   Ana Trujillo Emparedados y helados            Ana Trujillo
    ## 2       ANTON              Antonio Moreno Taquería          Antonio Moreno
    ## 3       AROUT                      Around the Horn            Thomas Hardy
    ## 4       BERGS                   Berglunds snabbköp      Christina Berglund
    ## 5       BLONP                 Blondel père et fils      Frédérique Citeaux
    ## 6       BOLID            Bólido Comidas preparadas           Martín Sommer
    ## 7       BONAP                             Bon app'        Laurence Lebihan
    ## 8       BOTTM                Bottom-Dollar Markets       Elizabeth Lincoln
    ## 9       BSBEV                        B's Beverages       Victoria Ashworth
    ## 10      CACTU           Cactus Comidas para llevar        Patricio Simpson
    ## 11      CENTC           Centro comercial Moctezuma         Francisco Chang
    ## 12      CHOPS                    Chop-suey Chinese               Yang Wang
    ## 13      COMMI                     Comércio Mineiro            Pedro Afonso
    ## 14      CONSH                Consolidated Holdings         Elizabeth Brown
    ## 15      DUMON                      Du monde entier          Janine Labrune
    ## 16      EASTC                   Eastern Connection               Ann Devon
    ## 17      ERNSH                         Ernst Handel           Roland Mendel
    ## 18      FAMIA                   Familia Arquibaldo               Aria Cruz
    ## 19      FISSA FISSA Fabrica Inter. Salchichas S.A.              Diego Roel
    ## 20      FOLIG                    Folies gourmandes           Martine Rancé
    ## 21      FOLKO                       Folk och fä HB           Maria Larsson
    ## 22      FRANR                  France restauration          Carine Schmitt
    ## 23      FRANS                       Franchi S.p.A.           Paolo Accorti
    ## 24      FURIB       Furia Bacalhau e Frutos do Mar          Lino Rodriguez
    ## 25      GALED               Galería del gastrónomo        Eduardo Saavedra
    ## 26      GODOS                  Godos Cocina Típica       José Pedro Freyre
    ## 27      GOURL                  Gourmet Lanchonetes           André Fonseca
    ## 28      GROSR                 GROSELLA-Restaurante          Manuel Pereira
    ## 29      HANAR                        Hanari Carnes            Mario Pontes
    ## 30      HILAA                     HILARIÓN-Abastos        Carlos Hernández
    ## 31      HUNGO         Hungry Owl All-Night Grocers        Patricia McKenna
    ## 32      ISLAT                       Island Trading           Helen Bennett
    ## 33      LACOR                 La corne d'abondance           Daniel Tonini
    ## 34      LAMAI                     La maison d'Asie          Annette Roulet
    ## 35      LAUGB        Laughing Bacchus Wine Cellars         Yoshi Tannamuri
    ## 36      LILAS                    LILA-Supermercado         Carlos González
    ## 37      LINOD                     LINO-Delicateses        Felipe Izquierdo
    ## 38      MAGAA         Magazzini Alimentari Riuniti        Giovanni Rovelli
    ## 39      MAISD                         Maison Dewey         Catherine Dewey
    ## 40      MEREP                       Mère Paillarde          Jean Fresnière
    ## 41      NORTS                          North/South          Simon Crowther
    ## 42      OCEAN               Océano Atlántico Ltda.          Yvonne Moncada
    ## 43      PARIS                    Paris spécialités          Marie Bertrand
    ## 44      PERIC            Pericles Comidas clásicas     Guillermo Fernández
    ## 45      PICCO                     Piccolo und mehr             Georg Pipps
    ## 46      PRINI               Princesa Isabel Vinhos        Isabel de Castro
    ## 47      QUEDE                          Que Delícia        Bernardo Batista
    ## 48      QUEEN                        Queen Cozinha          Lúcia Carvalho
    ## 49      RANCH                        Rancho grande        Sergio Gutiérrez
    ## 50      REGGC                   Reggiani Caseifici         Maurizio Moroni
    ## 51      RICAR                   Ricardo Adocicados          Janete Limeira
    ## 52      RICSU                   Richter Supermarkt            Michael Holz
    ## 53      ROMEY                     Romero y tomillo        Alejandra Camino
    ## 54      SANTG                        Santé Gourmet        Jonas Bergulfsen
    ## 55      SEVES                   Seven Seas Imports              Hari Kumar
    ## 56      SIMOB                        Simons bistro          Jytte Petersen
    ## 57      SPECD                 Spécialités du monde       Dominique Perrier
    ## 58      SUPRD                     Suprêmes délices        Pascale Cartrain
    ## 59      TORTU                  Tortuga Restaurante    Miguel Angel Paolino
    ## 60      TRADH               Tradição Hipermercados       Anabela Domingues
    ## 61      VAFFE                         Vaffeljernet             Palle Ibsen
    ## 62      VICTE                 Victuailles en stock            Mary Saveley
    ## 63      VINET            Vins et alcools Chevalier            Paul Henriot
    ## 64      WARTH                       Wartian Herkku        Pirkko Koskitalo
    ## 65      WELLI               Wellington Importadora           Paula Parente
    ## 66      WILMK                          Wilman Kala         Matti Karttunen
    ## 67      WOLZA                       Wolski  Zajazd Zbyszek Piestrzeniewicz
    ##                 ContactTitle
    ## 1                      Owner
    ## 2                      Owner
    ## 3       Sales Representative
    ## 4        Order Administrator
    ## 5          Marketing Manager
    ## 6                      Owner
    ## 7                      Owner
    ## 8         Accounting Manager
    ## 9       Sales Representative
    ## 10               Sales Agent
    ## 11         Marketing Manager
    ## 12                     Owner
    ## 13           Sales Associate
    ## 14      Sales Representative
    ## 15                     Owner
    ## 16               Sales Agent
    ## 17             Sales Manager
    ## 18       Marketing Assistant
    ## 19        Accounting Manager
    ## 20     Assistant Sales Agent
    ## 21                     Owner
    ## 22         Marketing Manager
    ## 23      Sales Representative
    ## 24             Sales Manager
    ## 25         Marketing Manager
    ## 26             Sales Manager
    ## 27           Sales Associate
    ## 28                     Owner
    ## 29        Accounting Manager
    ## 30      Sales Representative
    ## 31           Sales Associate
    ## 32         Marketing Manager
    ## 33      Sales Representative
    ## 34             Sales Manager
    ## 35       Marketing Assistant
    ## 36        Accounting Manager
    ## 37                     Owner
    ## 38         Marketing Manager
    ## 39               Sales Agent
    ## 40       Marketing Assistant
    ## 41           Sales Associate
    ## 42               Sales Agent
    ## 43                     Owner
    ## 44      Sales Representative
    ## 45             Sales Manager
    ## 46      Sales Representative
    ## 47        Accounting Manager
    ## 48       Marketing Assistant
    ## 49      Sales Representative
    ## 50           Sales Associate
    ## 51     Assistant Sales Agent
    ## 52             Sales Manager
    ## 53        Accounting Manager
    ## 54                     Owner
    ## 55             Sales Manager
    ## 56                     Owner
    ## 57         Marketing Manager
    ## 58        Accounting Manager
    ## 59                     Owner
    ## 60      Sales Representative
    ## 61             Sales Manager
    ## 62               Sales Agent
    ## 63        Accounting Manager
    ## 64        Accounting Manager
    ## 65             Sales Manager
    ## 66 Owner/Marketing Assistant
    ## 67                     Owner
    ##                                           Address            City
    ## 1                   Avda. de la Constitución 2222     México D.F.
    ## 2                                 Mataderos  2312     México D.F.
    ## 3                                 120 Hanover Sq.          London
    ## 4                                 Berguvsvägen  8           Luleå
    ## 5                                24, place Kléber      Strasbourg
    ## 6                                  C/ Araquil, 67          Madrid
    ## 7                            12, rue des Bouchers       Marseille
    ## 8                              23 Tsawassen Blvd.       Tsawassen
    ## 9                               Fauntleroy Circus          London
    ## 10                                    Cerrito 333    Buenos Aires
    ## 11                        Sierras de Granada 9993     México D.F.
    ## 12                                   Hauptstr. 29            Bern
    ## 13                           Av. dos Lusíadas, 23       São Paulo
    ## 14                Berkeley Gardens\r\n12  Brewery          London
    ## 15                   67, rue des Cinquante Otages          Nantes
    ## 16                                 35 King George          London
    ## 17                                   Kirchgasse 6            Graz
    ## 18                                   Rua Orós, 92       São Paulo
    ## 19                             C/ Moralzarzal, 86          Madrid
    ## 20                       184, chaussée de Tournai           Lille
    ## 21                                   Åkergatan 24          Bräcke
    ## 22                                 54, rue Royale          Nantes
    ## 23                            Via Monte Bianco 34          Torino
    ## 24                         Jardim das rosas n. 32          Lisboa
    ## 25                         Rambla de Cataluña, 23       Barcelona
    ## 26                                  C/ Romero, 33         Sevilla
    ## 27                                Av. Brasil, 442        Campinas
    ## 28                      5ª Ave. Los Palos Grandes         Caracas
    ## 29                                Rua do Paço, 67  Rio de Janeiro
    ## 30     Carrera 22 con Ave. Carlos Soublette #8-35   San Cristóbal
    ## 31                               8 Johnstown Road            Cork
    ## 32                   Garden House\r\nCrowther Way           Cowes
    ## 33                         67, avenue de l'Europe      Versailles
    ## 34                          1 rue Alsace-Lorraine        Toulouse
    ## 35                                   1900 Oak St.       Vancouver
    ## 36 Carrera 52 con Ave. Bolívar #65-98 Llano Largo    Barquisimeto
    ## 37                        Ave. 5 de Mayo Porlamar I. de Margarita
    ## 38                        Via Ludovico il Moro 22         Bergamo
    ## 39                            Rue Joseph-Bens 532       Bruxelles
    ## 40                             43 rue St. Laurent        Montréal
    ## 41                South House\r\n300 Queensbridge          London
    ## 42         Ing. Gustavo Moncada 8585\r\nPiso 20-A    Buenos Aires
    ## 43                        265, boulevard Charonne           Paris
    ## 44                       Calle Dr. Jorge Cash 321     México D.F.
    ## 45                                    Geislweg 14        Salzburg
    ## 46                         Estrada da saúde n. 58          Lisboa
    ## 47                        Rua da Panificadora, 12  Rio de Janeiro
    ## 48                      Alameda dos Canàrios, 891       São Paulo
    ## 49                         Av. del Libertador 900    Buenos Aires
    ## 50                         Strada Provinciale 124   Reggio Emilia
    ## 51                            Av. Copacabana, 267  Rio de Janeiro
    ## 52                              Grenzacherweg 237          Genève
    ## 53                                    Gran Vía, 1          Madrid
    ## 54                         Erling Skakkes gate 78         Stavern
    ## 55                                90 Wadhurst Rd.          London
    ## 56                                   Vinbæltet 34       København
    ## 57                              25, rue Lauriston           Paris
    ## 58                           Boulevard Tirou, 255       Charleroi
    ## 59                               Avda. Azteca 123     México D.F.
    ## 60                        Av. Inês de Castro, 414       São Paulo
    ## 61                                  Smagsløget 45           Århus
    ## 62                             2, rue du Commerce            Lyon
    ## 63                             59 rue de l'Abbaye           Reims
    ## 64                                    Torikatu 38            Oulu
    ## 65                             Rua do Mercado, 12         Resende
    ## 66                                  Keskuskatu 45        Helsinki
    ## 67                                ul. Filtrowa 68        Warszawa
    ##           Region PostalCode     Country             Phone
    ## 1           <NA>      05021      Mexico      (5) 555-4729
    ## 2           <NA>      05023      Mexico      (5) 555-3932
    ## 3           <NA>    WA1 1DP          UK    (171) 555-7788
    ## 4           <NA>   S-958 22      Sweden     0921-12 34 65
    ## 5           <NA>      67000      France       88.60.15.31
    ## 6           <NA>      28023       Spain    (91) 555 22 82
    ## 7           <NA>      13008      France       91.24.45.40
    ## 8             BC    T2F 8M4      Canada    (604) 555-4729
    ## 9           <NA>    EC2 5NT          UK    (171) 555-1212
    ## 10          <NA>       1010   Argentina      (1) 135-5555
    ## 11          <NA>      05022      Mexico      (5) 555-3392
    ## 12          <NA>       3012 Switzerland       0452-076545
    ## 13            SP  05432-043      Brazil     (11) 555-7647
    ## 14          <NA>    WX1 6LT          UK    (171) 555-2282
    ## 15          <NA>      44000      France       40.67.88.88
    ## 16          <NA>    WX3 6FW          UK    (171) 555-0297
    ## 17          <NA>       8010     Austria         7675-3425
    ## 18            SP  05442-030      Brazil     (11) 555-9857
    ## 19          <NA>      28034       Spain    (91) 555 94 44
    ## 20          <NA>      59000      France       20.16.10.16
    ## 21          <NA>   S-844 67      Sweden     0695-34 67 21
    ## 22          <NA>      44000      France       40.32.21.21
    ## 23          <NA>      10100       Italy       011-4988260
    ## 24          <NA>       1675    Portugal      (1) 354-2534
    ## 25          <NA>      08022       Spain     (93) 203 4560
    ## 26          <NA>      41101       Spain    (95) 555 82 82
    ## 27            SP  04876-786      Brazil     (11) 555-9482
    ## 28            DF       1081   Venezuela      (2) 283-2951
    ## 29            RJ  05454-876      Brazil     (21) 555-0091
    ## 30       Táchira       5022   Venezuela      (5) 555-1340
    ## 31      Co. Cork       <NA>     Ireland          2967 542
    ## 32 Isle of Wight   PO31 7PJ          UK    (198) 555-8888
    ## 33          <NA>      78000      France       30.59.84.10
    ## 34          <NA>      31000      France       61.77.61.10
    ## 35            BC    V3F 2K1      Canada    (604) 555-3392
    ## 36          Lara       3508   Venezuela      (9) 331-6954
    ## 37 Nueva Esparta       4980   Venezuela      (8) 34-56-12
    ## 38          <NA>      24100       Italy        035-640230
    ## 39          <NA>     B-1180     Belgium    (02) 201 24 67
    ## 40        Québec    H1J 1C3      Canada    (514) 555-8054
    ## 41          <NA>    SW7 1RZ          UK    (171) 555-7733
    ## 42          <NA>       1010   Argentina      (1) 135-5333
    ## 43          <NA>      75012      France   (1) 42.34.22.66
    ## 44          <NA>      05033      Mexico      (5) 552-3745
    ## 45          <NA>       5020     Austria         6562-9722
    ## 46          <NA>       1756    Portugal      (1) 356-5634
    ## 47            RJ  02389-673      Brazil     (21) 555-4252
    ## 48            SP  05487-020      Brazil     (11) 555-1189
    ## 49          <NA>       1010   Argentina      (1) 123-5555
    ## 50          <NA>      42100       Italy       0522-556721
    ## 51            RJ  02389-890      Brazil     (21) 555-3412
    ## 52          <NA>       1203 Switzerland       0897-034214
    ## 53          <NA>      28001       Spain     (91) 745 6200
    ## 54          <NA>       4110      Norway       07-98 92 35
    ## 55          <NA>   OX15 4NB          UK    (171) 555-1717
    ## 56          <NA>       1734     Denmark       31 12 34 56
    ## 57          <NA>      75016      France   (1) 47.55.60.10
    ## 58          <NA>     B-6000     Belgium (071) 23 67 22 20
    ## 59          <NA>      05033      Mexico      (5) 555-2933
    ## 60            SP  05634-030      Brazil     (11) 555-2167
    ## 61          <NA>       8200     Denmark       86 21 32 43
    ## 62          <NA>      69004      France       78.32.54.86
    ## 63          <NA>      51100      France       26.47.15.10
    ## 64          <NA>      90110     Finland        981-443655
    ## 65            SP  08737-363      Brazil     (14) 555-8122
    ## 66          <NA>      21240     Finland       90-224 8858
    ## 67          <NA>     01-012      Poland     (26) 642-7012
    ##                  Fax
    ## 1       (5) 555-3745
    ## 2               <NA>
    ## 3     (171) 555-6750
    ## 4      0921-12 34 67
    ## 5        88.60.15.32
    ## 6     (91) 555 91 99
    ## 7        91.24.45.41
    ## 8     (604) 555-3745
    ## 9               <NA>
    ## 10      (1) 135-4892
    ## 11      (5) 555-7293
    ## 12              <NA>
    ## 13              <NA>
    ## 14    (171) 555-9199
    ## 15       40.67.89.89
    ## 16    (171) 555-3373
    ## 17         7675-3426
    ## 18              <NA>
    ## 19    (91) 555 55 93
    ## 20       20.16.10.17
    ## 21              <NA>
    ## 22       40.32.21.20
    ## 23       011-4988261
    ## 24      (1) 354-2535
    ## 25     (93) 203 4561
    ## 26              <NA>
    ## 27              <NA>
    ## 28      (2) 283-3397
    ## 29     (21) 555-8765
    ## 30      (5) 555-1948
    ## 31         2967 3333
    ## 32              <NA>
    ## 33       30.59.85.11
    ## 34       61.77.61.11
    ## 35    (604) 555-7293
    ## 36      (9) 331-7256
    ## 37      (8) 34-93-93
    ## 38        035-640231
    ## 39    (02) 201 24 68
    ## 40    (514) 555-8055
    ## 41    (171) 555-2530
    ## 42      (1) 135-5535
    ## 43   (1) 42.34.22.77
    ## 44      (5) 545-3745
    ## 45         6562-9723
    ## 46              <NA>
    ## 47     (21) 555-4545
    ## 48              <NA>
    ## 49      (1) 123-5556
    ## 50       0522-556722
    ## 51              <NA>
    ## 52              <NA>
    ## 53     (91) 745 6210
    ## 54       07-98 92 47
    ## 55    (171) 555-5646
    ## 56       31 13 35 57
    ## 57   (1) 47.55.60.20
    ## 58 (071) 23 67 22 21
    ## 59              <NA>
    ## 60     (11) 555-2168
    ## 61       86 22 33 44
    ## 62       78.32.54.87
    ## 63       26.47.15.11
    ## 64        981-443655
    ## 65              <NA>
    ## 66       90-224 8858
    ## 67     (26) 642-7012

SQL statement selects all customers from the "Customers" table, sorted by the "Country" column
==============================================================================================

``` r
sqldf("SELECT * 
       FROM Customers
       ORDER By Country;")
```

    ##    CustomerID                          CompanyName             ContactName
    ## 1       CACTU           Cactus Comidas para llevar        Patricio Simpson
    ## 2       OCEAN               Océano Atlántico Ltda.          Yvonne Moncada
    ## 3       RANCH                        Rancho grande        Sergio Gutiérrez
    ## 4       ERNSH                         Ernst Handel           Roland Mendel
    ## 5       PICCO                     Piccolo und mehr             Georg Pipps
    ## 6       MAISD                         Maison Dewey         Catherine Dewey
    ## 7       SUPRD                     Suprêmes délices        Pascale Cartrain
    ## 8       COMMI                     Comércio Mineiro            Pedro Afonso
    ## 9       FAMIA                   Familia Arquibaldo               Aria Cruz
    ## 10      GOURL                  Gourmet Lanchonetes           André Fonseca
    ## 11      HANAR                        Hanari Carnes            Mario Pontes
    ## 12      QUEDE                          Que Delícia        Bernardo Batista
    ## 13      QUEEN                        Queen Cozinha          Lúcia Carvalho
    ## 14      RICAR                   Ricardo Adocicados          Janete Limeira
    ## 15      TRADH               Tradição Hipermercados       Anabela Domingues
    ## 16      WELLI               Wellington Importadora           Paula Parente
    ## 17      BOTTM                Bottom-Dollar Markets       Elizabeth Lincoln
    ## 18      LAUGB        Laughing Bacchus Wine Cellars         Yoshi Tannamuri
    ## 19      MEREP                       Mère Paillarde          Jean Fresnière
    ## 20      SIMOB                        Simons bistro          Jytte Petersen
    ## 21      VAFFE                         Vaffeljernet             Palle Ibsen
    ## 22      WARTH                       Wartian Herkku        Pirkko Koskitalo
    ## 23      WILMK                          Wilman Kala         Matti Karttunen
    ## 24      BLONP                 Blondel père et fils      Frédérique Citeaux
    ## 25      BONAP                             Bon app'        Laurence Lebihan
    ## 26      DUMON                      Du monde entier          Janine Labrune
    ## 27      FOLIG                    Folies gourmandes           Martine Rancé
    ## 28      FRANR                  France restauration          Carine Schmitt
    ## 29      LACOR                 La corne d'abondance           Daniel Tonini
    ## 30      LAMAI                     La maison d'Asie          Annette Roulet
    ## 31      PARIS                    Paris spécialités          Marie Bertrand
    ## 32      SPECD                 Spécialités du monde       Dominique Perrier
    ## 33      VICTE                 Victuailles en stock            Mary Saveley
    ## 34      VINET            Vins et alcools Chevalier            Paul Henriot
    ## 35      ALFKI                  Alfreds Futterkiste            Maria Anders
    ## 36      BLAUS              Blauer See Delikatessen              Hanna Moos
    ## 37      DRACD             Drachenblut Delikatessen            Sven Ottlieb
    ## 38      FRANK                       Frankenversand           Peter Franken
    ## 39      KOENE                      Königlich Essen           Philip Cramer
    ## 40      LEHMS                  Lehmanns Marktstand          Renate Messner
    ## 41      MORGK               Morgenstern Gesundkost         Alexander Feuer
    ## 42      OTTIK                   Ottilies Käseladen     Henriette Pfalzheim
    ## 43      QUICK                           QUICK-Stop             Horst Kloss
    ## 44      TOMSP                   Toms Spezialitäten           Karin Josephs
    ## 45      WANDK                    Die Wandernde Kuh             Rita Müller
    ## 46      HUNGO         Hungry Owl All-Night Grocers        Patricia McKenna
    ## 47      FRANS                       Franchi S.p.A.           Paolo Accorti
    ## 48      MAGAA         Magazzini Alimentari Riuniti        Giovanni Rovelli
    ## 49      REGGC                   Reggiani Caseifici         Maurizio Moroni
    ## 50      ANATR   Ana Trujillo Emparedados y helados            Ana Trujillo
    ## 51      ANTON              Antonio Moreno Taquería          Antonio Moreno
    ## 52      CENTC           Centro comercial Moctezuma         Francisco Chang
    ## 53      PERIC            Pericles Comidas clásicas     Guillermo Fernández
    ## 54      TORTU                  Tortuga Restaurante    Miguel Angel Paolino
    ## 55      SANTG                        Santé Gourmet        Jonas Bergulfsen
    ## 56      WOLZA                       Wolski  Zajazd Zbyszek Piestrzeniewicz
    ## 57      FURIB       Furia Bacalhau e Frutos do Mar          Lino Rodriguez
    ## 58      PRINI               Princesa Isabel Vinhos        Isabel de Castro
    ## 59      BOLID            Bólido Comidas preparadas           Martín Sommer
    ## 60      FISSA FISSA Fabrica Inter. Salchichas S.A.              Diego Roel
    ## 61      GALED               Galería del gastrónomo        Eduardo Saavedra
    ## 62      GODOS                  Godos Cocina Típica       José Pedro Freyre
    ## 63      ROMEY                     Romero y tomillo        Alejandra Camino
    ## 64      BERGS                   Berglunds snabbköp      Christina Berglund
    ## 65      FOLKO                       Folk och fä HB           Maria Larsson
    ## 66      CHOPS                    Chop-suey Chinese               Yang Wang
    ## 67      RICSU                   Richter Supermarkt            Michael Holz
    ## 68      AROUT                      Around the Horn            Thomas Hardy
    ## 69      BSBEV                        B's Beverages       Victoria Ashworth
    ## 70      CONSH                Consolidated Holdings         Elizabeth Brown
    ## 71      EASTC                   Eastern Connection               Ann Devon
    ## 72      ISLAT                       Island Trading           Helen Bennett
    ## 73      NORTS                          North/South          Simon Crowther
    ## 74      SEVES                   Seven Seas Imports              Hari Kumar
    ## 75      GREAL              Great Lakes Food Market           Howard Snyder
    ## 76      HUNGC           Hungry Coyote Import Store           Yoshi Latimer
    ## 77      LAZYK                 Lazy K Kountry Store              John Steel
    ## 78      LETSS                    Let's Stop N Shop            Jaime Yorres
    ## 79      LONEP             Lonesome Pine Restaurant             Fran Wilson
    ## 80      OLDWO               Old World Delicatessen           Rene Phillips
    ## 81      RATTC           Rattlesnake Canyon Grocery            Paula Wilson
    ## 82      SAVEA                   Save-a-lot Markets          Jose Pavarotti
    ## 83      SPLIR                Split Rail Beer & Ale      Art Braunschweiger
    ## 84      THEBI                       The Big Cheese               Liz Nixon
    ## 85      THECR                      The Cracker Box                Liu Wong
    ## 86      TRAIH    Trail's Head Gourmet Provisioners          Helvetius Nagy
    ## 87      WHITC                 White Clover Markets          Karl Jablonski
    ## 88      GROSR                 GROSELLA-Restaurante          Manuel Pereira
    ## 89      HILAA                     HILARIÓN-Abastos        Carlos Hernández
    ## 90      LILAS                    LILA-Supermercado         Carlos González
    ## 91      LINOD                     LINO-Delicateses        Felipe Izquierdo
    ##                      ContactTitle
    ## 1                     Sales Agent
    ## 2                     Sales Agent
    ## 3            Sales Representative
    ## 4                   Sales Manager
    ## 5                   Sales Manager
    ## 6                     Sales Agent
    ## 7              Accounting Manager
    ## 8                 Sales Associate
    ## 9             Marketing Assistant
    ## 10                Sales Associate
    ## 11             Accounting Manager
    ## 12             Accounting Manager
    ## 13            Marketing Assistant
    ## 14          Assistant Sales Agent
    ## 15           Sales Representative
    ## 16                  Sales Manager
    ## 17             Accounting Manager
    ## 18            Marketing Assistant
    ## 19            Marketing Assistant
    ## 20                          Owner
    ## 21                  Sales Manager
    ## 22             Accounting Manager
    ## 23      Owner/Marketing Assistant
    ## 24              Marketing Manager
    ## 25                          Owner
    ## 26                          Owner
    ## 27          Assistant Sales Agent
    ## 28              Marketing Manager
    ## 29           Sales Representative
    ## 30                  Sales Manager
    ## 31                          Owner
    ## 32              Marketing Manager
    ## 33                    Sales Agent
    ## 34             Accounting Manager
    ## 35           Sales Representative
    ## 36           Sales Representative
    ## 37            Order Administrator
    ## 38              Marketing Manager
    ## 39                Sales Associate
    ## 40           Sales Representative
    ## 41            Marketing Assistant
    ## 42                          Owner
    ## 43             Accounting Manager
    ## 44              Marketing Manager
    ## 45           Sales Representative
    ## 46                Sales Associate
    ## 47           Sales Representative
    ## 48              Marketing Manager
    ## 49                Sales Associate
    ## 50                          Owner
    ## 51                          Owner
    ## 52              Marketing Manager
    ## 53           Sales Representative
    ## 54                          Owner
    ## 55                          Owner
    ## 56                          Owner
    ## 57                  Sales Manager
    ## 58           Sales Representative
    ## 59                          Owner
    ## 60             Accounting Manager
    ## 61              Marketing Manager
    ## 62                  Sales Manager
    ## 63             Accounting Manager
    ## 64            Order Administrator
    ## 65                          Owner
    ## 66                          Owner
    ## 67                  Sales Manager
    ## 68           Sales Representative
    ## 69           Sales Representative
    ## 70           Sales Representative
    ## 71                    Sales Agent
    ## 72              Marketing Manager
    ## 73                Sales Associate
    ## 74                  Sales Manager
    ## 75              Marketing Manager
    ## 76           Sales Representative
    ## 77              Marketing Manager
    ## 78                          Owner
    ## 79                  Sales Manager
    ## 80           Sales Representative
    ## 81 Assistant Sales Representative
    ## 82           Sales Representative
    ## 83                  Sales Manager
    ## 84              Marketing Manager
    ## 85            Marketing Assistant
    ## 86                Sales Associate
    ## 87                          Owner
    ## 88                          Owner
    ## 89           Sales Representative
    ## 90             Accounting Manager
    ## 91                          Owner
    ##                                           Address            City
    ## 1                                     Cerrito 333    Buenos Aires
    ## 2          Ing. Gustavo Moncada 8585\r\nPiso 20-A    Buenos Aires
    ## 3                          Av. del Libertador 900    Buenos Aires
    ## 4                                    Kirchgasse 6            Graz
    ## 5                                     Geislweg 14        Salzburg
    ## 6                             Rue Joseph-Bens 532       Bruxelles
    ## 7                            Boulevard Tirou, 255       Charleroi
    ## 8                            Av. dos Lusíadas, 23       São Paulo
    ## 9                                    Rua Orós, 92       São Paulo
    ## 10                                Av. Brasil, 442        Campinas
    ## 11                                Rua do Paço, 67  Rio de Janeiro
    ## 12                        Rua da Panificadora, 12  Rio de Janeiro
    ## 13                      Alameda dos Canàrios, 891       São Paulo
    ## 14                            Av. Copacabana, 267  Rio de Janeiro
    ## 15                        Av. Inês de Castro, 414       São Paulo
    ## 16                             Rua do Mercado, 12         Resende
    ## 17                             23 Tsawassen Blvd.       Tsawassen
    ## 18                                   1900 Oak St.       Vancouver
    ## 19                             43 rue St. Laurent        Montréal
    ## 20                                   Vinbæltet 34       København
    ## 21                                  Smagsløget 45           Århus
    ## 22                                    Torikatu 38            Oulu
    ## 23                                  Keskuskatu 45        Helsinki
    ## 24                               24, place Kléber      Strasbourg
    ## 25                           12, rue des Bouchers       Marseille
    ## 26                   67, rue des Cinquante Otages          Nantes
    ## 27                       184, chaussée de Tournai           Lille
    ## 28                                 54, rue Royale          Nantes
    ## 29                         67, avenue de l'Europe      Versailles
    ## 30                          1 rue Alsace-Lorraine        Toulouse
    ## 31                        265, boulevard Charonne           Paris
    ## 32                              25, rue Lauriston           Paris
    ## 33                             2, rue du Commerce            Lyon
    ## 34                             59 rue de l'Abbaye           Reims
    ## 35                                  Obere Str. 57          Berlin
    ## 36                                 Forsterstr. 57        Mannheim
    ## 37                                   Walserweg 21          Aachen
    ## 38                              Berliner Platz 43         München
    ## 39                                  Maubelstr. 90     Brandenburg
    ## 40                                   Magazinweg 7  Frankfurt a.M.
    ## 41                                    Heerstr. 22         Leipzig
    ## 42                             Mehrheimerstr. 369            Köln
    ## 43                               Taucherstraße 10       Cunewalde
    ## 44                                  Luisenstr. 48         Münster
    ## 45                              Adenauerallee 900       Stuttgart
    ## 46                               8 Johnstown Road            Cork
    ## 47                            Via Monte Bianco 34          Torino
    ## 48                        Via Ludovico il Moro 22         Bergamo
    ## 49                         Strada Provinciale 124   Reggio Emilia
    ## 50                  Avda. de la Constitución 2222     México D.F.
    ## 51                                Mataderos  2312     México D.F.
    ## 52                        Sierras de Granada 9993     México D.F.
    ## 53                       Calle Dr. Jorge Cash 321     México D.F.
    ## 54                               Avda. Azteca 123     México D.F.
    ## 55                         Erling Skakkes gate 78         Stavern
    ## 56                                ul. Filtrowa 68        Warszawa
    ## 57                         Jardim das rosas n. 32          Lisboa
    ## 58                         Estrada da saúde n. 58          Lisboa
    ## 59                                 C/ Araquil, 67          Madrid
    ## 60                             C/ Moralzarzal, 86          Madrid
    ## 61                         Rambla de Cataluña, 23       Barcelona
    ## 62                                  C/ Romero, 33         Sevilla
    ## 63                                    Gran Vía, 1          Madrid
    ## 64                                Berguvsvägen  8           Luleå
    ## 65                                   Åkergatan 24          Bräcke
    ## 66                                   Hauptstr. 29            Bern
    ## 67                              Grenzacherweg 237          Genève
    ## 68                                120 Hanover Sq.          London
    ## 69                              Fauntleroy Circus          London
    ## 70                Berkeley Gardens\r\n12  Brewery          London
    ## 71                                 35 King George          London
    ## 72                   Garden House\r\nCrowther Way           Cowes
    ## 73                South House\r\n300 Queensbridge          London
    ## 74                                90 Wadhurst Rd.          London
    ## 75                               2732 Baker Blvd.          Eugene
    ## 76              City Center Plaza\r\n516 Main St.           Elgin
    ## 77                           12 Orchestra Terrace     Walla Walla
    ## 78                         87 Polk St.\r\nSuite 5   San Francisco
    ## 79                             89 Chiaroscuro Rd.        Portland
    ## 80                                2743 Bering St.       Anchorage
    ## 81                                2817 Milton Dr.     Albuquerque
    ## 82                                187 Suffolk Ln.           Boise
    ## 83                                   P.O. Box 555          Lander
    ## 84                    89 Jefferson Way\r\nSuite 2        Portland
    ## 85                            55 Grizzly Peak Rd.           Butte
    ## 86                              722 DaVinci Blvd.        Kirkland
    ## 87                 305 - 14th Ave. S.\r\nSuite 3B         Seattle
    ## 88                      5ª Ave. Los Palos Grandes         Caracas
    ## 89     Carrera 22 con Ave. Carlos Soublette #8-35   San Cristóbal
    ## 90 Carrera 52 con Ave. Bolívar #65-98 Llano Largo    Barquisimeto
    ## 91                        Ave. 5 de Mayo Porlamar I. de Margarita
    ##           Region PostalCode     Country             Phone
    ## 1           <NA>       1010   Argentina      (1) 135-5555
    ## 2           <NA>       1010   Argentina      (1) 135-5333
    ## 3           <NA>       1010   Argentina      (1) 123-5555
    ## 4           <NA>       8010     Austria         7675-3425
    ## 5           <NA>       5020     Austria         6562-9722
    ## 6           <NA>     B-1180     Belgium    (02) 201 24 67
    ## 7           <NA>     B-6000     Belgium (071) 23 67 22 20
    ## 8             SP  05432-043      Brazil     (11) 555-7647
    ## 9             SP  05442-030      Brazil     (11) 555-9857
    ## 10            SP  04876-786      Brazil     (11) 555-9482
    ## 11            RJ  05454-876      Brazil     (21) 555-0091
    ## 12            RJ  02389-673      Brazil     (21) 555-4252
    ## 13            SP  05487-020      Brazil     (11) 555-1189
    ## 14            RJ  02389-890      Brazil     (21) 555-3412
    ## 15            SP  05634-030      Brazil     (11) 555-2167
    ## 16            SP  08737-363      Brazil     (14) 555-8122
    ## 17            BC    T2F 8M4      Canada    (604) 555-4729
    ## 18            BC    V3F 2K1      Canada    (604) 555-3392
    ## 19        Québec    H1J 1C3      Canada    (514) 555-8054
    ## 20          <NA>       1734     Denmark       31 12 34 56
    ## 21          <NA>       8200     Denmark       86 21 32 43
    ## 22          <NA>      90110     Finland        981-443655
    ## 23          <NA>      21240     Finland       90-224 8858
    ## 24          <NA>      67000      France       88.60.15.31
    ## 25          <NA>      13008      France       91.24.45.40
    ## 26          <NA>      44000      France       40.67.88.88
    ## 27          <NA>      59000      France       20.16.10.16
    ## 28          <NA>      44000      France       40.32.21.21
    ## 29          <NA>      78000      France       30.59.84.10
    ## 30          <NA>      31000      France       61.77.61.10
    ## 31          <NA>      75012      France   (1) 42.34.22.66
    ## 32          <NA>      75016      France   (1) 47.55.60.10
    ## 33          <NA>      69004      France       78.32.54.86
    ## 34          <NA>      51100      France       26.47.15.10
    ## 35          <NA>      12209     Germany       030-0074321
    ## 36          <NA>      68306     Germany        0621-08460
    ## 37          <NA>      52066     Germany       0241-039123
    ## 38          <NA>      80805     Germany       089-0877310
    ## 39          <NA>      14776     Germany        0555-09876
    ## 40          <NA>      60528     Germany       069-0245984
    ## 41          <NA>      04179     Germany       0342-023176
    ## 42          <NA>      50739     Germany      0221-0644327
    ## 43          <NA>      01307     Germany       0372-035188
    ## 44          <NA>      44087     Germany       0251-031259
    ## 45          <NA>      70563     Germany       0711-020361
    ## 46      Co. Cork       <NA>     Ireland          2967 542
    ## 47          <NA>      10100       Italy       011-4988260
    ## 48          <NA>      24100       Italy        035-640230
    ## 49          <NA>      42100       Italy       0522-556721
    ## 50          <NA>      05021      Mexico      (5) 555-4729
    ## 51          <NA>      05023      Mexico      (5) 555-3932
    ## 52          <NA>      05022      Mexico      (5) 555-3392
    ## 53          <NA>      05033      Mexico      (5) 552-3745
    ## 54          <NA>      05033      Mexico      (5) 555-2933
    ## 55          <NA>       4110      Norway       07-98 92 35
    ## 56          <NA>     01-012      Poland     (26) 642-7012
    ## 57          <NA>       1675    Portugal      (1) 354-2534
    ## 58          <NA>       1756    Portugal      (1) 356-5634
    ## 59          <NA>      28023       Spain    (91) 555 22 82
    ## 60          <NA>      28034       Spain    (91) 555 94 44
    ## 61          <NA>      08022       Spain     (93) 203 4560
    ## 62          <NA>      41101       Spain    (95) 555 82 82
    ## 63          <NA>      28001       Spain     (91) 745 6200
    ## 64          <NA>   S-958 22      Sweden     0921-12 34 65
    ## 65          <NA>   S-844 67      Sweden     0695-34 67 21
    ## 66          <NA>       3012 Switzerland       0452-076545
    ## 67          <NA>       1203 Switzerland       0897-034214
    ## 68          <NA>    WA1 1DP          UK    (171) 555-7788
    ## 69          <NA>    EC2 5NT          UK    (171) 555-1212
    ## 70          <NA>    WX1 6LT          UK    (171) 555-2282
    ## 71          <NA>    WX3 6FW          UK    (171) 555-0297
    ## 72 Isle of Wight   PO31 7PJ          UK    (198) 555-8888
    ## 73          <NA>    SW7 1RZ          UK    (171) 555-7733
    ## 74          <NA>   OX15 4NB          UK    (171) 555-1717
    ## 75            OR      97403         USA    (503) 555-7555
    ## 76            OR      97827         USA    (503) 555-6874
    ## 77            WA      99362         USA    (509) 555-7969
    ## 78            CA      94117         USA    (415) 555-5938
    ## 79            OR      97219         USA    (503) 555-9573
    ## 80            AK      99508         USA    (907) 555-7584
    ## 81            NM      87110         USA    (505) 555-5939
    ## 82            ID      83720         USA    (208) 555-8097
    ## 83            WY      82520         USA    (307) 555-4680
    ## 84            OR      97201         USA    (503) 555-3612
    ## 85            MT      59801         USA    (406) 555-5834
    ## 86            WA      98034         USA    (206) 555-8257
    ## 87            WA      98128         USA    (206) 555-4112
    ## 88            DF       1081   Venezuela      (2) 283-2951
    ## 89       Táchira       5022   Venezuela      (5) 555-1340
    ## 90          Lara       3508   Venezuela      (9) 331-6954
    ## 91 Nueva Esparta       4980   Venezuela      (8) 34-56-12
    ##                  Fax
    ## 1       (1) 135-4892
    ## 2       (1) 135-5535
    ## 3       (1) 123-5556
    ## 4          7675-3426
    ## 5          6562-9723
    ## 6     (02) 201 24 68
    ## 7  (071) 23 67 22 21
    ## 8               <NA>
    ## 9               <NA>
    ## 10              <NA>
    ## 11     (21) 555-8765
    ## 12     (21) 555-4545
    ## 13              <NA>
    ## 14              <NA>
    ## 15     (11) 555-2168
    ## 16              <NA>
    ## 17    (604) 555-3745
    ## 18    (604) 555-7293
    ## 19    (514) 555-8055
    ## 20       31 13 35 57
    ## 21       86 22 33 44
    ## 22        981-443655
    ## 23       90-224 8858
    ## 24       88.60.15.32
    ## 25       91.24.45.41
    ## 26       40.67.89.89
    ## 27       20.16.10.17
    ## 28       40.32.21.20
    ## 29       30.59.85.11
    ## 30       61.77.61.11
    ## 31   (1) 42.34.22.77
    ## 32   (1) 47.55.60.20
    ## 33       78.32.54.87
    ## 34       26.47.15.11
    ## 35       030-0076545
    ## 36        0621-08924
    ## 37       0241-059428
    ## 38       089-0877451
    ## 39              <NA>
    ## 40       069-0245874
    ## 41              <NA>
    ## 42      0221-0765721
    ## 43              <NA>
    ## 44       0251-035695
    ## 45       0711-035428
    ## 46         2967 3333
    ## 47       011-4988261
    ## 48        035-640231
    ## 49       0522-556722
    ## 50      (5) 555-3745
    ## 51              <NA>
    ## 52      (5) 555-7293
    ## 53      (5) 545-3745
    ## 54              <NA>
    ## 55       07-98 92 47
    ## 56     (26) 642-7012
    ## 57      (1) 354-2535
    ## 58              <NA>
    ## 59    (91) 555 91 99
    ## 60    (91) 555 55 93
    ## 61     (93) 203 4561
    ## 62              <NA>
    ## 63     (91) 745 6210
    ## 64     0921-12 34 67
    ## 65              <NA>
    ## 66              <NA>
    ## 67              <NA>
    ## 68    (171) 555-6750
    ## 69              <NA>
    ## 70    (171) 555-9199
    ## 71    (171) 555-3373
    ## 72              <NA>
    ## 73    (171) 555-2530
    ## 74    (171) 555-5646
    ## 75              <NA>
    ## 76    (503) 555-2376
    ## 77    (509) 555-6221
    ## 78              <NA>
    ## 79    (503) 555-9646
    ## 80    (907) 555-2880
    ## 81    (505) 555-3620
    ## 82              <NA>
    ## 83    (307) 555-6525
    ## 84              <NA>
    ## 85    (406) 555-8083
    ## 86    (206) 555-2174
    ## 87    (206) 555-4115
    ## 88      (2) 283-3397
    ## 89      (5) 555-1948
    ## 90      (9) 331-7256
    ## 91      (8) 34-93-93

SQL statement selects all customers from the "Customers" table, sorted DESCENDING by the "Country" column
=========================================================================================================

``` r
sqldf("SELECT * 
       FROM Customers
       ORDER BY Country DESC;")
```

    ##    CustomerID                          CompanyName             ContactName
    ## 1       GROSR                 GROSELLA-Restaurante          Manuel Pereira
    ## 2       HILAA                     HILARIÓN-Abastos        Carlos Hernández
    ## 3       LILAS                    LILA-Supermercado         Carlos González
    ## 4       LINOD                     LINO-Delicateses        Felipe Izquierdo
    ## 5       GREAL              Great Lakes Food Market           Howard Snyder
    ## 6       HUNGC           Hungry Coyote Import Store           Yoshi Latimer
    ## 7       LAZYK                 Lazy K Kountry Store              John Steel
    ## 8       LETSS                    Let's Stop N Shop            Jaime Yorres
    ## 9       LONEP             Lonesome Pine Restaurant             Fran Wilson
    ## 10      OLDWO               Old World Delicatessen           Rene Phillips
    ## 11      RATTC           Rattlesnake Canyon Grocery            Paula Wilson
    ## 12      SAVEA                   Save-a-lot Markets          Jose Pavarotti
    ## 13      SPLIR                Split Rail Beer & Ale      Art Braunschweiger
    ## 14      THEBI                       The Big Cheese               Liz Nixon
    ## 15      THECR                      The Cracker Box                Liu Wong
    ## 16      TRAIH    Trail's Head Gourmet Provisioners          Helvetius Nagy
    ## 17      WHITC                 White Clover Markets          Karl Jablonski
    ## 18      AROUT                      Around the Horn            Thomas Hardy
    ## 19      BSBEV                        B's Beverages       Victoria Ashworth
    ## 20      CONSH                Consolidated Holdings         Elizabeth Brown
    ## 21      EASTC                   Eastern Connection               Ann Devon
    ## 22      ISLAT                       Island Trading           Helen Bennett
    ## 23      NORTS                          North/South          Simon Crowther
    ## 24      SEVES                   Seven Seas Imports              Hari Kumar
    ## 25      CHOPS                    Chop-suey Chinese               Yang Wang
    ## 26      RICSU                   Richter Supermarkt            Michael Holz
    ## 27      BERGS                   Berglunds snabbköp      Christina Berglund
    ## 28      FOLKO                       Folk och fä HB           Maria Larsson
    ## 29      BOLID            Bólido Comidas preparadas           Martín Sommer
    ## 30      FISSA FISSA Fabrica Inter. Salchichas S.A.              Diego Roel
    ## 31      GALED               Galería del gastrónomo        Eduardo Saavedra
    ## 32      GODOS                  Godos Cocina Típica       José Pedro Freyre
    ## 33      ROMEY                     Romero y tomillo        Alejandra Camino
    ## 34      FURIB       Furia Bacalhau e Frutos do Mar          Lino Rodriguez
    ## 35      PRINI               Princesa Isabel Vinhos        Isabel de Castro
    ## 36      WOLZA                       Wolski  Zajazd Zbyszek Piestrzeniewicz
    ## 37      SANTG                        Santé Gourmet        Jonas Bergulfsen
    ## 38      ANATR   Ana Trujillo Emparedados y helados            Ana Trujillo
    ## 39      ANTON              Antonio Moreno Taquería          Antonio Moreno
    ## 40      CENTC           Centro comercial Moctezuma         Francisco Chang
    ## 41      PERIC            Pericles Comidas clásicas     Guillermo Fernández
    ## 42      TORTU                  Tortuga Restaurante    Miguel Angel Paolino
    ## 43      FRANS                       Franchi S.p.A.           Paolo Accorti
    ## 44      MAGAA         Magazzini Alimentari Riuniti        Giovanni Rovelli
    ## 45      REGGC                   Reggiani Caseifici         Maurizio Moroni
    ## 46      HUNGO         Hungry Owl All-Night Grocers        Patricia McKenna
    ## 47      ALFKI                  Alfreds Futterkiste            Maria Anders
    ## 48      BLAUS              Blauer See Delikatessen              Hanna Moos
    ## 49      DRACD             Drachenblut Delikatessen            Sven Ottlieb
    ## 50      FRANK                       Frankenversand           Peter Franken
    ## 51      KOENE                      Königlich Essen           Philip Cramer
    ## 52      LEHMS                  Lehmanns Marktstand          Renate Messner
    ## 53      MORGK               Morgenstern Gesundkost         Alexander Feuer
    ## 54      OTTIK                   Ottilies Käseladen     Henriette Pfalzheim
    ## 55      QUICK                           QUICK-Stop             Horst Kloss
    ## 56      TOMSP                   Toms Spezialitäten           Karin Josephs
    ## 57      WANDK                    Die Wandernde Kuh             Rita Müller
    ## 58      BLONP                 Blondel père et fils      Frédérique Citeaux
    ## 59      BONAP                             Bon app'        Laurence Lebihan
    ## 60      DUMON                      Du monde entier          Janine Labrune
    ## 61      FOLIG                    Folies gourmandes           Martine Rancé
    ## 62      FRANR                  France restauration          Carine Schmitt
    ## 63      LACOR                 La corne d'abondance           Daniel Tonini
    ## 64      LAMAI                     La maison d'Asie          Annette Roulet
    ## 65      PARIS                    Paris spécialités          Marie Bertrand
    ## 66      SPECD                 Spécialités du monde       Dominique Perrier
    ## 67      VICTE                 Victuailles en stock            Mary Saveley
    ## 68      VINET            Vins et alcools Chevalier            Paul Henriot
    ## 69      WARTH                       Wartian Herkku        Pirkko Koskitalo
    ## 70      WILMK                          Wilman Kala         Matti Karttunen
    ## 71      SIMOB                        Simons bistro          Jytte Petersen
    ## 72      VAFFE                         Vaffeljernet             Palle Ibsen
    ## 73      BOTTM                Bottom-Dollar Markets       Elizabeth Lincoln
    ## 74      LAUGB        Laughing Bacchus Wine Cellars         Yoshi Tannamuri
    ## 75      MEREP                       Mère Paillarde          Jean Fresnière
    ## 76      COMMI                     Comércio Mineiro            Pedro Afonso
    ## 77      FAMIA                   Familia Arquibaldo               Aria Cruz
    ## 78      GOURL                  Gourmet Lanchonetes           André Fonseca
    ## 79      HANAR                        Hanari Carnes            Mario Pontes
    ## 80      QUEDE                          Que Delícia        Bernardo Batista
    ## 81      QUEEN                        Queen Cozinha          Lúcia Carvalho
    ## 82      RICAR                   Ricardo Adocicados          Janete Limeira
    ## 83      TRADH               Tradição Hipermercados       Anabela Domingues
    ## 84      WELLI               Wellington Importadora           Paula Parente
    ## 85      MAISD                         Maison Dewey         Catherine Dewey
    ## 86      SUPRD                     Suprêmes délices        Pascale Cartrain
    ## 87      ERNSH                         Ernst Handel           Roland Mendel
    ## 88      PICCO                     Piccolo und mehr             Georg Pipps
    ## 89      CACTU           Cactus Comidas para llevar        Patricio Simpson
    ## 90      OCEAN               Océano Atlántico Ltda.          Yvonne Moncada
    ## 91      RANCH                        Rancho grande        Sergio Gutiérrez
    ##                      ContactTitle
    ## 1                           Owner
    ## 2            Sales Representative
    ## 3              Accounting Manager
    ## 4                           Owner
    ## 5               Marketing Manager
    ## 6            Sales Representative
    ## 7               Marketing Manager
    ## 8                           Owner
    ## 9                   Sales Manager
    ## 10           Sales Representative
    ## 11 Assistant Sales Representative
    ## 12           Sales Representative
    ## 13                  Sales Manager
    ## 14              Marketing Manager
    ## 15            Marketing Assistant
    ## 16                Sales Associate
    ## 17                          Owner
    ## 18           Sales Representative
    ## 19           Sales Representative
    ## 20           Sales Representative
    ## 21                    Sales Agent
    ## 22              Marketing Manager
    ## 23                Sales Associate
    ## 24                  Sales Manager
    ## 25                          Owner
    ## 26                  Sales Manager
    ## 27            Order Administrator
    ## 28                          Owner
    ## 29                          Owner
    ## 30             Accounting Manager
    ## 31              Marketing Manager
    ## 32                  Sales Manager
    ## 33             Accounting Manager
    ## 34                  Sales Manager
    ## 35           Sales Representative
    ## 36                          Owner
    ## 37                          Owner
    ## 38                          Owner
    ## 39                          Owner
    ## 40              Marketing Manager
    ## 41           Sales Representative
    ## 42                          Owner
    ## 43           Sales Representative
    ## 44              Marketing Manager
    ## 45                Sales Associate
    ## 46                Sales Associate
    ## 47           Sales Representative
    ## 48           Sales Representative
    ## 49            Order Administrator
    ## 50              Marketing Manager
    ## 51                Sales Associate
    ## 52           Sales Representative
    ## 53            Marketing Assistant
    ## 54                          Owner
    ## 55             Accounting Manager
    ## 56              Marketing Manager
    ## 57           Sales Representative
    ## 58              Marketing Manager
    ## 59                          Owner
    ## 60                          Owner
    ## 61          Assistant Sales Agent
    ## 62              Marketing Manager
    ## 63           Sales Representative
    ## 64                  Sales Manager
    ## 65                          Owner
    ## 66              Marketing Manager
    ## 67                    Sales Agent
    ## 68             Accounting Manager
    ## 69             Accounting Manager
    ## 70      Owner/Marketing Assistant
    ## 71                          Owner
    ## 72                  Sales Manager
    ## 73             Accounting Manager
    ## 74            Marketing Assistant
    ## 75            Marketing Assistant
    ## 76                Sales Associate
    ## 77            Marketing Assistant
    ## 78                Sales Associate
    ## 79             Accounting Manager
    ## 80             Accounting Manager
    ## 81            Marketing Assistant
    ## 82          Assistant Sales Agent
    ## 83           Sales Representative
    ## 84                  Sales Manager
    ## 85                    Sales Agent
    ## 86             Accounting Manager
    ## 87                  Sales Manager
    ## 88                  Sales Manager
    ## 89                    Sales Agent
    ## 90                    Sales Agent
    ## 91           Sales Representative
    ##                                           Address            City
    ## 1                       5ª Ave. Los Palos Grandes         Caracas
    ## 2      Carrera 22 con Ave. Carlos Soublette #8-35   San Cristóbal
    ## 3  Carrera 52 con Ave. Bolívar #65-98 Llano Largo    Barquisimeto
    ## 4                         Ave. 5 de Mayo Porlamar I. de Margarita
    ## 5                                2732 Baker Blvd.          Eugene
    ## 6               City Center Plaza\r\n516 Main St.           Elgin
    ## 7                            12 Orchestra Terrace     Walla Walla
    ## 8                          87 Polk St.\r\nSuite 5   San Francisco
    ## 9                              89 Chiaroscuro Rd.        Portland
    ## 10                                2743 Bering St.       Anchorage
    ## 11                                2817 Milton Dr.     Albuquerque
    ## 12                                187 Suffolk Ln.           Boise
    ## 13                                   P.O. Box 555          Lander
    ## 14                    89 Jefferson Way\r\nSuite 2        Portland
    ## 15                            55 Grizzly Peak Rd.           Butte
    ## 16                              722 DaVinci Blvd.        Kirkland
    ## 17                 305 - 14th Ave. S.\r\nSuite 3B         Seattle
    ## 18                                120 Hanover Sq.          London
    ## 19                              Fauntleroy Circus          London
    ## 20                Berkeley Gardens\r\n12  Brewery          London
    ## 21                                 35 King George          London
    ## 22                   Garden House\r\nCrowther Way           Cowes
    ## 23                South House\r\n300 Queensbridge          London
    ## 24                                90 Wadhurst Rd.          London
    ## 25                                   Hauptstr. 29            Bern
    ## 26                              Grenzacherweg 237          Genève
    ## 27                                Berguvsvägen  8           Luleå
    ## 28                                   Åkergatan 24          Bräcke
    ## 29                                 C/ Araquil, 67          Madrid
    ## 30                             C/ Moralzarzal, 86          Madrid
    ## 31                         Rambla de Cataluña, 23       Barcelona
    ## 32                                  C/ Romero, 33         Sevilla
    ## 33                                    Gran Vía, 1          Madrid
    ## 34                         Jardim das rosas n. 32          Lisboa
    ## 35                         Estrada da saúde n. 58          Lisboa
    ## 36                                ul. Filtrowa 68        Warszawa
    ## 37                         Erling Skakkes gate 78         Stavern
    ## 38                  Avda. de la Constitución 2222     México D.F.
    ## 39                                Mataderos  2312     México D.F.
    ## 40                        Sierras de Granada 9993     México D.F.
    ## 41                       Calle Dr. Jorge Cash 321     México D.F.
    ## 42                               Avda. Azteca 123     México D.F.
    ## 43                            Via Monte Bianco 34          Torino
    ## 44                        Via Ludovico il Moro 22         Bergamo
    ## 45                         Strada Provinciale 124   Reggio Emilia
    ## 46                               8 Johnstown Road            Cork
    ## 47                                  Obere Str. 57          Berlin
    ## 48                                 Forsterstr. 57        Mannheim
    ## 49                                   Walserweg 21          Aachen
    ## 50                              Berliner Platz 43         München
    ## 51                                  Maubelstr. 90     Brandenburg
    ## 52                                   Magazinweg 7  Frankfurt a.M.
    ## 53                                    Heerstr. 22         Leipzig
    ## 54                             Mehrheimerstr. 369            Köln
    ## 55                               Taucherstraße 10       Cunewalde
    ## 56                                  Luisenstr. 48         Münster
    ## 57                              Adenauerallee 900       Stuttgart
    ## 58                               24, place Kléber      Strasbourg
    ## 59                           12, rue des Bouchers       Marseille
    ## 60                   67, rue des Cinquante Otages          Nantes
    ## 61                       184, chaussée de Tournai           Lille
    ## 62                                 54, rue Royale          Nantes
    ## 63                         67, avenue de l'Europe      Versailles
    ## 64                          1 rue Alsace-Lorraine        Toulouse
    ## 65                        265, boulevard Charonne           Paris
    ## 66                              25, rue Lauriston           Paris
    ## 67                             2, rue du Commerce            Lyon
    ## 68                             59 rue de l'Abbaye           Reims
    ## 69                                    Torikatu 38            Oulu
    ## 70                                  Keskuskatu 45        Helsinki
    ## 71                                   Vinbæltet 34       København
    ## 72                                  Smagsløget 45           Århus
    ## 73                             23 Tsawassen Blvd.       Tsawassen
    ## 74                                   1900 Oak St.       Vancouver
    ## 75                             43 rue St. Laurent        Montréal
    ## 76                           Av. dos Lusíadas, 23       São Paulo
    ## 77                                   Rua Orós, 92       São Paulo
    ## 78                                Av. Brasil, 442        Campinas
    ## 79                                Rua do Paço, 67  Rio de Janeiro
    ## 80                        Rua da Panificadora, 12  Rio de Janeiro
    ## 81                      Alameda dos Canàrios, 891       São Paulo
    ## 82                            Av. Copacabana, 267  Rio de Janeiro
    ## 83                        Av. Inês de Castro, 414       São Paulo
    ## 84                             Rua do Mercado, 12         Resende
    ## 85                            Rue Joseph-Bens 532       Bruxelles
    ## 86                           Boulevard Tirou, 255       Charleroi
    ## 87                                   Kirchgasse 6            Graz
    ## 88                                    Geislweg 14        Salzburg
    ## 89                                    Cerrito 333    Buenos Aires
    ## 90         Ing. Gustavo Moncada 8585\r\nPiso 20-A    Buenos Aires
    ## 91                         Av. del Libertador 900    Buenos Aires
    ##           Region PostalCode     Country             Phone
    ## 1             DF       1081   Venezuela      (2) 283-2951
    ## 2        Táchira       5022   Venezuela      (5) 555-1340
    ## 3           Lara       3508   Venezuela      (9) 331-6954
    ## 4  Nueva Esparta       4980   Venezuela      (8) 34-56-12
    ## 5             OR      97403         USA    (503) 555-7555
    ## 6             OR      97827         USA    (503) 555-6874
    ## 7             WA      99362         USA    (509) 555-7969
    ## 8             CA      94117         USA    (415) 555-5938
    ## 9             OR      97219         USA    (503) 555-9573
    ## 10            AK      99508         USA    (907) 555-7584
    ## 11            NM      87110         USA    (505) 555-5939
    ## 12            ID      83720         USA    (208) 555-8097
    ## 13            WY      82520         USA    (307) 555-4680
    ## 14            OR      97201         USA    (503) 555-3612
    ## 15            MT      59801         USA    (406) 555-5834
    ## 16            WA      98034         USA    (206) 555-8257
    ## 17            WA      98128         USA    (206) 555-4112
    ## 18          <NA>    WA1 1DP          UK    (171) 555-7788
    ## 19          <NA>    EC2 5NT          UK    (171) 555-1212
    ## 20          <NA>    WX1 6LT          UK    (171) 555-2282
    ## 21          <NA>    WX3 6FW          UK    (171) 555-0297
    ## 22 Isle of Wight   PO31 7PJ          UK    (198) 555-8888
    ## 23          <NA>    SW7 1RZ          UK    (171) 555-7733
    ## 24          <NA>   OX15 4NB          UK    (171) 555-1717
    ## 25          <NA>       3012 Switzerland       0452-076545
    ## 26          <NA>       1203 Switzerland       0897-034214
    ## 27          <NA>   S-958 22      Sweden     0921-12 34 65
    ## 28          <NA>   S-844 67      Sweden     0695-34 67 21
    ## 29          <NA>      28023       Spain    (91) 555 22 82
    ## 30          <NA>      28034       Spain    (91) 555 94 44
    ## 31          <NA>      08022       Spain     (93) 203 4560
    ## 32          <NA>      41101       Spain    (95) 555 82 82
    ## 33          <NA>      28001       Spain     (91) 745 6200
    ## 34          <NA>       1675    Portugal      (1) 354-2534
    ## 35          <NA>       1756    Portugal      (1) 356-5634
    ## 36          <NA>     01-012      Poland     (26) 642-7012
    ## 37          <NA>       4110      Norway       07-98 92 35
    ## 38          <NA>      05021      Mexico      (5) 555-4729
    ## 39          <NA>      05023      Mexico      (5) 555-3932
    ## 40          <NA>      05022      Mexico      (5) 555-3392
    ## 41          <NA>      05033      Mexico      (5) 552-3745
    ## 42          <NA>      05033      Mexico      (5) 555-2933
    ## 43          <NA>      10100       Italy       011-4988260
    ## 44          <NA>      24100       Italy        035-640230
    ## 45          <NA>      42100       Italy       0522-556721
    ## 46      Co. Cork       <NA>     Ireland          2967 542
    ## 47          <NA>      12209     Germany       030-0074321
    ## 48          <NA>      68306     Germany        0621-08460
    ## 49          <NA>      52066     Germany       0241-039123
    ## 50          <NA>      80805     Germany       089-0877310
    ## 51          <NA>      14776     Germany        0555-09876
    ## 52          <NA>      60528     Germany       069-0245984
    ## 53          <NA>      04179     Germany       0342-023176
    ## 54          <NA>      50739     Germany      0221-0644327
    ## 55          <NA>      01307     Germany       0372-035188
    ## 56          <NA>      44087     Germany       0251-031259
    ## 57          <NA>      70563     Germany       0711-020361
    ## 58          <NA>      67000      France       88.60.15.31
    ## 59          <NA>      13008      France       91.24.45.40
    ## 60          <NA>      44000      France       40.67.88.88
    ## 61          <NA>      59000      France       20.16.10.16
    ## 62          <NA>      44000      France       40.32.21.21
    ## 63          <NA>      78000      France       30.59.84.10
    ## 64          <NA>      31000      France       61.77.61.10
    ## 65          <NA>      75012      France   (1) 42.34.22.66
    ## 66          <NA>      75016      France   (1) 47.55.60.10
    ## 67          <NA>      69004      France       78.32.54.86
    ## 68          <NA>      51100      France       26.47.15.10
    ## 69          <NA>      90110     Finland        981-443655
    ## 70          <NA>      21240     Finland       90-224 8858
    ## 71          <NA>       1734     Denmark       31 12 34 56
    ## 72          <NA>       8200     Denmark       86 21 32 43
    ## 73            BC    T2F 8M4      Canada    (604) 555-4729
    ## 74            BC    V3F 2K1      Canada    (604) 555-3392
    ## 75        Québec    H1J 1C3      Canada    (514) 555-8054
    ## 76            SP  05432-043      Brazil     (11) 555-7647
    ## 77            SP  05442-030      Brazil     (11) 555-9857
    ## 78            SP  04876-786      Brazil     (11) 555-9482
    ## 79            RJ  05454-876      Brazil     (21) 555-0091
    ## 80            RJ  02389-673      Brazil     (21) 555-4252
    ## 81            SP  05487-020      Brazil     (11) 555-1189
    ## 82            RJ  02389-890      Brazil     (21) 555-3412
    ## 83            SP  05634-030      Brazil     (11) 555-2167
    ## 84            SP  08737-363      Brazil     (14) 555-8122
    ## 85          <NA>     B-1180     Belgium    (02) 201 24 67
    ## 86          <NA>     B-6000     Belgium (071) 23 67 22 20
    ## 87          <NA>       8010     Austria         7675-3425
    ## 88          <NA>       5020     Austria         6562-9722
    ## 89          <NA>       1010   Argentina      (1) 135-5555
    ## 90          <NA>       1010   Argentina      (1) 135-5333
    ## 91          <NA>       1010   Argentina      (1) 123-5555
    ##                  Fax
    ## 1       (2) 283-3397
    ## 2       (5) 555-1948
    ## 3       (9) 331-7256
    ## 4       (8) 34-93-93
    ## 5               <NA>
    ## 6     (503) 555-2376
    ## 7     (509) 555-6221
    ## 8               <NA>
    ## 9     (503) 555-9646
    ## 10    (907) 555-2880
    ## 11    (505) 555-3620
    ## 12              <NA>
    ## 13    (307) 555-6525
    ## 14              <NA>
    ## 15    (406) 555-8083
    ## 16    (206) 555-2174
    ## 17    (206) 555-4115
    ## 18    (171) 555-6750
    ## 19              <NA>
    ## 20    (171) 555-9199
    ## 21    (171) 555-3373
    ## 22              <NA>
    ## 23    (171) 555-2530
    ## 24    (171) 555-5646
    ## 25              <NA>
    ## 26              <NA>
    ## 27     0921-12 34 67
    ## 28              <NA>
    ## 29    (91) 555 91 99
    ## 30    (91) 555 55 93
    ## 31     (93) 203 4561
    ## 32              <NA>
    ## 33     (91) 745 6210
    ## 34      (1) 354-2535
    ## 35              <NA>
    ## 36     (26) 642-7012
    ## 37       07-98 92 47
    ## 38      (5) 555-3745
    ## 39              <NA>
    ## 40      (5) 555-7293
    ## 41      (5) 545-3745
    ## 42              <NA>
    ## 43       011-4988261
    ## 44        035-640231
    ## 45       0522-556722
    ## 46         2967 3333
    ## 47       030-0076545
    ## 48        0621-08924
    ## 49       0241-059428
    ## 50       089-0877451
    ## 51              <NA>
    ## 52       069-0245874
    ## 53              <NA>
    ## 54      0221-0765721
    ## 55              <NA>
    ## 56       0251-035695
    ## 57       0711-035428
    ## 58       88.60.15.32
    ## 59       91.24.45.41
    ## 60       40.67.89.89
    ## 61       20.16.10.17
    ## 62       40.32.21.20
    ## 63       30.59.85.11
    ## 64       61.77.61.11
    ## 65   (1) 42.34.22.77
    ## 66   (1) 47.55.60.20
    ## 67       78.32.54.87
    ## 68       26.47.15.11
    ## 69        981-443655
    ## 70       90-224 8858
    ## 71       31 13 35 57
    ## 72       86 22 33 44
    ## 73    (604) 555-3745
    ## 74    (604) 555-7293
    ## 75    (514) 555-8055
    ## 76              <NA>
    ## 77              <NA>
    ## 78              <NA>
    ## 79     (21) 555-8765
    ## 80     (21) 555-4545
    ## 81              <NA>
    ## 82              <NA>
    ## 83     (11) 555-2168
    ## 84              <NA>
    ## 85    (02) 201 24 68
    ## 86 (071) 23 67 22 21
    ## 87         7675-3426
    ## 88         6562-9723
    ## 89      (1) 135-4892
    ## 90      (1) 135-5535
    ## 91      (1) 123-5556

SQL statement selects all customers from the "Customers" table, sorted by the "Country" and the "CustomerName" column
=====================================================================================================================

``` r
sqldf("SELECT *
       FROM Customers
       ORDER BY Country,CompanyName;")
```

    ##    CustomerID                          CompanyName             ContactName
    ## 1       CACTU           Cactus Comidas para llevar        Patricio Simpson
    ## 2       OCEAN               Océano Atlántico Ltda.          Yvonne Moncada
    ## 3       RANCH                        Rancho grande        Sergio Gutiérrez
    ## 4       ERNSH                         Ernst Handel           Roland Mendel
    ## 5       PICCO                     Piccolo und mehr             Georg Pipps
    ## 6       MAISD                         Maison Dewey         Catherine Dewey
    ## 7       SUPRD                     Suprêmes délices        Pascale Cartrain
    ## 8       COMMI                     Comércio Mineiro            Pedro Afonso
    ## 9       FAMIA                   Familia Arquibaldo               Aria Cruz
    ## 10      GOURL                  Gourmet Lanchonetes           André Fonseca
    ## 11      HANAR                        Hanari Carnes            Mario Pontes
    ## 12      QUEDE                          Que Delícia        Bernardo Batista
    ## 13      QUEEN                        Queen Cozinha          Lúcia Carvalho
    ## 14      RICAR                   Ricardo Adocicados          Janete Limeira
    ## 15      TRADH               Tradição Hipermercados       Anabela Domingues
    ## 16      WELLI               Wellington Importadora           Paula Parente
    ## 17      BOTTM                Bottom-Dollar Markets       Elizabeth Lincoln
    ## 18      LAUGB        Laughing Bacchus Wine Cellars         Yoshi Tannamuri
    ## 19      MEREP                       Mère Paillarde          Jean Fresnière
    ## 20      SIMOB                        Simons bistro          Jytte Petersen
    ## 21      VAFFE                         Vaffeljernet             Palle Ibsen
    ## 22      WARTH                       Wartian Herkku        Pirkko Koskitalo
    ## 23      WILMK                          Wilman Kala         Matti Karttunen
    ## 24      BLONP                 Blondel père et fils      Frédérique Citeaux
    ## 25      BONAP                             Bon app'        Laurence Lebihan
    ## 26      DUMON                      Du monde entier          Janine Labrune
    ## 27      FOLIG                    Folies gourmandes           Martine Rancé
    ## 28      FRANR                  France restauration          Carine Schmitt
    ## 29      LACOR                 La corne d'abondance           Daniel Tonini
    ## 30      LAMAI                     La maison d'Asie          Annette Roulet
    ## 31      PARIS                    Paris spécialités          Marie Bertrand
    ## 32      SPECD                 Spécialités du monde       Dominique Perrier
    ## 33      VICTE                 Victuailles en stock            Mary Saveley
    ## 34      VINET            Vins et alcools Chevalier            Paul Henriot
    ## 35      ALFKI                  Alfreds Futterkiste            Maria Anders
    ## 36      BLAUS              Blauer See Delikatessen              Hanna Moos
    ## 37      WANDK                    Die Wandernde Kuh             Rita Müller
    ## 38      DRACD             Drachenblut Delikatessen            Sven Ottlieb
    ## 39      FRANK                       Frankenversand           Peter Franken
    ## 40      KOENE                      Königlich Essen           Philip Cramer
    ## 41      LEHMS                  Lehmanns Marktstand          Renate Messner
    ## 42      MORGK               Morgenstern Gesundkost         Alexander Feuer
    ## 43      OTTIK                   Ottilies Käseladen     Henriette Pfalzheim
    ## 44      QUICK                           QUICK-Stop             Horst Kloss
    ## 45      TOMSP                   Toms Spezialitäten           Karin Josephs
    ## 46      HUNGO         Hungry Owl All-Night Grocers        Patricia McKenna
    ## 47      FRANS                       Franchi S.p.A.           Paolo Accorti
    ## 48      MAGAA         Magazzini Alimentari Riuniti        Giovanni Rovelli
    ## 49      REGGC                   Reggiani Caseifici         Maurizio Moroni
    ## 50      ANATR   Ana Trujillo Emparedados y helados            Ana Trujillo
    ## 51      ANTON              Antonio Moreno Taquería          Antonio Moreno
    ## 52      CENTC           Centro comercial Moctezuma         Francisco Chang
    ## 53      PERIC            Pericles Comidas clásicas     Guillermo Fernández
    ## 54      TORTU                  Tortuga Restaurante    Miguel Angel Paolino
    ## 55      SANTG                        Santé Gourmet        Jonas Bergulfsen
    ## 56      WOLZA                       Wolski  Zajazd Zbyszek Piestrzeniewicz
    ## 57      FURIB       Furia Bacalhau e Frutos do Mar          Lino Rodriguez
    ## 58      PRINI               Princesa Isabel Vinhos        Isabel de Castro
    ## 59      BOLID            Bólido Comidas preparadas           Martín Sommer
    ## 60      FISSA FISSA Fabrica Inter. Salchichas S.A.              Diego Roel
    ## 61      GALED               Galería del gastrónomo        Eduardo Saavedra
    ## 62      GODOS                  Godos Cocina Típica       José Pedro Freyre
    ## 63      ROMEY                     Romero y tomillo        Alejandra Camino
    ## 64      BERGS                   Berglunds snabbköp      Christina Berglund
    ## 65      FOLKO                       Folk och fä HB           Maria Larsson
    ## 66      CHOPS                    Chop-suey Chinese               Yang Wang
    ## 67      RICSU                   Richter Supermarkt            Michael Holz
    ## 68      AROUT                      Around the Horn            Thomas Hardy
    ## 69      BSBEV                        B's Beverages       Victoria Ashworth
    ## 70      CONSH                Consolidated Holdings         Elizabeth Brown
    ## 71      EASTC                   Eastern Connection               Ann Devon
    ## 72      ISLAT                       Island Trading           Helen Bennett
    ## 73      NORTS                          North/South          Simon Crowther
    ## 74      SEVES                   Seven Seas Imports              Hari Kumar
    ## 75      GREAL              Great Lakes Food Market           Howard Snyder
    ## 76      HUNGC           Hungry Coyote Import Store           Yoshi Latimer
    ## 77      LAZYK                 Lazy K Kountry Store              John Steel
    ## 78      LETSS                    Let's Stop N Shop            Jaime Yorres
    ## 79      LONEP             Lonesome Pine Restaurant             Fran Wilson
    ## 80      OLDWO               Old World Delicatessen           Rene Phillips
    ## 81      RATTC           Rattlesnake Canyon Grocery            Paula Wilson
    ## 82      SAVEA                   Save-a-lot Markets          Jose Pavarotti
    ## 83      SPLIR                Split Rail Beer & Ale      Art Braunschweiger
    ## 84      THEBI                       The Big Cheese               Liz Nixon
    ## 85      THECR                      The Cracker Box                Liu Wong
    ## 86      TRAIH    Trail's Head Gourmet Provisioners          Helvetius Nagy
    ## 87      WHITC                 White Clover Markets          Karl Jablonski
    ## 88      GROSR                 GROSELLA-Restaurante          Manuel Pereira
    ## 89      HILAA                     HILARIÓN-Abastos        Carlos Hernández
    ## 90      LILAS                    LILA-Supermercado         Carlos González
    ## 91      LINOD                     LINO-Delicateses        Felipe Izquierdo
    ##                      ContactTitle
    ## 1                     Sales Agent
    ## 2                     Sales Agent
    ## 3            Sales Representative
    ## 4                   Sales Manager
    ## 5                   Sales Manager
    ## 6                     Sales Agent
    ## 7              Accounting Manager
    ## 8                 Sales Associate
    ## 9             Marketing Assistant
    ## 10                Sales Associate
    ## 11             Accounting Manager
    ## 12             Accounting Manager
    ## 13            Marketing Assistant
    ## 14          Assistant Sales Agent
    ## 15           Sales Representative
    ## 16                  Sales Manager
    ## 17             Accounting Manager
    ## 18            Marketing Assistant
    ## 19            Marketing Assistant
    ## 20                          Owner
    ## 21                  Sales Manager
    ## 22             Accounting Manager
    ## 23      Owner/Marketing Assistant
    ## 24              Marketing Manager
    ## 25                          Owner
    ## 26                          Owner
    ## 27          Assistant Sales Agent
    ## 28              Marketing Manager
    ## 29           Sales Representative
    ## 30                  Sales Manager
    ## 31                          Owner
    ## 32              Marketing Manager
    ## 33                    Sales Agent
    ## 34             Accounting Manager
    ## 35           Sales Representative
    ## 36           Sales Representative
    ## 37           Sales Representative
    ## 38            Order Administrator
    ## 39              Marketing Manager
    ## 40                Sales Associate
    ## 41           Sales Representative
    ## 42            Marketing Assistant
    ## 43                          Owner
    ## 44             Accounting Manager
    ## 45              Marketing Manager
    ## 46                Sales Associate
    ## 47           Sales Representative
    ## 48              Marketing Manager
    ## 49                Sales Associate
    ## 50                          Owner
    ## 51                          Owner
    ## 52              Marketing Manager
    ## 53           Sales Representative
    ## 54                          Owner
    ## 55                          Owner
    ## 56                          Owner
    ## 57                  Sales Manager
    ## 58           Sales Representative
    ## 59                          Owner
    ## 60             Accounting Manager
    ## 61              Marketing Manager
    ## 62                  Sales Manager
    ## 63             Accounting Manager
    ## 64            Order Administrator
    ## 65                          Owner
    ## 66                          Owner
    ## 67                  Sales Manager
    ## 68           Sales Representative
    ## 69           Sales Representative
    ## 70           Sales Representative
    ## 71                    Sales Agent
    ## 72              Marketing Manager
    ## 73                Sales Associate
    ## 74                  Sales Manager
    ## 75              Marketing Manager
    ## 76           Sales Representative
    ## 77              Marketing Manager
    ## 78                          Owner
    ## 79                  Sales Manager
    ## 80           Sales Representative
    ## 81 Assistant Sales Representative
    ## 82           Sales Representative
    ## 83                  Sales Manager
    ## 84              Marketing Manager
    ## 85            Marketing Assistant
    ## 86                Sales Associate
    ## 87                          Owner
    ## 88                          Owner
    ## 89           Sales Representative
    ## 90             Accounting Manager
    ## 91                          Owner
    ##                                           Address            City
    ## 1                                     Cerrito 333    Buenos Aires
    ## 2          Ing. Gustavo Moncada 8585\r\nPiso 20-A    Buenos Aires
    ## 3                          Av. del Libertador 900    Buenos Aires
    ## 4                                    Kirchgasse 6            Graz
    ## 5                                     Geislweg 14        Salzburg
    ## 6                             Rue Joseph-Bens 532       Bruxelles
    ## 7                            Boulevard Tirou, 255       Charleroi
    ## 8                            Av. dos Lusíadas, 23       São Paulo
    ## 9                                    Rua Orós, 92       São Paulo
    ## 10                                Av. Brasil, 442        Campinas
    ## 11                                Rua do Paço, 67  Rio de Janeiro
    ## 12                        Rua da Panificadora, 12  Rio de Janeiro
    ## 13                      Alameda dos Canàrios, 891       São Paulo
    ## 14                            Av. Copacabana, 267  Rio de Janeiro
    ## 15                        Av. Inês de Castro, 414       São Paulo
    ## 16                             Rua do Mercado, 12         Resende
    ## 17                             23 Tsawassen Blvd.       Tsawassen
    ## 18                                   1900 Oak St.       Vancouver
    ## 19                             43 rue St. Laurent        Montréal
    ## 20                                   Vinbæltet 34       København
    ## 21                                  Smagsløget 45           Århus
    ## 22                                    Torikatu 38            Oulu
    ## 23                                  Keskuskatu 45        Helsinki
    ## 24                               24, place Kléber      Strasbourg
    ## 25                           12, rue des Bouchers       Marseille
    ## 26                   67, rue des Cinquante Otages          Nantes
    ## 27                       184, chaussée de Tournai           Lille
    ## 28                                 54, rue Royale          Nantes
    ## 29                         67, avenue de l'Europe      Versailles
    ## 30                          1 rue Alsace-Lorraine        Toulouse
    ## 31                        265, boulevard Charonne           Paris
    ## 32                              25, rue Lauriston           Paris
    ## 33                             2, rue du Commerce            Lyon
    ## 34                             59 rue de l'Abbaye           Reims
    ## 35                                  Obere Str. 57          Berlin
    ## 36                                 Forsterstr. 57        Mannheim
    ## 37                              Adenauerallee 900       Stuttgart
    ## 38                                   Walserweg 21          Aachen
    ## 39                              Berliner Platz 43         München
    ## 40                                  Maubelstr. 90     Brandenburg
    ## 41                                   Magazinweg 7  Frankfurt a.M.
    ## 42                                    Heerstr. 22         Leipzig
    ## 43                             Mehrheimerstr. 369            Köln
    ## 44                               Taucherstraße 10       Cunewalde
    ## 45                                  Luisenstr. 48         Münster
    ## 46                               8 Johnstown Road            Cork
    ## 47                            Via Monte Bianco 34          Torino
    ## 48                        Via Ludovico il Moro 22         Bergamo
    ## 49                         Strada Provinciale 124   Reggio Emilia
    ## 50                  Avda. de la Constitución 2222     México D.F.
    ## 51                                Mataderos  2312     México D.F.
    ## 52                        Sierras de Granada 9993     México D.F.
    ## 53                       Calle Dr. Jorge Cash 321     México D.F.
    ## 54                               Avda. Azteca 123     México D.F.
    ## 55                         Erling Skakkes gate 78         Stavern
    ## 56                                ul. Filtrowa 68        Warszawa
    ## 57                         Jardim das rosas n. 32          Lisboa
    ## 58                         Estrada da saúde n. 58          Lisboa
    ## 59                                 C/ Araquil, 67          Madrid
    ## 60                             C/ Moralzarzal, 86          Madrid
    ## 61                         Rambla de Cataluña, 23       Barcelona
    ## 62                                  C/ Romero, 33         Sevilla
    ## 63                                    Gran Vía, 1          Madrid
    ## 64                                Berguvsvägen  8           Luleå
    ## 65                                   Åkergatan 24          Bräcke
    ## 66                                   Hauptstr. 29            Bern
    ## 67                              Grenzacherweg 237          Genève
    ## 68                                120 Hanover Sq.          London
    ## 69                              Fauntleroy Circus          London
    ## 70                Berkeley Gardens\r\n12  Brewery          London
    ## 71                                 35 King George          London
    ## 72                   Garden House\r\nCrowther Way           Cowes
    ## 73                South House\r\n300 Queensbridge          London
    ## 74                                90 Wadhurst Rd.          London
    ## 75                               2732 Baker Blvd.          Eugene
    ## 76              City Center Plaza\r\n516 Main St.           Elgin
    ## 77                           12 Orchestra Terrace     Walla Walla
    ## 78                         87 Polk St.\r\nSuite 5   San Francisco
    ## 79                             89 Chiaroscuro Rd.        Portland
    ## 80                                2743 Bering St.       Anchorage
    ## 81                                2817 Milton Dr.     Albuquerque
    ## 82                                187 Suffolk Ln.           Boise
    ## 83                                   P.O. Box 555          Lander
    ## 84                    89 Jefferson Way\r\nSuite 2        Portland
    ## 85                            55 Grizzly Peak Rd.           Butte
    ## 86                              722 DaVinci Blvd.        Kirkland
    ## 87                 305 - 14th Ave. S.\r\nSuite 3B         Seattle
    ## 88                      5ª Ave. Los Palos Grandes         Caracas
    ## 89     Carrera 22 con Ave. Carlos Soublette #8-35   San Cristóbal
    ## 90 Carrera 52 con Ave. Bolívar #65-98 Llano Largo    Barquisimeto
    ## 91                        Ave. 5 de Mayo Porlamar I. de Margarita
    ##           Region PostalCode     Country             Phone
    ## 1           <NA>       1010   Argentina      (1) 135-5555
    ## 2           <NA>       1010   Argentina      (1) 135-5333
    ## 3           <NA>       1010   Argentina      (1) 123-5555
    ## 4           <NA>       8010     Austria         7675-3425
    ## 5           <NA>       5020     Austria         6562-9722
    ## 6           <NA>     B-1180     Belgium    (02) 201 24 67
    ## 7           <NA>     B-6000     Belgium (071) 23 67 22 20
    ## 8             SP  05432-043      Brazil     (11) 555-7647
    ## 9             SP  05442-030      Brazil     (11) 555-9857
    ## 10            SP  04876-786      Brazil     (11) 555-9482
    ## 11            RJ  05454-876      Brazil     (21) 555-0091
    ## 12            RJ  02389-673      Brazil     (21) 555-4252
    ## 13            SP  05487-020      Brazil     (11) 555-1189
    ## 14            RJ  02389-890      Brazil     (21) 555-3412
    ## 15            SP  05634-030      Brazil     (11) 555-2167
    ## 16            SP  08737-363      Brazil     (14) 555-8122
    ## 17            BC    T2F 8M4      Canada    (604) 555-4729
    ## 18            BC    V3F 2K1      Canada    (604) 555-3392
    ## 19        Québec    H1J 1C3      Canada    (514) 555-8054
    ## 20          <NA>       1734     Denmark       31 12 34 56
    ## 21          <NA>       8200     Denmark       86 21 32 43
    ## 22          <NA>      90110     Finland        981-443655
    ## 23          <NA>      21240     Finland       90-224 8858
    ## 24          <NA>      67000      France       88.60.15.31
    ## 25          <NA>      13008      France       91.24.45.40
    ## 26          <NA>      44000      France       40.67.88.88
    ## 27          <NA>      59000      France       20.16.10.16
    ## 28          <NA>      44000      France       40.32.21.21
    ## 29          <NA>      78000      France       30.59.84.10
    ## 30          <NA>      31000      France       61.77.61.10
    ## 31          <NA>      75012      France   (1) 42.34.22.66
    ## 32          <NA>      75016      France   (1) 47.55.60.10
    ## 33          <NA>      69004      France       78.32.54.86
    ## 34          <NA>      51100      France       26.47.15.10
    ## 35          <NA>      12209     Germany       030-0074321
    ## 36          <NA>      68306     Germany        0621-08460
    ## 37          <NA>      70563     Germany       0711-020361
    ## 38          <NA>      52066     Germany       0241-039123
    ## 39          <NA>      80805     Germany       089-0877310
    ## 40          <NA>      14776     Germany        0555-09876
    ## 41          <NA>      60528     Germany       069-0245984
    ## 42          <NA>      04179     Germany       0342-023176
    ## 43          <NA>      50739     Germany      0221-0644327
    ## 44          <NA>      01307     Germany       0372-035188
    ## 45          <NA>      44087     Germany       0251-031259
    ## 46      Co. Cork       <NA>     Ireland          2967 542
    ## 47          <NA>      10100       Italy       011-4988260
    ## 48          <NA>      24100       Italy        035-640230
    ## 49          <NA>      42100       Italy       0522-556721
    ## 50          <NA>      05021      Mexico      (5) 555-4729
    ## 51          <NA>      05023      Mexico      (5) 555-3932
    ## 52          <NA>      05022      Mexico      (5) 555-3392
    ## 53          <NA>      05033      Mexico      (5) 552-3745
    ## 54          <NA>      05033      Mexico      (5) 555-2933
    ## 55          <NA>       4110      Norway       07-98 92 35
    ## 56          <NA>     01-012      Poland     (26) 642-7012
    ## 57          <NA>       1675    Portugal      (1) 354-2534
    ## 58          <NA>       1756    Portugal      (1) 356-5634
    ## 59          <NA>      28023       Spain    (91) 555 22 82
    ## 60          <NA>      28034       Spain    (91) 555 94 44
    ## 61          <NA>      08022       Spain     (93) 203 4560
    ## 62          <NA>      41101       Spain    (95) 555 82 82
    ## 63          <NA>      28001       Spain     (91) 745 6200
    ## 64          <NA>   S-958 22      Sweden     0921-12 34 65
    ## 65          <NA>   S-844 67      Sweden     0695-34 67 21
    ## 66          <NA>       3012 Switzerland       0452-076545
    ## 67          <NA>       1203 Switzerland       0897-034214
    ## 68          <NA>    WA1 1DP          UK    (171) 555-7788
    ## 69          <NA>    EC2 5NT          UK    (171) 555-1212
    ## 70          <NA>    WX1 6LT          UK    (171) 555-2282
    ## 71          <NA>    WX3 6FW          UK    (171) 555-0297
    ## 72 Isle of Wight   PO31 7PJ          UK    (198) 555-8888
    ## 73          <NA>    SW7 1RZ          UK    (171) 555-7733
    ## 74          <NA>   OX15 4NB          UK    (171) 555-1717
    ## 75            OR      97403         USA    (503) 555-7555
    ## 76            OR      97827         USA    (503) 555-6874
    ## 77            WA      99362         USA    (509) 555-7969
    ## 78            CA      94117         USA    (415) 555-5938
    ## 79            OR      97219         USA    (503) 555-9573
    ## 80            AK      99508         USA    (907) 555-7584
    ## 81            NM      87110         USA    (505) 555-5939
    ## 82            ID      83720         USA    (208) 555-8097
    ## 83            WY      82520         USA    (307) 555-4680
    ## 84            OR      97201         USA    (503) 555-3612
    ## 85            MT      59801         USA    (406) 555-5834
    ## 86            WA      98034         USA    (206) 555-8257
    ## 87            WA      98128         USA    (206) 555-4112
    ## 88            DF       1081   Venezuela      (2) 283-2951
    ## 89       Táchira       5022   Venezuela      (5) 555-1340
    ## 90          Lara       3508   Venezuela      (9) 331-6954
    ## 91 Nueva Esparta       4980   Venezuela      (8) 34-56-12
    ##                  Fax
    ## 1       (1) 135-4892
    ## 2       (1) 135-5535
    ## 3       (1) 123-5556
    ## 4          7675-3426
    ## 5          6562-9723
    ## 6     (02) 201 24 68
    ## 7  (071) 23 67 22 21
    ## 8               <NA>
    ## 9               <NA>
    ## 10              <NA>
    ## 11     (21) 555-8765
    ## 12     (21) 555-4545
    ## 13              <NA>
    ## 14              <NA>
    ## 15     (11) 555-2168
    ## 16              <NA>
    ## 17    (604) 555-3745
    ## 18    (604) 555-7293
    ## 19    (514) 555-8055
    ## 20       31 13 35 57
    ## 21       86 22 33 44
    ## 22        981-443655
    ## 23       90-224 8858
    ## 24       88.60.15.32
    ## 25       91.24.45.41
    ## 26       40.67.89.89
    ## 27       20.16.10.17
    ## 28       40.32.21.20
    ## 29       30.59.85.11
    ## 30       61.77.61.11
    ## 31   (1) 42.34.22.77
    ## 32   (1) 47.55.60.20
    ## 33       78.32.54.87
    ## 34       26.47.15.11
    ## 35       030-0076545
    ## 36        0621-08924
    ## 37       0711-035428
    ## 38       0241-059428
    ## 39       089-0877451
    ## 40              <NA>
    ## 41       069-0245874
    ## 42              <NA>
    ## 43      0221-0765721
    ## 44              <NA>
    ## 45       0251-035695
    ## 46         2967 3333
    ## 47       011-4988261
    ## 48        035-640231
    ## 49       0522-556722
    ## 50      (5) 555-3745
    ## 51              <NA>
    ## 52      (5) 555-7293
    ## 53      (5) 545-3745
    ## 54              <NA>
    ## 55       07-98 92 47
    ## 56     (26) 642-7012
    ## 57      (1) 354-2535
    ## 58              <NA>
    ## 59    (91) 555 91 99
    ## 60    (91) 555 55 93
    ## 61     (93) 203 4561
    ## 62              <NA>
    ## 63     (91) 745 6210
    ## 64     0921-12 34 67
    ## 65              <NA>
    ## 66              <NA>
    ## 67              <NA>
    ## 68    (171) 555-6750
    ## 69              <NA>
    ## 70    (171) 555-9199
    ## 71    (171) 555-3373
    ## 72              <NA>
    ## 73    (171) 555-2530
    ## 74    (171) 555-5646
    ## 75              <NA>
    ## 76    (503) 555-2376
    ## 77    (509) 555-6221
    ## 78              <NA>
    ## 79    (503) 555-9646
    ## 80    (907) 555-2880
    ## 81    (505) 555-3620
    ## 82              <NA>
    ## 83    (307) 555-6525
    ## 84              <NA>
    ## 85    (406) 555-8083
    ## 86    (206) 555-2174
    ## 87    (206) 555-4115
    ## 88      (2) 283-3397
    ## 89      (5) 555-1948
    ## 90      (9) 331-7256
    ## 91      (8) 34-93-93

SQL statement selects all customers from the "Customers" table, sorted ascending by the "Country" and
=====================================================================================================

descending by the "CustomerName" column
=======================================

``` r
sqldf("SELECT * 
       FROM Customers
       ORDER BY Country ASC , CompanyName DESC;")
```

    ##    CustomerID                          CompanyName             ContactName
    ## 1       RANCH                        Rancho grande        Sergio Gutiérrez
    ## 2       OCEAN               Océano Atlántico Ltda.          Yvonne Moncada
    ## 3       CACTU           Cactus Comidas para llevar        Patricio Simpson
    ## 4       PICCO                     Piccolo und mehr             Georg Pipps
    ## 5       ERNSH                         Ernst Handel           Roland Mendel
    ## 6       SUPRD                     Suprêmes délices        Pascale Cartrain
    ## 7       MAISD                         Maison Dewey         Catherine Dewey
    ## 8       WELLI               Wellington Importadora           Paula Parente
    ## 9       TRADH               Tradição Hipermercados       Anabela Domingues
    ## 10      RICAR                   Ricardo Adocicados          Janete Limeira
    ## 11      QUEEN                        Queen Cozinha          Lúcia Carvalho
    ## 12      QUEDE                          Que Delícia        Bernardo Batista
    ## 13      HANAR                        Hanari Carnes            Mario Pontes
    ## 14      GOURL                  Gourmet Lanchonetes           André Fonseca
    ## 15      FAMIA                   Familia Arquibaldo               Aria Cruz
    ## 16      COMMI                     Comércio Mineiro            Pedro Afonso
    ## 17      MEREP                       Mère Paillarde          Jean Fresnière
    ## 18      LAUGB        Laughing Bacchus Wine Cellars         Yoshi Tannamuri
    ## 19      BOTTM                Bottom-Dollar Markets       Elizabeth Lincoln
    ## 20      VAFFE                         Vaffeljernet             Palle Ibsen
    ## 21      SIMOB                        Simons bistro          Jytte Petersen
    ## 22      WILMK                          Wilman Kala         Matti Karttunen
    ## 23      WARTH                       Wartian Herkku        Pirkko Koskitalo
    ## 24      VINET            Vins et alcools Chevalier            Paul Henriot
    ## 25      VICTE                 Victuailles en stock            Mary Saveley
    ## 26      SPECD                 Spécialités du monde       Dominique Perrier
    ## 27      PARIS                    Paris spécialités          Marie Bertrand
    ## 28      LAMAI                     La maison d'Asie          Annette Roulet
    ## 29      LACOR                 La corne d'abondance           Daniel Tonini
    ## 30      FRANR                  France restauration          Carine Schmitt
    ## 31      FOLIG                    Folies gourmandes           Martine Rancé
    ## 32      DUMON                      Du monde entier          Janine Labrune
    ## 33      BONAP                             Bon app'        Laurence Lebihan
    ## 34      BLONP                 Blondel père et fils      Frédérique Citeaux
    ## 35      TOMSP                   Toms Spezialitäten           Karin Josephs
    ## 36      QUICK                           QUICK-Stop             Horst Kloss
    ## 37      OTTIK                   Ottilies Käseladen     Henriette Pfalzheim
    ## 38      MORGK               Morgenstern Gesundkost         Alexander Feuer
    ## 39      LEHMS                  Lehmanns Marktstand          Renate Messner
    ## 40      KOENE                      Königlich Essen           Philip Cramer
    ## 41      FRANK                       Frankenversand           Peter Franken
    ## 42      DRACD             Drachenblut Delikatessen            Sven Ottlieb
    ## 43      WANDK                    Die Wandernde Kuh             Rita Müller
    ## 44      BLAUS              Blauer See Delikatessen              Hanna Moos
    ## 45      ALFKI                  Alfreds Futterkiste            Maria Anders
    ## 46      HUNGO         Hungry Owl All-Night Grocers        Patricia McKenna
    ## 47      REGGC                   Reggiani Caseifici         Maurizio Moroni
    ## 48      MAGAA         Magazzini Alimentari Riuniti        Giovanni Rovelli
    ## 49      FRANS                       Franchi S.p.A.           Paolo Accorti
    ## 50      TORTU                  Tortuga Restaurante    Miguel Angel Paolino
    ## 51      PERIC            Pericles Comidas clásicas     Guillermo Fernández
    ## 52      CENTC           Centro comercial Moctezuma         Francisco Chang
    ## 53      ANTON              Antonio Moreno Taquería          Antonio Moreno
    ## 54      ANATR   Ana Trujillo Emparedados y helados            Ana Trujillo
    ## 55      SANTG                        Santé Gourmet        Jonas Bergulfsen
    ## 56      WOLZA                       Wolski  Zajazd Zbyszek Piestrzeniewicz
    ## 57      PRINI               Princesa Isabel Vinhos        Isabel de Castro
    ## 58      FURIB       Furia Bacalhau e Frutos do Mar          Lino Rodriguez
    ## 59      ROMEY                     Romero y tomillo        Alejandra Camino
    ## 60      GODOS                  Godos Cocina Típica       José Pedro Freyre
    ## 61      GALED               Galería del gastrónomo        Eduardo Saavedra
    ## 62      FISSA FISSA Fabrica Inter. Salchichas S.A.              Diego Roel
    ## 63      BOLID            Bólido Comidas preparadas           Martín Sommer
    ## 64      FOLKO                       Folk och fä HB           Maria Larsson
    ## 65      BERGS                   Berglunds snabbköp      Christina Berglund
    ## 66      RICSU                   Richter Supermarkt            Michael Holz
    ## 67      CHOPS                    Chop-suey Chinese               Yang Wang
    ## 68      SEVES                   Seven Seas Imports              Hari Kumar
    ## 69      NORTS                          North/South          Simon Crowther
    ## 70      ISLAT                       Island Trading           Helen Bennett
    ## 71      EASTC                   Eastern Connection               Ann Devon
    ## 72      CONSH                Consolidated Holdings         Elizabeth Brown
    ## 73      BSBEV                        B's Beverages       Victoria Ashworth
    ## 74      AROUT                      Around the Horn            Thomas Hardy
    ## 75      WHITC                 White Clover Markets          Karl Jablonski
    ## 76      TRAIH    Trail's Head Gourmet Provisioners          Helvetius Nagy
    ## 77      THECR                      The Cracker Box                Liu Wong
    ## 78      THEBI                       The Big Cheese               Liz Nixon
    ## 79      SPLIR                Split Rail Beer & Ale      Art Braunschweiger
    ## 80      SAVEA                   Save-a-lot Markets          Jose Pavarotti
    ## 81      RATTC           Rattlesnake Canyon Grocery            Paula Wilson
    ## 82      OLDWO               Old World Delicatessen           Rene Phillips
    ## 83      LONEP             Lonesome Pine Restaurant             Fran Wilson
    ## 84      LETSS                    Let's Stop N Shop            Jaime Yorres
    ## 85      LAZYK                 Lazy K Kountry Store              John Steel
    ## 86      HUNGC           Hungry Coyote Import Store           Yoshi Latimer
    ## 87      GREAL              Great Lakes Food Market           Howard Snyder
    ## 88      LINOD                     LINO-Delicateses        Felipe Izquierdo
    ## 89      LILAS                    LILA-Supermercado         Carlos González
    ## 90      HILAA                     HILARIÓN-Abastos        Carlos Hernández
    ## 91      GROSR                 GROSELLA-Restaurante          Manuel Pereira
    ##                      ContactTitle
    ## 1            Sales Representative
    ## 2                     Sales Agent
    ## 3                     Sales Agent
    ## 4                   Sales Manager
    ## 5                   Sales Manager
    ## 6              Accounting Manager
    ## 7                     Sales Agent
    ## 8                   Sales Manager
    ## 9            Sales Representative
    ## 10          Assistant Sales Agent
    ## 11            Marketing Assistant
    ## 12             Accounting Manager
    ## 13             Accounting Manager
    ## 14                Sales Associate
    ## 15            Marketing Assistant
    ## 16                Sales Associate
    ## 17            Marketing Assistant
    ## 18            Marketing Assistant
    ## 19             Accounting Manager
    ## 20                  Sales Manager
    ## 21                          Owner
    ## 22      Owner/Marketing Assistant
    ## 23             Accounting Manager
    ## 24             Accounting Manager
    ## 25                    Sales Agent
    ## 26              Marketing Manager
    ## 27                          Owner
    ## 28                  Sales Manager
    ## 29           Sales Representative
    ## 30              Marketing Manager
    ## 31          Assistant Sales Agent
    ## 32                          Owner
    ## 33                          Owner
    ## 34              Marketing Manager
    ## 35              Marketing Manager
    ## 36             Accounting Manager
    ## 37                          Owner
    ## 38            Marketing Assistant
    ## 39           Sales Representative
    ## 40                Sales Associate
    ## 41              Marketing Manager
    ## 42            Order Administrator
    ## 43           Sales Representative
    ## 44           Sales Representative
    ## 45           Sales Representative
    ## 46                Sales Associate
    ## 47                Sales Associate
    ## 48              Marketing Manager
    ## 49           Sales Representative
    ## 50                          Owner
    ## 51           Sales Representative
    ## 52              Marketing Manager
    ## 53                          Owner
    ## 54                          Owner
    ## 55                          Owner
    ## 56                          Owner
    ## 57           Sales Representative
    ## 58                  Sales Manager
    ## 59             Accounting Manager
    ## 60                  Sales Manager
    ## 61              Marketing Manager
    ## 62             Accounting Manager
    ## 63                          Owner
    ## 64                          Owner
    ## 65            Order Administrator
    ## 66                  Sales Manager
    ## 67                          Owner
    ## 68                  Sales Manager
    ## 69                Sales Associate
    ## 70              Marketing Manager
    ## 71                    Sales Agent
    ## 72           Sales Representative
    ## 73           Sales Representative
    ## 74           Sales Representative
    ## 75                          Owner
    ## 76                Sales Associate
    ## 77            Marketing Assistant
    ## 78              Marketing Manager
    ## 79                  Sales Manager
    ## 80           Sales Representative
    ## 81 Assistant Sales Representative
    ## 82           Sales Representative
    ## 83                  Sales Manager
    ## 84                          Owner
    ## 85              Marketing Manager
    ## 86           Sales Representative
    ## 87              Marketing Manager
    ## 88                          Owner
    ## 89             Accounting Manager
    ## 90           Sales Representative
    ## 91                          Owner
    ##                                           Address            City
    ## 1                          Av. del Libertador 900    Buenos Aires
    ## 2          Ing. Gustavo Moncada 8585\r\nPiso 20-A    Buenos Aires
    ## 3                                     Cerrito 333    Buenos Aires
    ## 4                                     Geislweg 14        Salzburg
    ## 5                                    Kirchgasse 6            Graz
    ## 6                            Boulevard Tirou, 255       Charleroi
    ## 7                             Rue Joseph-Bens 532       Bruxelles
    ## 8                              Rua do Mercado, 12         Resende
    ## 9                         Av. Inês de Castro, 414       São Paulo
    ## 10                            Av. Copacabana, 267  Rio de Janeiro
    ## 11                      Alameda dos Canàrios, 891       São Paulo
    ## 12                        Rua da Panificadora, 12  Rio de Janeiro
    ## 13                                Rua do Paço, 67  Rio de Janeiro
    ## 14                                Av. Brasil, 442        Campinas
    ## 15                                   Rua Orós, 92       São Paulo
    ## 16                           Av. dos Lusíadas, 23       São Paulo
    ## 17                             43 rue St. Laurent        Montréal
    ## 18                                   1900 Oak St.       Vancouver
    ## 19                             23 Tsawassen Blvd.       Tsawassen
    ## 20                                  Smagsløget 45           Århus
    ## 21                                   Vinbæltet 34       København
    ## 22                                  Keskuskatu 45        Helsinki
    ## 23                                    Torikatu 38            Oulu
    ## 24                             59 rue de l'Abbaye           Reims
    ## 25                             2, rue du Commerce            Lyon
    ## 26                              25, rue Lauriston           Paris
    ## 27                        265, boulevard Charonne           Paris
    ## 28                          1 rue Alsace-Lorraine        Toulouse
    ## 29                         67, avenue de l'Europe      Versailles
    ## 30                                 54, rue Royale          Nantes
    ## 31                       184, chaussée de Tournai           Lille
    ## 32                   67, rue des Cinquante Otages          Nantes
    ## 33                           12, rue des Bouchers       Marseille
    ## 34                               24, place Kléber      Strasbourg
    ## 35                                  Luisenstr. 48         Münster
    ## 36                               Taucherstraße 10       Cunewalde
    ## 37                             Mehrheimerstr. 369            Köln
    ## 38                                    Heerstr. 22         Leipzig
    ## 39                                   Magazinweg 7  Frankfurt a.M.
    ## 40                                  Maubelstr. 90     Brandenburg
    ## 41                              Berliner Platz 43         München
    ## 42                                   Walserweg 21          Aachen
    ## 43                              Adenauerallee 900       Stuttgart
    ## 44                                 Forsterstr. 57        Mannheim
    ## 45                                  Obere Str. 57          Berlin
    ## 46                               8 Johnstown Road            Cork
    ## 47                         Strada Provinciale 124   Reggio Emilia
    ## 48                        Via Ludovico il Moro 22         Bergamo
    ## 49                            Via Monte Bianco 34          Torino
    ## 50                               Avda. Azteca 123     México D.F.
    ## 51                       Calle Dr. Jorge Cash 321     México D.F.
    ## 52                        Sierras de Granada 9993     México D.F.
    ## 53                                Mataderos  2312     México D.F.
    ## 54                  Avda. de la Constitución 2222     México D.F.
    ## 55                         Erling Skakkes gate 78         Stavern
    ## 56                                ul. Filtrowa 68        Warszawa
    ## 57                         Estrada da saúde n. 58          Lisboa
    ## 58                         Jardim das rosas n. 32          Lisboa
    ## 59                                    Gran Vía, 1          Madrid
    ## 60                                  C/ Romero, 33         Sevilla
    ## 61                         Rambla de Cataluña, 23       Barcelona
    ## 62                             C/ Moralzarzal, 86          Madrid
    ## 63                                 C/ Araquil, 67          Madrid
    ## 64                                   Åkergatan 24          Bräcke
    ## 65                                Berguvsvägen  8           Luleå
    ## 66                              Grenzacherweg 237          Genève
    ## 67                                   Hauptstr. 29            Bern
    ## 68                                90 Wadhurst Rd.          London
    ## 69                South House\r\n300 Queensbridge          London
    ## 70                   Garden House\r\nCrowther Way           Cowes
    ## 71                                 35 King George          London
    ## 72                Berkeley Gardens\r\n12  Brewery          London
    ## 73                              Fauntleroy Circus          London
    ## 74                                120 Hanover Sq.          London
    ## 75                 305 - 14th Ave. S.\r\nSuite 3B         Seattle
    ## 76                              722 DaVinci Blvd.        Kirkland
    ## 77                            55 Grizzly Peak Rd.           Butte
    ## 78                    89 Jefferson Way\r\nSuite 2        Portland
    ## 79                                   P.O. Box 555          Lander
    ## 80                                187 Suffolk Ln.           Boise
    ## 81                                2817 Milton Dr.     Albuquerque
    ## 82                                2743 Bering St.       Anchorage
    ## 83                             89 Chiaroscuro Rd.        Portland
    ## 84                         87 Polk St.\r\nSuite 5   San Francisco
    ## 85                           12 Orchestra Terrace     Walla Walla
    ## 86              City Center Plaza\r\n516 Main St.           Elgin
    ## 87                               2732 Baker Blvd.          Eugene
    ## 88                        Ave. 5 de Mayo Porlamar I. de Margarita
    ## 89 Carrera 52 con Ave. Bolívar #65-98 Llano Largo    Barquisimeto
    ## 90     Carrera 22 con Ave. Carlos Soublette #8-35   San Cristóbal
    ## 91                      5ª Ave. Los Palos Grandes         Caracas
    ##           Region PostalCode     Country             Phone
    ## 1           <NA>       1010   Argentina      (1) 123-5555
    ## 2           <NA>       1010   Argentina      (1) 135-5333
    ## 3           <NA>       1010   Argentina      (1) 135-5555
    ## 4           <NA>       5020     Austria         6562-9722
    ## 5           <NA>       8010     Austria         7675-3425
    ## 6           <NA>     B-6000     Belgium (071) 23 67 22 20
    ## 7           <NA>     B-1180     Belgium    (02) 201 24 67
    ## 8             SP  08737-363      Brazil     (14) 555-8122
    ## 9             SP  05634-030      Brazil     (11) 555-2167
    ## 10            RJ  02389-890      Brazil     (21) 555-3412
    ## 11            SP  05487-020      Brazil     (11) 555-1189
    ## 12            RJ  02389-673      Brazil     (21) 555-4252
    ## 13            RJ  05454-876      Brazil     (21) 555-0091
    ## 14            SP  04876-786      Brazil     (11) 555-9482
    ## 15            SP  05442-030      Brazil     (11) 555-9857
    ## 16            SP  05432-043      Brazil     (11) 555-7647
    ## 17        Québec    H1J 1C3      Canada    (514) 555-8054
    ## 18            BC    V3F 2K1      Canada    (604) 555-3392
    ## 19            BC    T2F 8M4      Canada    (604) 555-4729
    ## 20          <NA>       8200     Denmark       86 21 32 43
    ## 21          <NA>       1734     Denmark       31 12 34 56
    ## 22          <NA>      21240     Finland       90-224 8858
    ## 23          <NA>      90110     Finland        981-443655
    ## 24          <NA>      51100      France       26.47.15.10
    ## 25          <NA>      69004      France       78.32.54.86
    ## 26          <NA>      75016      France   (1) 47.55.60.10
    ## 27          <NA>      75012      France   (1) 42.34.22.66
    ## 28          <NA>      31000      France       61.77.61.10
    ## 29          <NA>      78000      France       30.59.84.10
    ## 30          <NA>      44000      France       40.32.21.21
    ## 31          <NA>      59000      France       20.16.10.16
    ## 32          <NA>      44000      France       40.67.88.88
    ## 33          <NA>      13008      France       91.24.45.40
    ## 34          <NA>      67000      France       88.60.15.31
    ## 35          <NA>      44087     Germany       0251-031259
    ## 36          <NA>      01307     Germany       0372-035188
    ## 37          <NA>      50739     Germany      0221-0644327
    ## 38          <NA>      04179     Germany       0342-023176
    ## 39          <NA>      60528     Germany       069-0245984
    ## 40          <NA>      14776     Germany        0555-09876
    ## 41          <NA>      80805     Germany       089-0877310
    ## 42          <NA>      52066     Germany       0241-039123
    ## 43          <NA>      70563     Germany       0711-020361
    ## 44          <NA>      68306     Germany        0621-08460
    ## 45          <NA>      12209     Germany       030-0074321
    ## 46      Co. Cork       <NA>     Ireland          2967 542
    ## 47          <NA>      42100       Italy       0522-556721
    ## 48          <NA>      24100       Italy        035-640230
    ## 49          <NA>      10100       Italy       011-4988260
    ## 50          <NA>      05033      Mexico      (5) 555-2933
    ## 51          <NA>      05033      Mexico      (5) 552-3745
    ## 52          <NA>      05022      Mexico      (5) 555-3392
    ## 53          <NA>      05023      Mexico      (5) 555-3932
    ## 54          <NA>      05021      Mexico      (5) 555-4729
    ## 55          <NA>       4110      Norway       07-98 92 35
    ## 56          <NA>     01-012      Poland     (26) 642-7012
    ## 57          <NA>       1756    Portugal      (1) 356-5634
    ## 58          <NA>       1675    Portugal      (1) 354-2534
    ## 59          <NA>      28001       Spain     (91) 745 6200
    ## 60          <NA>      41101       Spain    (95) 555 82 82
    ## 61          <NA>      08022       Spain     (93) 203 4560
    ## 62          <NA>      28034       Spain    (91) 555 94 44
    ## 63          <NA>      28023       Spain    (91) 555 22 82
    ## 64          <NA>   S-844 67      Sweden     0695-34 67 21
    ## 65          <NA>   S-958 22      Sweden     0921-12 34 65
    ## 66          <NA>       1203 Switzerland       0897-034214
    ## 67          <NA>       3012 Switzerland       0452-076545
    ## 68          <NA>   OX15 4NB          UK    (171) 555-1717
    ## 69          <NA>    SW7 1RZ          UK    (171) 555-7733
    ## 70 Isle of Wight   PO31 7PJ          UK    (198) 555-8888
    ## 71          <NA>    WX3 6FW          UK    (171) 555-0297
    ## 72          <NA>    WX1 6LT          UK    (171) 555-2282
    ## 73          <NA>    EC2 5NT          UK    (171) 555-1212
    ## 74          <NA>    WA1 1DP          UK    (171) 555-7788
    ## 75            WA      98128         USA    (206) 555-4112
    ## 76            WA      98034         USA    (206) 555-8257
    ## 77            MT      59801         USA    (406) 555-5834
    ## 78            OR      97201         USA    (503) 555-3612
    ## 79            WY      82520         USA    (307) 555-4680
    ## 80            ID      83720         USA    (208) 555-8097
    ## 81            NM      87110         USA    (505) 555-5939
    ## 82            AK      99508         USA    (907) 555-7584
    ## 83            OR      97219         USA    (503) 555-9573
    ## 84            CA      94117         USA    (415) 555-5938
    ## 85            WA      99362         USA    (509) 555-7969
    ## 86            OR      97827         USA    (503) 555-6874
    ## 87            OR      97403         USA    (503) 555-7555
    ## 88 Nueva Esparta       4980   Venezuela      (8) 34-56-12
    ## 89          Lara       3508   Venezuela      (9) 331-6954
    ## 90       Táchira       5022   Venezuela      (5) 555-1340
    ## 91            DF       1081   Venezuela      (2) 283-2951
    ##                  Fax
    ## 1       (1) 123-5556
    ## 2       (1) 135-5535
    ## 3       (1) 135-4892
    ## 4          6562-9723
    ## 5          7675-3426
    ## 6  (071) 23 67 22 21
    ## 7     (02) 201 24 68
    ## 8               <NA>
    ## 9      (11) 555-2168
    ## 10              <NA>
    ## 11              <NA>
    ## 12     (21) 555-4545
    ## 13     (21) 555-8765
    ## 14              <NA>
    ## 15              <NA>
    ## 16              <NA>
    ## 17    (514) 555-8055
    ## 18    (604) 555-7293
    ## 19    (604) 555-3745
    ## 20       86 22 33 44
    ## 21       31 13 35 57
    ## 22       90-224 8858
    ## 23        981-443655
    ## 24       26.47.15.11
    ## 25       78.32.54.87
    ## 26   (1) 47.55.60.20
    ## 27   (1) 42.34.22.77
    ## 28       61.77.61.11
    ## 29       30.59.85.11
    ## 30       40.32.21.20
    ## 31       20.16.10.17
    ## 32       40.67.89.89
    ## 33       91.24.45.41
    ## 34       88.60.15.32
    ## 35       0251-035695
    ## 36              <NA>
    ## 37      0221-0765721
    ## 38              <NA>
    ## 39       069-0245874
    ## 40              <NA>
    ## 41       089-0877451
    ## 42       0241-059428
    ## 43       0711-035428
    ## 44        0621-08924
    ## 45       030-0076545
    ## 46         2967 3333
    ## 47       0522-556722
    ## 48        035-640231
    ## 49       011-4988261
    ## 50              <NA>
    ## 51      (5) 545-3745
    ## 52      (5) 555-7293
    ## 53              <NA>
    ## 54      (5) 555-3745
    ## 55       07-98 92 47
    ## 56     (26) 642-7012
    ## 57              <NA>
    ## 58      (1) 354-2535
    ## 59     (91) 745 6210
    ## 60              <NA>
    ## 61     (93) 203 4561
    ## 62    (91) 555 55 93
    ## 63    (91) 555 91 99
    ## 64              <NA>
    ## 65     0921-12 34 67
    ## 66              <NA>
    ## 67              <NA>
    ## 68    (171) 555-5646
    ## 69    (171) 555-2530
    ## 70              <NA>
    ## 71    (171) 555-3373
    ## 72    (171) 555-9199
    ## 73              <NA>
    ## 74    (171) 555-6750
    ## 75    (206) 555-4115
    ## 76    (206) 555-2174
    ## 77    (406) 555-8083
    ## 78              <NA>
    ## 79    (307) 555-6525
    ## 80              <NA>
    ## 81    (505) 555-3620
    ## 82    (907) 555-2880
    ## 83    (503) 555-9646
    ## 84              <NA>
    ## 85    (509) 555-6221
    ## 86    (503) 555-2376
    ## 87              <NA>
    ## 88      (8) 34-93-93
    ## 89      (9) 331-7256
    ## 90      (5) 555-1948
    ## 91      (2) 283-3397

SQL statement updates the first customer (CustomerID = ALFKI) with a new contact person and a new city.
=======================================================================================================

``` r
sqldf(c("UPDATE Customers
        SET CompanyName = 'Alfred Schmidt' , City = 'Frankfurt'
        WHERE CustomerID ='ALFKI'","SELECT *
        FROM Customers
        WHERE CustomerID = 'ALFKI'"))
```

    ## Warning in rsqlite_fetch(res@ptr, n = n): Don't need to call dbFetch() for
    ## statements, only for queries

    ##   CustomerID    CompanyName  ContactName         ContactTitle
    ## 1      ALFKI Alfred Schmidt Maria Anders Sales Representative
    ##         Address      City Region PostalCode Country       Phone
    ## 1 Obere Str. 57 Frankfurt   <NA>      12209 Germany 030-0074321
    ##           Fax
    ## 1 030-0076545

SQL statement will update the contactname to "Juan" for all records where country is "Mexico"
=============================================================================================

``` r
sqldf(c("UPDATE Customers
         SET ContactName = 'Juan'
         WHERE Country = 'Mexico'",
         "SELECT *
          FROM Customers
          WHERE ContactName = 'Juan'"))
```

    ## Warning in rsqlite_fetch(res@ptr, n = n): Don't need to call dbFetch() for
    ## statements, only for queries

    ##   CustomerID                        CompanyName ContactName
    ## 1      ANATR Ana Trujillo Emparedados y helados        Juan
    ## 2      ANTON            Antonio Moreno Taquería        Juan
    ## 3      CENTC         Centro comercial Moctezuma        Juan
    ## 4      PERIC          Pericles Comidas clásicas        Juan
    ## 5      TORTU                Tortuga Restaurante        Juan
    ##           ContactTitle                       Address        City Region
    ## 1                Owner Avda. de la Constitución 2222 México D.F.   <NA>
    ## 2                Owner               Mataderos  2312 México D.F.   <NA>
    ## 3    Marketing Manager       Sierras de Granada 9993 México D.F.   <NA>
    ## 4 Sales Representative      Calle Dr. Jorge Cash 321 México D.F.   <NA>
    ## 5                Owner              Avda. Azteca 123 México D.F.   <NA>
    ##   PostalCode Country        Phone          Fax
    ## 1      05021  Mexico (5) 555-4729 (5) 555-3745
    ## 2      05023  Mexico (5) 555-3932         <NA>
    ## 3      05022  Mexico (5) 555-3392 (5) 555-7293
    ## 4      05033  Mexico (5) 552-3745 (5) 545-3745
    ## 5      05033  Mexico (5) 555-2933         <NA>

SQL statement finds the price of the cheapest product
=====================================================

``` r
sqldf("SELECT *,MIN(UnitPrice)
       FROM Product;")
```

    ##   ProductID ProductName SupplierID CategoryID QuantityPerUnit UnitPrice
    ## 1        33     Geitost         15          4           500 g       2.5
    ##   UnitsInStock UnitsOnOrder ReorderLevel Discontinued MIN(UnitPrice)
    ## 1          112            0           20        FALSE            2.5

SQL statement finds the price of the most expensive product
===========================================================

``` r
sqldf("SELECT *,MAX(UnitPrice)
       FROM Product;")
```

    ##   ProductID   ProductName SupplierID CategoryID    QuantityPerUnit
    ## 1        38 Côte de Blaye         18          1 12 - 75 cl bottles
    ##   UnitPrice UnitsInStock UnitsOnOrder ReorderLevel Discontinued
    ## 1     263.5           17            0           15        FALSE
    ##   MAX(UnitPrice)
    ## 1          263.5

SQL statement finds the number of products
==========================================

``` r
sqldf("SELECT COUNT(ProductID)
       FROM Product;")
```

    ##   COUNT(ProductID)
    ## 1               77

``` r
sqldf("SELECT AVG(UnitPrice)
       FROM Product;")
```

    ##   AVG(UnitPrice)
    ## 1       28.86636

SQL statement finds the sum of the "Quantity" fields in the "OrderDetails" table
================================================================================

``` r
sqldf("SELECT SUM(Quantity)
       FROM Orders_Details;")
```

    ##   SUM(Quantity)
    ## 1         51317

SQL statement selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length
====================================================================================================================

``` r
sqldf("SELECT *
       FROM Customers
       WHERE CompanyName LIKE  'a_%_%';")
```

    ##   CustomerID                        CompanyName    ContactName
    ## 1      ALFKI                Alfreds Futterkiste   Maria Anders
    ## 2      ANATR Ana Trujillo Emparedados y helados   Ana Trujillo
    ## 3      ANTON            Antonio Moreno Taquería Antonio Moreno
    ## 4      AROUT                    Around the Horn   Thomas Hardy
    ##           ContactTitle                       Address        City Region
    ## 1 Sales Representative                 Obere Str. 57      Berlin   <NA>
    ## 2                Owner Avda. de la Constitución 2222 México D.F.   <NA>
    ## 3                Owner               Mataderos  2312 México D.F.   <NA>
    ## 4 Sales Representative               120 Hanover Sq.      London   <NA>
    ##   PostalCode Country          Phone            Fax
    ## 1      12209 Germany    030-0074321    030-0076545
    ## 2      05021  Mexico   (5) 555-4729   (5) 555-3745
    ## 3      05023  Mexico   (5) 555-3932           <NA>
    ## 4    WA1 1DP      UK (171) 555-7788 (171) 555-6750

SQL statement selects all customers with a ContactName that starts with "a" and ends with "o"
=============================================================================================

``` r
sqldf("SELECT *
       FROM Customers
      WHERE ContactName LIKE  'a%o';")
```

    ##   CustomerID                        CompanyName      ContactName
    ## 1      ANATR Ana Trujillo Emparedados y helados     Ana Trujillo
    ## 2      ANTON            Antonio Moreno Taquería   Antonio Moreno
    ## 3      ROMEY                   Romero y tomillo Alejandra Camino
    ##         ContactTitle                       Address        City Region
    ## 1              Owner Avda. de la Constitución 2222 México D.F.   <NA>
    ## 2              Owner               Mataderos  2312 México D.F.   <NA>
    ## 3 Accounting Manager                   Gran Vía, 1      Madrid   <NA>
    ##   PostalCode Country         Phone           Fax
    ## 1      05021  Mexico  (5) 555-4729  (5) 555-3745
    ## 2      05023  Mexico  (5) 555-3932          <NA>
    ## 3      28001   Spain (91) 745 6200 (91) 745 6210

SQL statement selects all customers with a CustomerName that does NOT start with "a"
====================================================================================

``` r
sqldf("SELECT *
       FROM Customers
      WHERE ContactName NOT LIKE  'a%';")
```

    ##    CustomerID                          CompanyName             ContactName
    ## 1       ALFKI                  Alfreds Futterkiste            Maria Anders
    ## 2       AROUT                      Around the Horn            Thomas Hardy
    ## 3       BERGS                   Berglunds snabbköp      Christina Berglund
    ## 4       BLAUS              Blauer See Delikatessen              Hanna Moos
    ## 5       BLONP                 Blondel père et fils      Frédérique Citeaux
    ## 6       BOLID            Bólido Comidas preparadas           Martín Sommer
    ## 7       BONAP                             Bon app'        Laurence Lebihan
    ## 8       BOTTM                Bottom-Dollar Markets       Elizabeth Lincoln
    ## 9       BSBEV                        B's Beverages       Victoria Ashworth
    ## 10      CACTU           Cactus Comidas para llevar        Patricio Simpson
    ## 11      CENTC           Centro comercial Moctezuma         Francisco Chang
    ## 12      CHOPS                    Chop-suey Chinese               Yang Wang
    ## 13      COMMI                     Comércio Mineiro            Pedro Afonso
    ## 14      CONSH                Consolidated Holdings         Elizabeth Brown
    ## 15      DRACD             Drachenblut Delikatessen            Sven Ottlieb
    ## 16      DUMON                      Du monde entier          Janine Labrune
    ## 17      ERNSH                         Ernst Handel           Roland Mendel
    ## 18      FISSA FISSA Fabrica Inter. Salchichas S.A.              Diego Roel
    ## 19      FOLIG                    Folies gourmandes           Martine Rancé
    ## 20      FOLKO                       Folk och fä HB           Maria Larsson
    ## 21      FRANK                       Frankenversand           Peter Franken
    ## 22      FRANR                  France restauration          Carine Schmitt
    ## 23      FRANS                       Franchi S.p.A.           Paolo Accorti
    ## 24      FURIB       Furia Bacalhau e Frutos do Mar          Lino Rodriguez
    ## 25      GALED               Galería del gastrónomo        Eduardo Saavedra
    ## 26      GODOS                  Godos Cocina Típica       José Pedro Freyre
    ## 27      GREAL              Great Lakes Food Market           Howard Snyder
    ## 28      GROSR                 GROSELLA-Restaurante          Manuel Pereira
    ## 29      HANAR                        Hanari Carnes            Mario Pontes
    ## 30      HILAA                     HILARIÓN-Abastos        Carlos Hernández
    ## 31      HUNGC           Hungry Coyote Import Store           Yoshi Latimer
    ## 32      HUNGO         Hungry Owl All-Night Grocers        Patricia McKenna
    ## 33      ISLAT                       Island Trading           Helen Bennett
    ## 34      KOENE                      Königlich Essen           Philip Cramer
    ## 35      LACOR                 La corne d'abondance           Daniel Tonini
    ## 36      LAUGB        Laughing Bacchus Wine Cellars         Yoshi Tannamuri
    ## 37      LAZYK                 Lazy K Kountry Store              John Steel
    ## 38      LEHMS                  Lehmanns Marktstand          Renate Messner
    ## 39      LETSS                    Let's Stop N Shop            Jaime Yorres
    ## 40      LILAS                    LILA-Supermercado         Carlos González
    ## 41      LINOD                     LINO-Delicateses        Felipe Izquierdo
    ## 42      LONEP             Lonesome Pine Restaurant             Fran Wilson
    ## 43      MAGAA         Magazzini Alimentari Riuniti        Giovanni Rovelli
    ## 44      MAISD                         Maison Dewey         Catherine Dewey
    ## 45      MEREP                       Mère Paillarde          Jean Fresnière
    ## 46      NORTS                          North/South          Simon Crowther
    ## 47      OCEAN               Océano Atlántico Ltda.          Yvonne Moncada
    ## 48      OLDWO               Old World Delicatessen           Rene Phillips
    ## 49      OTTIK                   Ottilies Käseladen     Henriette Pfalzheim
    ## 50      PARIS                    Paris spécialités          Marie Bertrand
    ## 51      PERIC            Pericles Comidas clásicas     Guillermo Fernández
    ## 52      PICCO                     Piccolo und mehr             Georg Pipps
    ## 53      PRINI               Princesa Isabel Vinhos        Isabel de Castro
    ## 54      QUEDE                          Que Delícia        Bernardo Batista
    ## 55      QUEEN                        Queen Cozinha          Lúcia Carvalho
    ## 56      QUICK                           QUICK-Stop             Horst Kloss
    ## 57      RANCH                        Rancho grande        Sergio Gutiérrez
    ## 58      RATTC           Rattlesnake Canyon Grocery            Paula Wilson
    ## 59      REGGC                   Reggiani Caseifici         Maurizio Moroni
    ## 60      RICAR                   Ricardo Adocicados          Janete Limeira
    ## 61      RICSU                   Richter Supermarkt            Michael Holz
    ## 62      SANTG                        Santé Gourmet        Jonas Bergulfsen
    ## 63      SAVEA                   Save-a-lot Markets          Jose Pavarotti
    ## 64      SEVES                   Seven Seas Imports              Hari Kumar
    ## 65      SIMOB                        Simons bistro          Jytte Petersen
    ## 66      SPECD                 Spécialités du monde       Dominique Perrier
    ## 67      SUPRD                     Suprêmes délices        Pascale Cartrain
    ## 68      THEBI                       The Big Cheese               Liz Nixon
    ## 69      THECR                      The Cracker Box                Liu Wong
    ## 70      TOMSP                   Toms Spezialitäten           Karin Josephs
    ## 71      TORTU                  Tortuga Restaurante    Miguel Angel Paolino
    ## 72      TRAIH    Trail's Head Gourmet Provisioners          Helvetius Nagy
    ## 73      VAFFE                         Vaffeljernet             Palle Ibsen
    ## 74      VICTE                 Victuailles en stock            Mary Saveley
    ## 75      VINET            Vins et alcools Chevalier            Paul Henriot
    ## 76      WANDK                    Die Wandernde Kuh             Rita Müller
    ## 77      WARTH                       Wartian Herkku        Pirkko Koskitalo
    ## 78      WELLI               Wellington Importadora           Paula Parente
    ## 79      WHITC                 White Clover Markets          Karl Jablonski
    ## 80      WILMK                          Wilman Kala         Matti Karttunen
    ## 81      WOLZA                       Wolski  Zajazd Zbyszek Piestrzeniewicz
    ##                      ContactTitle
    ## 1            Sales Representative
    ## 2            Sales Representative
    ## 3             Order Administrator
    ## 4            Sales Representative
    ## 5               Marketing Manager
    ## 6                           Owner
    ## 7                           Owner
    ## 8              Accounting Manager
    ## 9            Sales Representative
    ## 10                    Sales Agent
    ## 11              Marketing Manager
    ## 12                          Owner
    ## 13                Sales Associate
    ## 14           Sales Representative
    ## 15            Order Administrator
    ## 16                          Owner
    ## 17                  Sales Manager
    ## 18             Accounting Manager
    ## 19          Assistant Sales Agent
    ## 20                          Owner
    ## 21              Marketing Manager
    ## 22              Marketing Manager
    ## 23           Sales Representative
    ## 24                  Sales Manager
    ## 25              Marketing Manager
    ## 26                  Sales Manager
    ## 27              Marketing Manager
    ## 28                          Owner
    ## 29             Accounting Manager
    ## 30           Sales Representative
    ## 31           Sales Representative
    ## 32                Sales Associate
    ## 33              Marketing Manager
    ## 34                Sales Associate
    ## 35           Sales Representative
    ## 36            Marketing Assistant
    ## 37              Marketing Manager
    ## 38           Sales Representative
    ## 39                          Owner
    ## 40             Accounting Manager
    ## 41                          Owner
    ## 42                  Sales Manager
    ## 43              Marketing Manager
    ## 44                    Sales Agent
    ## 45            Marketing Assistant
    ## 46                Sales Associate
    ## 47                    Sales Agent
    ## 48           Sales Representative
    ## 49                          Owner
    ## 50                          Owner
    ## 51           Sales Representative
    ## 52                  Sales Manager
    ## 53           Sales Representative
    ## 54             Accounting Manager
    ## 55            Marketing Assistant
    ## 56             Accounting Manager
    ## 57           Sales Representative
    ## 58 Assistant Sales Representative
    ## 59                Sales Associate
    ## 60          Assistant Sales Agent
    ## 61                  Sales Manager
    ## 62                          Owner
    ## 63           Sales Representative
    ## 64                  Sales Manager
    ## 65                          Owner
    ## 66              Marketing Manager
    ## 67             Accounting Manager
    ## 68              Marketing Manager
    ## 69            Marketing Assistant
    ## 70              Marketing Manager
    ## 71                          Owner
    ## 72                Sales Associate
    ## 73                  Sales Manager
    ## 74                    Sales Agent
    ## 75             Accounting Manager
    ## 76           Sales Representative
    ## 77             Accounting Manager
    ## 78                  Sales Manager
    ## 79                          Owner
    ## 80      Owner/Marketing Assistant
    ## 81                          Owner
    ##                                           Address            City
    ## 1                                   Obere Str. 57          Berlin
    ## 2                                 120 Hanover Sq.          London
    ## 3                                 Berguvsvägen  8           Luleå
    ## 4                                  Forsterstr. 57        Mannheim
    ## 5                                24, place Kléber      Strasbourg
    ## 6                                  C/ Araquil, 67          Madrid
    ## 7                            12, rue des Bouchers       Marseille
    ## 8                              23 Tsawassen Blvd.       Tsawassen
    ## 9                               Fauntleroy Circus          London
    ## 10                                    Cerrito 333    Buenos Aires
    ## 11                        Sierras de Granada 9993     México D.F.
    ## 12                                   Hauptstr. 29            Bern
    ## 13                           Av. dos Lusíadas, 23       São Paulo
    ## 14                Berkeley Gardens\r\n12  Brewery          London
    ## 15                                   Walserweg 21          Aachen
    ## 16                   67, rue des Cinquante Otages          Nantes
    ## 17                                   Kirchgasse 6            Graz
    ## 18                             C/ Moralzarzal, 86          Madrid
    ## 19                       184, chaussée de Tournai           Lille
    ## 20                                   Åkergatan 24          Bräcke
    ## 21                              Berliner Platz 43         München
    ## 22                                 54, rue Royale          Nantes
    ## 23                            Via Monte Bianco 34          Torino
    ## 24                         Jardim das rosas n. 32          Lisboa
    ## 25                         Rambla de Cataluña, 23       Barcelona
    ## 26                                  C/ Romero, 33         Sevilla
    ## 27                               2732 Baker Blvd.          Eugene
    ## 28                      5ª Ave. Los Palos Grandes         Caracas
    ## 29                                Rua do Paço, 67  Rio de Janeiro
    ## 30     Carrera 22 con Ave. Carlos Soublette #8-35   San Cristóbal
    ## 31              City Center Plaza\r\n516 Main St.           Elgin
    ## 32                               8 Johnstown Road            Cork
    ## 33                   Garden House\r\nCrowther Way           Cowes
    ## 34                                  Maubelstr. 90     Brandenburg
    ## 35                         67, avenue de l'Europe      Versailles
    ## 36                                   1900 Oak St.       Vancouver
    ## 37                           12 Orchestra Terrace     Walla Walla
    ## 38                                   Magazinweg 7  Frankfurt a.M.
    ## 39                         87 Polk St.\r\nSuite 5   San Francisco
    ## 40 Carrera 52 con Ave. Bolívar #65-98 Llano Largo    Barquisimeto
    ## 41                        Ave. 5 de Mayo Porlamar I. de Margarita
    ## 42                             89 Chiaroscuro Rd.        Portland
    ## 43                        Via Ludovico il Moro 22         Bergamo
    ## 44                            Rue Joseph-Bens 532       Bruxelles
    ## 45                             43 rue St. Laurent        Montréal
    ## 46                South House\r\n300 Queensbridge          London
    ## 47         Ing. Gustavo Moncada 8585\r\nPiso 20-A    Buenos Aires
    ## 48                                2743 Bering St.       Anchorage
    ## 49                             Mehrheimerstr. 369            Köln
    ## 50                        265, boulevard Charonne           Paris
    ## 51                       Calle Dr. Jorge Cash 321     México D.F.
    ## 52                                    Geislweg 14        Salzburg
    ## 53                         Estrada da saúde n. 58          Lisboa
    ## 54                        Rua da Panificadora, 12  Rio de Janeiro
    ## 55                      Alameda dos Canàrios, 891       São Paulo
    ## 56                               Taucherstraße 10       Cunewalde
    ## 57                         Av. del Libertador 900    Buenos Aires
    ## 58                                2817 Milton Dr.     Albuquerque
    ## 59                         Strada Provinciale 124   Reggio Emilia
    ## 60                            Av. Copacabana, 267  Rio de Janeiro
    ## 61                              Grenzacherweg 237          Genève
    ## 62                         Erling Skakkes gate 78         Stavern
    ## 63                                187 Suffolk Ln.           Boise
    ## 64                                90 Wadhurst Rd.          London
    ## 65                                   Vinbæltet 34       København
    ## 66                              25, rue Lauriston           Paris
    ## 67                           Boulevard Tirou, 255       Charleroi
    ## 68                    89 Jefferson Way\r\nSuite 2        Portland
    ## 69                            55 Grizzly Peak Rd.           Butte
    ## 70                                  Luisenstr. 48         Münster
    ## 71                               Avda. Azteca 123     México D.F.
    ## 72                              722 DaVinci Blvd.        Kirkland
    ## 73                                  Smagsløget 45           Århus
    ## 74                             2, rue du Commerce            Lyon
    ## 75                             59 rue de l'Abbaye           Reims
    ## 76                              Adenauerallee 900       Stuttgart
    ## 77                                    Torikatu 38            Oulu
    ## 78                             Rua do Mercado, 12         Resende
    ## 79                 305 - 14th Ave. S.\r\nSuite 3B         Seattle
    ## 80                                  Keskuskatu 45        Helsinki
    ## 81                                ul. Filtrowa 68        Warszawa
    ##           Region PostalCode     Country             Phone
    ## 1           <NA>      12209     Germany       030-0074321
    ## 2           <NA>    WA1 1DP          UK    (171) 555-7788
    ## 3           <NA>   S-958 22      Sweden     0921-12 34 65
    ## 4           <NA>      68306     Germany        0621-08460
    ## 5           <NA>      67000      France       88.60.15.31
    ## 6           <NA>      28023       Spain    (91) 555 22 82
    ## 7           <NA>      13008      France       91.24.45.40
    ## 8             BC    T2F 8M4      Canada    (604) 555-4729
    ## 9           <NA>    EC2 5NT          UK    (171) 555-1212
    ## 10          <NA>       1010   Argentina      (1) 135-5555
    ## 11          <NA>      05022      Mexico      (5) 555-3392
    ## 12          <NA>       3012 Switzerland       0452-076545
    ## 13            SP  05432-043      Brazil     (11) 555-7647
    ## 14          <NA>    WX1 6LT          UK    (171) 555-2282
    ## 15          <NA>      52066     Germany       0241-039123
    ## 16          <NA>      44000      France       40.67.88.88
    ## 17          <NA>       8010     Austria         7675-3425
    ## 18          <NA>      28034       Spain    (91) 555 94 44
    ## 19          <NA>      59000      France       20.16.10.16
    ## 20          <NA>   S-844 67      Sweden     0695-34 67 21
    ## 21          <NA>      80805     Germany       089-0877310
    ## 22          <NA>      44000      France       40.32.21.21
    ## 23          <NA>      10100       Italy       011-4988260
    ## 24          <NA>       1675    Portugal      (1) 354-2534
    ## 25          <NA>      08022       Spain     (93) 203 4560
    ## 26          <NA>      41101       Spain    (95) 555 82 82
    ## 27            OR      97403         USA    (503) 555-7555
    ## 28            DF       1081   Venezuela      (2) 283-2951
    ## 29            RJ  05454-876      Brazil     (21) 555-0091
    ## 30       Táchira       5022   Venezuela      (5) 555-1340
    ## 31            OR      97827         USA    (503) 555-6874
    ## 32      Co. Cork       <NA>     Ireland          2967 542
    ## 33 Isle of Wight   PO31 7PJ          UK    (198) 555-8888
    ## 34          <NA>      14776     Germany        0555-09876
    ## 35          <NA>      78000      France       30.59.84.10
    ## 36            BC    V3F 2K1      Canada    (604) 555-3392
    ## 37            WA      99362         USA    (509) 555-7969
    ## 38          <NA>      60528     Germany       069-0245984
    ## 39            CA      94117         USA    (415) 555-5938
    ## 40          Lara       3508   Venezuela      (9) 331-6954
    ## 41 Nueva Esparta       4980   Venezuela      (8) 34-56-12
    ## 42            OR      97219         USA    (503) 555-9573
    ## 43          <NA>      24100       Italy        035-640230
    ## 44          <NA>     B-1180     Belgium    (02) 201 24 67
    ## 45        Québec    H1J 1C3      Canada    (514) 555-8054
    ## 46          <NA>    SW7 1RZ          UK    (171) 555-7733
    ## 47          <NA>       1010   Argentina      (1) 135-5333
    ## 48            AK      99508         USA    (907) 555-7584
    ## 49          <NA>      50739     Germany      0221-0644327
    ## 50          <NA>      75012      France   (1) 42.34.22.66
    ## 51          <NA>      05033      Mexico      (5) 552-3745
    ## 52          <NA>       5020     Austria         6562-9722
    ## 53          <NA>       1756    Portugal      (1) 356-5634
    ## 54            RJ  02389-673      Brazil     (21) 555-4252
    ## 55            SP  05487-020      Brazil     (11) 555-1189
    ## 56          <NA>      01307     Germany       0372-035188
    ## 57          <NA>       1010   Argentina      (1) 123-5555
    ## 58            NM      87110         USA    (505) 555-5939
    ## 59          <NA>      42100       Italy       0522-556721
    ## 60            RJ  02389-890      Brazil     (21) 555-3412
    ## 61          <NA>       1203 Switzerland       0897-034214
    ## 62          <NA>       4110      Norway       07-98 92 35
    ## 63            ID      83720         USA    (208) 555-8097
    ## 64          <NA>   OX15 4NB          UK    (171) 555-1717
    ## 65          <NA>       1734     Denmark       31 12 34 56
    ## 66          <NA>      75016      France   (1) 47.55.60.10
    ## 67          <NA>     B-6000     Belgium (071) 23 67 22 20
    ## 68            OR      97201         USA    (503) 555-3612
    ## 69            MT      59801         USA    (406) 555-5834
    ## 70          <NA>      44087     Germany       0251-031259
    ## 71          <NA>      05033      Mexico      (5) 555-2933
    ## 72            WA      98034         USA    (206) 555-8257
    ## 73          <NA>       8200     Denmark       86 21 32 43
    ## 74          <NA>      69004      France       78.32.54.86
    ## 75          <NA>      51100      France       26.47.15.10
    ## 76          <NA>      70563     Germany       0711-020361
    ## 77          <NA>      90110     Finland        981-443655
    ## 78            SP  08737-363      Brazil     (14) 555-8122
    ## 79            WA      98128         USA    (206) 555-4112
    ## 80          <NA>      21240     Finland       90-224 8858
    ## 81          <NA>     01-012      Poland     (26) 642-7012
    ##                  Fax
    ## 1        030-0076545
    ## 2     (171) 555-6750
    ## 3      0921-12 34 67
    ## 4         0621-08924
    ## 5        88.60.15.32
    ## 6     (91) 555 91 99
    ## 7        91.24.45.41
    ## 8     (604) 555-3745
    ## 9               <NA>
    ## 10      (1) 135-4892
    ## 11      (5) 555-7293
    ## 12              <NA>
    ## 13              <NA>
    ## 14    (171) 555-9199
    ## 15       0241-059428
    ## 16       40.67.89.89
    ## 17         7675-3426
    ## 18    (91) 555 55 93
    ## 19       20.16.10.17
    ## 20              <NA>
    ## 21       089-0877451
    ## 22       40.32.21.20
    ## 23       011-4988261
    ## 24      (1) 354-2535
    ## 25     (93) 203 4561
    ## 26              <NA>
    ## 27              <NA>
    ## 28      (2) 283-3397
    ## 29     (21) 555-8765
    ## 30      (5) 555-1948
    ## 31    (503) 555-2376
    ## 32         2967 3333
    ## 33              <NA>
    ## 34              <NA>
    ## 35       30.59.85.11
    ## 36    (604) 555-7293
    ## 37    (509) 555-6221
    ## 38       069-0245874
    ## 39              <NA>
    ## 40      (9) 331-7256
    ## 41      (8) 34-93-93
    ## 42    (503) 555-9646
    ## 43        035-640231
    ## 44    (02) 201 24 68
    ## 45    (514) 555-8055
    ## 46    (171) 555-2530
    ## 47      (1) 135-5535
    ## 48    (907) 555-2880
    ## 49      0221-0765721
    ## 50   (1) 42.34.22.77
    ## 51      (5) 545-3745
    ## 52         6562-9723
    ## 53              <NA>
    ## 54     (21) 555-4545
    ## 55              <NA>
    ## 56              <NA>
    ## 57      (1) 123-5556
    ## 58    (505) 555-3620
    ## 59       0522-556722
    ## 60              <NA>
    ## 61              <NA>
    ## 62       07-98 92 47
    ## 63              <NA>
    ## 64    (171) 555-5646
    ## 65       31 13 35 57
    ## 66   (1) 47.55.60.20
    ## 67 (071) 23 67 22 21
    ## 68              <NA>
    ## 69    (406) 555-8083
    ## 70       0251-035695
    ## 71              <NA>
    ## 72    (206) 555-2174
    ## 73       86 22 33 44
    ## 74       78.32.54.87
    ## 75       26.47.15.11
    ## 76       0711-035428
    ## 77        981-443655
    ## 78              <NA>
    ## 79    (206) 555-4115
    ## 80       90-224 8858
    ## 81     (26) 642-7012

SQL statement (that contains an INNER JOIN), that selects records that have matching values in both tables
==========================================================================================================

``` r
sqldf("SELECT O.OrderID,C.CompanyName,O.OrderDate
       FROM Orders AS O
       INNER JOIN Customers As C
       USING(CustomerID);")
```

    ##     OrderID                        CompanyName  OrderDate
    ## 1     10248                        Wilman Kala 1996-07-04
    ## 2     10249             Tradição Hipermercados 1996-07-05
    ## 3     10250                      Hanari Carnes 1996-07-08
    ## 4     10251               Victuailles en stock 1996-07-08
    ## 5     10252                   Suprêmes délices 1996-07-09
    ## 6     10253                      Hanari Carnes 1996-07-10
    ## 7     10254                  Chop-suey Chinese 1996-07-11
    ## 8     10255                 Richter Supermarkt 1996-07-12
    ## 9     10256             Wellington Importadora 1996-07-15
    ## 10    10257                   HILARIÓN-Abastos 1996-07-16
    ## 11    10258                       Ernst Handel 1996-07-17
    ## 12    10259         Centro comercial Moctezuma 1996-07-18
    ## 13    10260             Old World Delicatessen 1996-07-19
    ## 14    10261                        Que Delícia 1996-07-19
    ## 15    10262         Rattlesnake Canyon Grocery 1996-07-22
    ## 16    10263                       Ernst Handel 1996-07-23
    ## 17    10264                     Folk och fä HB 1996-07-24
    ## 18    10265               Blondel père et fils 1996-07-25
    ## 19    10266                     Wartian Herkku 1996-07-26
    ## 20    10267                     Frankenversand 1996-07-29
    ## 21    10268               GROSELLA-Restaurante 1996-07-30
    ## 22    10269               White Clover Markets 1996-07-31
    ## 23    10270                     Wartian Herkku 1996-08-01
    ## 24    10271              Split Rail Beer & Ale 1996-08-01
    ## 25    10272         Rattlesnake Canyon Grocery 1996-08-02
    ## 26    10273                         QUICK-Stop 1996-08-05
    ## 27    10274          Vins et alcools Chevalier 1996-08-06
    ## 28    10275       Magazzini Alimentari Riuniti 1996-08-07
    ## 29    10276                Tortuga Restaurante 1996-08-08
    ## 30    10277             Morgenstern Gesundkost 1996-08-09
    ## 31    10278                 Berglunds snabbköp 1996-08-12
    ## 32    10279                Lehmanns Marktstand 1996-08-13
    ## 33    10280                 Berglunds snabbköp 1996-08-14
    ## 34    10281                   Romero y tomillo 1996-08-14
    ## 35    10282                   Romero y tomillo 1996-08-15
    ## 36    10283                  LILA-Supermercado 1996-08-16
    ## 37    10284                Lehmanns Marktstand 1996-08-19
    ## 38    10285                         QUICK-Stop 1996-08-20
    ## 39    10286                         QUICK-Stop 1996-08-21
    ## 40    10287                 Ricardo Adocicados 1996-08-22
    ## 41    10288                 Reggiani Caseifici 1996-08-23
    ## 42    10289                      B's Beverages 1996-08-26
    ## 43    10290                   Comércio Mineiro 1996-08-27
    ## 44    10291                        Que Delícia 1996-08-27
    ## 45    10292             Tradição Hipermercados 1996-08-28
    ## 46    10293                Tortuga Restaurante 1996-08-29
    ## 47    10294         Rattlesnake Canyon Grocery 1996-08-30
    ## 48    10295          Vins et alcools Chevalier 1996-09-02
    ## 49    10296                  LILA-Supermercado 1996-09-03
    ## 50    10297               Blondel père et fils 1996-09-04
    ## 51    10298       Hungry Owl All-Night Grocers 1996-09-05
    ## 52    10299                 Ricardo Adocicados 1996-09-06
    ## 53    10300       Magazzini Alimentari Riuniti 1996-09-09
    ## 54    10301                  Die Wandernde Kuh 1996-09-09
    ## 55    10302                   Suprêmes délices 1996-09-10
    ## 56    10303                Godos Cocina Típica 1996-09-11
    ## 57    10304                Tortuga Restaurante 1996-09-12
    ## 58    10305             Old World Delicatessen 1996-09-13
    ## 59    10306                   Romero y tomillo 1996-09-16
    ## 60    10307           Lonesome Pine Restaurant 1996-09-17
    ## 61    10308 Ana Trujillo Emparedados y helados 1996-09-18
    ## 62    10309       Hungry Owl All-Night Grocers 1996-09-19
    ## 63    10310                     The Big Cheese 1996-09-20
    ## 64    10311                    Du monde entier 1996-09-20
    ## 65    10312                  Die Wandernde Kuh 1996-09-23
    ## 66    10313                         QUICK-Stop 1996-09-24
    ## 67    10314         Rattlesnake Canyon Grocery 1996-09-25
    ## 68    10315                     Island Trading 1996-09-26
    ## 69    10316         Rattlesnake Canyon Grocery 1996-09-27
    ## 70    10317           Lonesome Pine Restaurant 1996-09-30
    ## 71    10318                     Island Trading 1996-10-01
    ## 72    10319                Tortuga Restaurante 1996-10-02
    ## 73    10320                     Wartian Herkku 1996-10-03
    ## 74    10321                     Island Trading 1996-10-03
    ## 75    10322          Pericles Comidas clásicas 1996-10-04
    ## 76    10323                    Königlich Essen 1996-10-07
    ## 77    10324                 Save-a-lot Markets 1996-10-08
    ## 78    10325                    Königlich Essen 1996-10-09
    ## 79    10326          Bólido Comidas preparadas 1996-10-10
    ## 80    10327                     Folk och fä HB 1996-10-11
    ## 81    10328     Furia Bacalhau e Frutos do Mar 1996-10-14
    ## 82    10329              Split Rail Beer & Ale 1996-10-15
    ## 83    10330                  LILA-Supermercado 1996-10-16
    ## 84    10331                           Bon app' 1996-10-16
    ## 85    10332                     Mère Paillarde 1996-10-17
    ## 86    10333                     Wartian Herkku 1996-10-18
    ## 87    10334               Victuailles en stock 1996-10-21
    ## 88    10335       Hungry Owl All-Night Grocers 1996-10-22
    ## 89    10336             Princesa Isabel Vinhos 1996-10-23
    ## 90    10337                     Frankenversand 1996-10-24
    ## 91    10338             Old World Delicatessen 1996-10-25
    ## 92    10339                     Mère Paillarde 1996-10-28
    ## 93    10340                           Bon app' 1996-10-29
    ## 94    10341                      Simons bistro 1996-10-29
    ## 95    10342                     Frankenversand 1996-10-30
    ## 96    10343                Lehmanns Marktstand 1996-10-31
    ## 97    10344               White Clover Markets 1996-11-01
    ## 98    10345                         QUICK-Stop 1996-11-04
    ## 99    10346         Rattlesnake Canyon Grocery 1996-11-05
    ## 100   10347                 Familia Arquibaldo 1996-11-06
    ## 101   10348                  Die Wandernde Kuh 1996-11-07
    ## 102   10349              Split Rail Beer & Ale 1996-11-08
    ## 103   10350                   La maison d'Asie 1996-11-11
    ## 104   10351                       Ernst Handel 1996-11-11
    ## 105   10352     Furia Bacalhau e Frutos do Mar 1996-11-12
    ## 106   10353                   Piccolo und mehr 1996-11-13
    ## 107   10354          Pericles Comidas clásicas 1996-11-14
    ## 108   10355                    Around the Horn 1996-11-15
    ## 109   10356                  Die Wandernde Kuh 1996-11-18
    ## 110   10357                  LILA-Supermercado 1996-11-19
    ## 111   10358                   La maison d'Asie 1996-11-20
    ## 112   10359                 Seven Seas Imports 1996-11-21
    ## 113   10360               Blondel père et fils 1996-11-22
    ## 114   10361                         QUICK-Stop 1996-11-22
    ## 115   10362                           Bon app' 1996-11-25
    ## 116   10363           Drachenblut Delikatessen 1996-11-26
    ## 117   10364                 Eastern Connection 1996-11-26
    ## 118   10365            Antonio Moreno Taquería 1996-11-27
    ## 119   10366             Galería del gastrónomo 1996-11-28
    ## 120   10367                       Vaffeljernet 1996-11-28
    ## 121   10368                       Ernst Handel 1996-11-29
    ## 122   10369              Split Rail Beer & Ale 1996-12-02
    ## 123   10370                  Chop-suey Chinese 1996-12-03
    ## 124   10371                   La maison d'Asie 1996-12-03
    ## 125   10372                      Queen Cozinha 1996-12-04
    ## 126   10373       Hungry Owl All-Night Grocers 1996-12-05
    ## 127   10374                     Wolski  Zajazd 1996-12-05
    ## 128   10375         Hungry Coyote Import Store 1996-12-06
    ## 129   10376                     Mère Paillarde 1996-12-09
    ## 130   10377                 Seven Seas Imports 1996-12-09
    ## 131   10378                     Folk och fä HB 1996-12-10
    ## 132   10379                        Que Delícia 1996-12-11
    ## 133   10380       Hungry Owl All-Night Grocers 1996-12-12
    ## 134   10381                  LILA-Supermercado 1996-12-12
    ## 135   10382                       Ernst Handel 1996-12-13
    ## 136   10383                    Around the Horn 1996-12-16
    ## 137   10384                 Berglunds snabbköp 1996-12-16
    ## 138   10385              Split Rail Beer & Ale 1996-12-17
    ## 139   10386                 Familia Arquibaldo 1996-12-18
    ## 140   10387                      Santé Gourmet 1996-12-18
    ## 141   10388                 Seven Seas Imports 1996-12-19
    ## 142   10389              Bottom-Dollar Markets 1996-12-20
    ## 143   10390                       Ernst Handel 1996-12-23
    ## 144   10391           Drachenblut Delikatessen 1996-12-23
    ## 145   10392                   Piccolo und mehr 1996-12-24
    ## 146   10393                 Save-a-lot Markets 1996-12-25
    ## 147   10394         Hungry Coyote Import Store 1996-12-25
    ## 148   10395                   HILARIÓN-Abastos 1996-12-26
    ## 149   10396                     Frankenversand 1996-12-27
    ## 150   10397             Princesa Isabel Vinhos 1996-12-27
    ## 151   10398                 Save-a-lot Markets 1996-12-30
    ## 152   10399                       Vaffeljernet 1996-12-31
    ## 153   10400                 Eastern Connection 1997-01-01
    ## 154   10401         Rattlesnake Canyon Grocery 1997-01-01
    ## 155   10402                       Ernst Handel 1997-01-02
    ## 156   10403                       Ernst Handel 1997-01-03
    ## 157   10404       Magazzini Alimentari Riuniti 1997-01-03
    ## 158   10405                   LINO-Delicateses 1997-01-06
    ## 159   10406                      Queen Cozinha 1997-01-07
    ## 160   10407                 Ottilies Käseladen 1997-01-07
    ## 161   10408                  Folies gourmandes 1997-01-08
    ## 162   10409             Océano Atlántico Ltda. 1997-01-09
    ## 163   10410              Bottom-Dollar Markets 1997-01-10
    ## 164   10411              Bottom-Dollar Markets 1997-01-10
    ## 165   10412                     Wartian Herkku 1997-01-13
    ## 166   10413                   La maison d'Asie 1997-01-14
    ## 167   10414                 Familia Arquibaldo 1997-01-14
    ## 168   10415         Hungry Coyote Import Store 1997-01-15
    ## 169   10416                     Wartian Herkku 1997-01-16
    ## 170   10417                      Simons bistro 1997-01-16
    ## 171   10418                         QUICK-Stop 1997-01-17
    ## 172   10419                 Richter Supermarkt 1997-01-20
    ## 173   10420             Wellington Importadora 1997-01-21
    ## 174   10421                        Que Delícia 1997-01-21
    ## 175   10422                     Franchi S.p.A. 1997-01-22
    ## 176   10423                Gourmet Lanchonetes 1997-01-23
    ## 177   10424                     Mère Paillarde 1997-01-23
    ## 178   10425                   La maison d'Asie 1997-01-24
    ## 179   10426             Galería del gastrónomo 1997-01-27
    ## 180   10427                   Piccolo und mehr 1997-01-27
    ## 181   10428                 Reggiani Caseifici 1997-01-28
    ## 182   10429       Hungry Owl All-Night Grocers 1997-01-29
    ## 183   10430                       Ernst Handel 1997-01-30
    ## 184   10431              Bottom-Dollar Markets 1997-01-30
    ## 185   10432              Split Rail Beer & Ale 1997-01-31
    ## 186   10433             Princesa Isabel Vinhos 1997-02-03
    ## 187   10434                     Folk och fä HB 1997-02-03
    ## 188   10435              Consolidated Holdings 1997-02-04
    ## 189   10436               Blondel père et fils 1997-02-05
    ## 190   10437                     Wartian Herkku 1997-02-05
    ## 191   10438                 Toms Spezialitäten 1997-02-06
    ## 192   10439                     Mère Paillarde 1997-02-07
    ## 193   10440                 Save-a-lot Markets 1997-02-10
    ## 194   10441             Old World Delicatessen 1997-02-10
    ## 195   10442                       Ernst Handel 1997-02-11
    ## 196   10443                 Reggiani Caseifici 1997-02-12
    ## 197   10444                 Berglunds snabbköp 1997-02-12
    ## 198   10445                 Berglunds snabbköp 1997-02-13
    ## 199   10446                 Toms Spezialitäten 1997-02-14
    ## 200   10447                 Ricardo Adocicados 1997-02-14
    ## 201   10448                      Rancho grande 1997-02-17
    ## 202   10449               Blondel père et fils 1997-02-18
    ## 203   10450               Victuailles en stock 1997-02-19
    ## 204   10451                         QUICK-Stop 1997-02-19
    ## 205   10452                 Save-a-lot Markets 1997-02-20
    ## 206   10453                    Around the Horn 1997-02-21
    ## 207   10454                   La maison d'Asie 1997-02-21
    ## 208   10455                     Wartian Herkku 1997-02-24
    ## 209   10456                    Königlich Essen 1997-02-25
    ## 210   10457                    Königlich Essen 1997-02-25
    ## 211   10458                   Suprêmes délices 1997-02-26
    ## 212   10459               Victuailles en stock 1997-02-27
    ## 213   10460                     Folk och fä HB 1997-02-28
    ## 214   10461                  LILA-Supermercado 1997-02-28
    ## 215   10462              Consolidated Holdings 1997-03-03
    ## 216   10463                   Suprêmes délices 1997-03-04
    ## 217   10464     Furia Bacalhau e Frutos do Mar 1997-03-04
    ## 218   10465                       Vaffeljernet 1997-03-05
    ## 219   10466                   Comércio Mineiro 1997-03-06
    ## 220   10467       Magazzini Alimentari Riuniti 1997-03-06
    ## 221   10468                    Königlich Essen 1997-03-07
    ## 222   10469               White Clover Markets 1997-03-10
    ## 223   10470                           Bon app' 1997-03-11
    ## 224   10471                      B's Beverages 1997-03-11
    ## 225   10472                 Seven Seas Imports 1997-03-12
    ## 226   10473                     Island Trading 1997-03-13
    ## 227   10474          Pericles Comidas clásicas 1997-03-13
    ## 228   10475                   Suprêmes délices 1997-03-14
    ## 229   10476                   HILARIÓN-Abastos 1997-03-17
    ## 230   10477             Princesa Isabel Vinhos 1997-03-17
    ## 231   10478               Victuailles en stock 1997-03-18
    ## 232   10479         Rattlesnake Canyon Grocery 1997-03-19
    ## 233   10480                  Folies gourmandes 1997-03-20
    ## 234   10481                 Ricardo Adocicados 1997-03-20
    ## 235   10482               Lazy K Kountry Store 1997-03-21
    ## 236   10483               White Clover Markets 1997-03-24
    ## 237   10484                      B's Beverages 1997-03-24
    ## 238   10485                   LINO-Delicateses 1997-03-25
    ## 239   10486                   HILARIÓN-Abastos 1997-03-26
    ## 240   10487                      Queen Cozinha 1997-03-26
    ## 241   10488                     Frankenversand 1997-03-27
    ## 242   10489                   Piccolo und mehr 1997-03-28
    ## 243   10490                   HILARIÓN-Abastos 1997-03-31
    ## 244   10491     Furia Bacalhau e Frutos do Mar 1997-03-31
    ## 245   10492              Bottom-Dollar Markets 1997-04-01
    ## 246   10493                   La maison d'Asie 1997-04-02
    ## 247   10494                   Comércio Mineiro 1997-04-02
    ## 248   10495      Laughing Bacchus Wine Cellars 1997-04-03
    ## 249   10496             Tradição Hipermercados 1997-04-04
    ## 250   10497                Lehmanns Marktstand 1997-04-04
    ## 251   10498                   HILARIÓN-Abastos 1997-04-07
    ## 252   10499                  LILA-Supermercado 1997-04-08
    ## 253   10500                   La maison d'Asie 1997-04-09
    ## 254   10501            Blauer See Delikatessen 1997-04-09
    ## 255   10502          Pericles Comidas clásicas 1997-04-10
    ## 256   10503       Hungry Owl All-Night Grocers 1997-04-11
    ## 257   10504               White Clover Markets 1997-04-11
    ## 258   10505                     Mère Paillarde 1997-04-14
    ## 259   10506                    Königlich Essen 1997-04-15
    ## 260   10507            Antonio Moreno Taquería 1997-04-15
    ## 261   10508                 Ottilies Käseladen 1997-04-16
    ## 262   10509            Blauer See Delikatessen 1997-04-17
    ## 263   10510                 Save-a-lot Markets 1997-04-18
    ## 264   10511                           Bon app' 1997-04-18
    ## 265   10512                 Familia Arquibaldo 1997-04-21
    ## 266   10513                  Die Wandernde Kuh 1997-04-22
    ## 267   10514                       Ernst Handel 1997-04-22
    ## 268   10515                         QUICK-Stop 1997-04-23
    ## 269   10516       Hungry Owl All-Night Grocers 1997-04-24
    ## 270   10517                        North/South 1997-04-24
    ## 271   10518                Tortuga Restaurante 1997-04-25
    ## 272   10519                  Chop-suey Chinese 1997-04-28
    ## 273   10520                      Santé Gourmet 1997-04-29
    ## 274   10521         Cactus Comidas para llevar 1997-04-29
    ## 275   10522                Lehmanns Marktstand 1997-04-30
    ## 276   10523                 Seven Seas Imports 1997-05-01
    ## 277   10524                 Berglunds snabbköp 1997-05-01
    ## 278   10525                           Bon app' 1997-05-02
    ## 279   10526                     Wartian Herkku 1997-05-05
    ## 280   10527                         QUICK-Stop 1997-05-05
    ## 281   10528            Great Lakes Food Market 1997-05-06
    ## 282   10529                       Maison Dewey 1997-05-07
    ## 283   10530                   Piccolo und mehr 1997-05-08
    ## 284   10531             Océano Atlántico Ltda. 1997-05-08
    ## 285   10532                 Eastern Connection 1997-05-09
    ## 286   10533                     Folk och fä HB 1997-05-12
    ## 287   10534                Lehmanns Marktstand 1997-05-12
    ## 288   10535            Antonio Moreno Taquería 1997-05-13
    ## 289   10536                Lehmanns Marktstand 1997-05-14
    ## 290   10537                 Richter Supermarkt 1997-05-14
    ## 291   10538                      B's Beverages 1997-05-15
    ## 292   10539                      B's Beverages 1997-05-16
    ## 293   10540                         QUICK-Stop 1997-05-19
    ## 294   10541                      Hanari Carnes 1997-05-19
    ## 295   10542                    Königlich Essen 1997-05-20
    ## 296   10543                  LILA-Supermercado 1997-05-21
    ## 297   10544           Lonesome Pine Restaurant 1997-05-21
    ## 298   10545               Lazy K Kountry Store 1997-05-22
    ## 299   10546               Victuailles en stock 1997-05-23
    ## 300   10547                 Seven Seas Imports 1997-05-23
    ## 301   10548                 Toms Spezialitäten 1997-05-26
    ## 302   10549                         QUICK-Stop 1997-05-27
    ## 303   10550                Godos Cocina Típica 1997-05-28
    ## 304   10551     Furia Bacalhau e Frutos do Mar 1997-05-28
    ## 305   10552                   HILARIÓN-Abastos 1997-05-29
    ## 306   10553                     Wartian Herkku 1997-05-30
    ## 307   10554                 Ottilies Käseladen 1997-05-30
    ## 308   10555                 Save-a-lot Markets 1997-06-02
    ## 309   10556                      Simons bistro 1997-06-03
    ## 310   10557                Lehmanns Marktstand 1997-06-03
    ## 311   10558                    Around the Horn 1997-06-04
    ## 312   10559               Blondel père et fils 1997-06-05
    ## 313   10560                     Frankenversand 1997-06-06
    ## 314   10561                     Folk och fä HB 1997-06-06
    ## 315   10562                 Reggiani Caseifici 1997-06-09
    ## 316   10563                 Ricardo Adocicados 1997-06-10
    ## 317   10564         Rattlesnake Canyon Grocery 1997-06-10
    ## 318   10565                     Mère Paillarde 1997-06-11
    ## 319   10566               Blondel père et fils 1997-06-12
    ## 320   10567       Hungry Owl All-Night Grocers 1997-06-12
    ## 321   10568             Galería del gastrónomo 1997-06-13
    ## 322   10569         Rattlesnake Canyon Grocery 1997-06-16
    ## 323   10570                     Mère Paillarde 1997-06-17
    ## 324   10571                       Ernst Handel 1997-06-17
    ## 325   10572                 Berglunds snabbköp 1997-06-18
    ## 326   10573            Antonio Moreno Taquería 1997-06-19
    ## 327   10574  Trail's Head Gourmet Provisioners 1997-06-19
    ## 328   10575             Morgenstern Gesundkost 1997-06-20
    ## 329   10576                Tortuga Restaurante 1997-06-23
    ## 330   10577  Trail's Head Gourmet Provisioners 1997-06-23
    ## 331   10578                      B's Beverages 1997-06-24
    ## 332   10579                  Let's Stop N Shop 1997-06-25
    ## 333   10580                 Ottilies Käseladen 1997-06-26
    ## 334   10581                 Familia Arquibaldo 1997-06-26
    ## 335   10582            Blauer See Delikatessen 1997-06-27
    ## 336   10583                     Wartian Herkku 1997-06-30
    ## 337   10584               Blondel père et fils 1997-06-30
    ## 338   10585             Wellington Importadora 1997-07-01
    ## 339   10586                 Reggiani Caseifici 1997-07-02
    ## 340   10587                        Que Delícia 1997-07-02
    ## 341   10588                         QUICK-Stop 1997-07-03
    ## 342   10589            Great Lakes Food Market 1997-07-04
    ## 343   10590                     Mère Paillarde 1997-07-07
    ## 344   10591                       Vaffeljernet 1997-07-07
    ## 345   10592                Lehmanns Marktstand 1997-07-08
    ## 346   10593                Lehmanns Marktstand 1997-07-09
    ## 347   10594             Old World Delicatessen 1997-07-09
    ## 348   10595                       Ernst Handel 1997-07-10
    ## 349   10596               White Clover Markets 1997-07-11
    ## 350   10597                   Piccolo und mehr 1997-07-11
    ## 351   10598         Rattlesnake Canyon Grocery 1997-07-14
    ## 352   10599                      B's Beverages 1997-07-15
    ## 353   10600         Hungry Coyote Import Store 1997-07-16
    ## 354   10601                   HILARIÓN-Abastos 1997-07-16
    ## 355   10602                       Vaffeljernet 1997-07-17
    ## 356   10603                 Save-a-lot Markets 1997-07-18
    ## 357   10604     Furia Bacalhau e Frutos do Mar 1997-07-18
    ## 358   10605                     Mère Paillarde 1997-07-21
    ## 359   10606             Tradição Hipermercados 1997-07-22
    ## 360   10607                 Save-a-lot Markets 1997-07-22
    ## 361   10608                 Toms Spezialitäten 1997-07-23
    ## 362   10609                    Du monde entier 1997-07-24
    ## 363   10610                   La maison d'Asie 1997-07-25
    ## 364   10611                     Wolski  Zajazd 1997-07-25
    ## 365   10612                 Save-a-lot Markets 1997-07-28
    ## 366   10613                   HILARIÓN-Abastos 1997-07-29
    ## 367   10614            Blauer See Delikatessen 1997-07-29
    ## 368   10615                        Wilman Kala 1997-07-30
    ## 369   10616            Great Lakes Food Market 1997-07-31
    ## 370   10617            Great Lakes Food Market 1997-07-31
    ## 371   10618                     Mère Paillarde 1997-08-01
    ## 372   10619                     Mère Paillarde 1997-08-04
    ## 373   10620      Laughing Bacchus Wine Cellars 1997-08-05
    ## 374   10621                     Island Trading 1997-08-05
    ## 375   10622                 Ricardo Adocicados 1997-08-06
    ## 376   10623                     Frankenversand 1997-08-07
    ## 377   10624                    The Cracker Box 1997-08-07
    ## 378   10625 Ana Trujillo Emparedados y helados 1997-08-08
    ## 379   10626                 Berglunds snabbköp 1997-08-11
    ## 380   10627                 Save-a-lot Markets 1997-08-11
    ## 381   10628               Blondel père et fils 1997-08-12
    ## 382   10629                Godos Cocina Típica 1997-08-12
    ## 383   10630                    Königlich Essen 1997-08-13
    ## 384   10631                   La maison d'Asie 1997-08-14
    ## 385   10632                  Die Wandernde Kuh 1997-08-14
    ## 386   10633                       Ernst Handel 1997-08-15
    ## 387   10634                  Folies gourmandes 1997-08-15
    ## 388   10635       Magazzini Alimentari Riuniti 1997-08-18
    ## 389   10636                     Wartian Herkku 1997-08-19
    ## 390   10637                      Queen Cozinha 1997-08-19
    ## 391   10638                   LINO-Delicateses 1997-08-20
    ## 392   10639                      Santé Gourmet 1997-08-20
    ## 393   10640                  Die Wandernde Kuh 1997-08-21
    ## 394   10641                   HILARIÓN-Abastos 1997-08-22
    ## 395   10642                      Simons bistro 1997-08-22
    ## 396   10643                Alfreds Futterkiste 1997-08-25
    ## 397   10644             Wellington Importadora 1997-08-25
    ## 398   10645                      Hanari Carnes 1997-08-26
    ## 399   10646       Hungry Owl All-Night Grocers 1997-08-27
    ## 400   10647                        Que Delícia 1997-08-27
    ## 401   10648                 Ricardo Adocicados 1997-08-28
    ## 402   10649                       Maison Dewey 1997-08-28
    ## 403   10650                 Familia Arquibaldo 1997-08-29
    ## 404   10651                  Die Wandernde Kuh 1997-09-01
    ## 405   10652                Gourmet Lanchonetes 1997-09-01
    ## 406   10653                     Frankenversand 1997-09-02
    ## 407   10654                 Berglunds snabbköp 1997-09-02
    ## 408   10655                 Reggiani Caseifici 1997-09-03
    ## 409   10656            Great Lakes Food Market 1997-09-04
    ## 410   10657                 Save-a-lot Markets 1997-09-04
    ## 411   10658                         QUICK-Stop 1997-09-05
    ## 412   10659                      Queen Cozinha 1997-09-05
    ## 413   10660         Hungry Coyote Import Store 1997-09-08
    ## 414   10661       Hungry Owl All-Night Grocers 1997-09-09
    ## 415   10662           Lonesome Pine Restaurant 1997-09-09
    ## 416   10663                           Bon app' 1997-09-10
    ## 417   10664     Furia Bacalhau e Frutos do Mar 1997-09-10
    ## 418   10665           Lonesome Pine Restaurant 1997-09-11
    ## 419   10666                 Richter Supermarkt 1997-09-12
    ## 420   10667                       Ernst Handel 1997-09-12
    ## 421   10668                  Die Wandernde Kuh 1997-09-15
    ## 422   10669                      Simons bistro 1997-09-15
    ## 423   10670                     Frankenversand 1997-09-16
    ## 424   10671                France restauration 1997-09-17
    ## 425   10672                 Berglunds snabbköp 1997-09-17
    ## 426   10673                        Wilman Kala 1997-09-18
    ## 427   10674                     Island Trading 1997-09-18
    ## 428   10675                     Frankenversand 1997-09-19
    ## 429   10676                Tortuga Restaurante 1997-09-22
    ## 430   10677            Antonio Moreno Taquería 1997-09-22
    ## 431   10678                 Save-a-lot Markets 1997-09-23
    ## 432   10679               Blondel père et fils 1997-09-23
    ## 433   10680             Old World Delicatessen 1997-09-24
    ## 434   10681            Great Lakes Food Market 1997-09-25
    ## 435   10682            Antonio Moreno Taquería 1997-09-25
    ## 436   10683                    Du monde entier 1997-09-26
    ## 437   10684                 Ottilies Käseladen 1997-09-26
    ## 438   10685                Gourmet Lanchonetes 1997-09-29
    ## 439   10686                   Piccolo und mehr 1997-09-30
    ## 440   10687       Hungry Owl All-Night Grocers 1997-09-30
    ## 441   10688                       Vaffeljernet 1997-10-01
    ## 442   10689                 Berglunds snabbköp 1997-10-01
    ## 443   10690                      Hanari Carnes 1997-10-02
    ## 444   10691                         QUICK-Stop 1997-10-03
    ## 445   10692                Alfreds Futterkiste 1997-10-03
    ## 446   10693               White Clover Markets 1997-10-06
    ## 447   10694                         QUICK-Stop 1997-10-06
    ## 448   10695                        Wilman Kala 1997-10-07
    ## 449   10696               White Clover Markets 1997-10-08
    ## 450   10697                   LINO-Delicateses 1997-10-08
    ## 451   10698                       Ernst Handel 1997-10-09
    ## 452   10699             Morgenstern Gesundkost 1997-10-09
    ## 453   10700                 Save-a-lot Markets 1997-10-10
    ## 454   10701       Hungry Owl All-Night Grocers 1997-10-13
    ## 455   10702                Alfreds Futterkiste 1997-10-13
    ## 456   10703                     Folk och fä HB 1997-10-14
    ## 457   10704                      Queen Cozinha 1997-10-14
    ## 458   10705                   HILARIÓN-Abastos 1997-10-15
    ## 459   10706             Old World Delicatessen 1997-10-16
    ## 460   10707                    Around the Horn 1997-10-16
    ## 461   10708                     The Big Cheese 1997-10-17
    ## 462   10709                Gourmet Lanchonetes 1997-10-17
    ## 463   10710                     Franchi S.p.A. 1997-10-20
    ## 464   10711                 Save-a-lot Markets 1997-10-21
    ## 465   10712       Hungry Owl All-Night Grocers 1997-10-21
    ## 466   10713                 Save-a-lot Markets 1997-10-22
    ## 467   10714                 Save-a-lot Markets 1997-10-22
    ## 468   10715                           Bon app' 1997-10-23
    ## 469   10716                      Rancho grande 1997-10-24
    ## 470   10717                     Frankenversand 1997-10-24
    ## 471   10718                    Königlich Essen 1997-10-27
    ## 472   10719                  Let's Stop N Shop 1997-10-27
    ## 473   10720                        Que Delícia 1997-10-28
    ## 474   10721                         QUICK-Stop 1997-10-29
    ## 475   10722                 Save-a-lot Markets 1997-10-29
    ## 476   10723               White Clover Markets 1997-10-30
    ## 477   10724                     Mère Paillarde 1997-10-30
    ## 478   10725                 Familia Arquibaldo 1997-10-31
    ## 479   10726                 Eastern Connection 1997-11-03
    ## 480   10727                 Reggiani Caseifici 1997-11-03
    ## 481   10728                      Queen Cozinha 1997-11-04
    ## 482   10729                   LINO-Delicateses 1997-11-04
    ## 483   10730                           Bon app' 1997-11-05
    ## 484   10731                  Chop-suey Chinese 1997-11-06
    ## 485   10732                           Bon app' 1997-11-06
    ## 486   10733                 Berglunds snabbköp 1997-11-07
    ## 487   10734                Gourmet Lanchonetes 1997-11-07
    ## 488   10735                  Let's Stop N Shop 1997-11-10
    ## 489   10736       Hungry Owl All-Night Grocers 1997-11-11
    ## 490   10737          Vins et alcools Chevalier 1997-11-11
    ## 491   10738               Spécialités du monde 1997-11-12
    ## 492   10739          Vins et alcools Chevalier 1997-11-12
    ## 493   10740               White Clover Markets 1997-11-13
    ## 494   10741                    Around the Horn 1997-11-14
    ## 495   10742              Bottom-Dollar Markets 1997-11-14
    ## 496   10743                    Around the Horn 1997-11-17
    ## 497   10744                       Vaffeljernet 1997-11-17
    ## 498   10745                         QUICK-Stop 1997-11-18
    ## 499   10746                  Chop-suey Chinese 1997-11-19
    ## 500   10747                   Piccolo und mehr 1997-11-19
    ## 501   10748                 Save-a-lot Markets 1997-11-20
    ## 502   10749                     Island Trading 1997-11-20
    ## 503   10750                     Wartian Herkku 1997-11-21
    ## 504   10751                 Richter Supermarkt 1997-11-24
    ## 505   10752                        North/South 1997-11-24
    ## 506   10753                     Franchi S.p.A. 1997-11-25
    ## 507   10754       Magazzini Alimentari Riuniti 1997-11-25
    ## 508   10755                           Bon app' 1997-11-26
    ## 509   10756              Split Rail Beer & Ale 1997-11-27
    ## 510   10757                 Save-a-lot Markets 1997-11-27
    ## 511   10758                 Richter Supermarkt 1997-11-28
    ## 512   10759 Ana Trujillo Emparedados y helados 1997-11-28
    ## 513   10760                       Maison Dewey 1997-12-01
    ## 514   10761         Rattlesnake Canyon Grocery 1997-12-02
    ## 515   10762                     Folk och fä HB 1997-12-02
    ## 516   10763                  Folies gourmandes 1997-12-03
    ## 517   10764                       Ernst Handel 1997-12-03
    ## 518   10765                         QUICK-Stop 1997-12-04
    ## 519   10766                 Ottilies Käseladen 1997-12-05
    ## 520   10767                   Suprêmes délices 1997-12-05
    ## 521   10768                    Around the Horn 1997-12-08
    ## 522   10769                       Vaffeljernet 1997-12-08
    ## 523   10770                      Hanari Carnes 1997-12-09
    ## 524   10771                       Ernst Handel 1997-12-10
    ## 525   10772                Lehmanns Marktstand 1997-12-10
    ## 526   10773                       Ernst Handel 1997-12-11
    ## 527   10774                     Folk och fä HB 1997-12-11
    ## 528   10775                    The Cracker Box 1997-12-12
    ## 529   10776                       Ernst Handel 1997-12-15
    ## 530   10777                Gourmet Lanchonetes 1997-12-15
    ## 531   10778                 Berglunds snabbköp 1997-12-16
    ## 532   10779             Morgenstern Gesundkost 1997-12-16
    ## 533   10780                  LILA-Supermercado 1997-12-16
    ## 534   10781                     Wartian Herkku 1997-12-17
    ## 535   10782         Cactus Comidas para llevar 1997-12-17
    ## 536   10783                      Hanari Carnes 1997-12-18
    ## 537   10784       Magazzini Alimentari Riuniti 1997-12-18
    ## 538   10785               GROSELLA-Restaurante 1997-12-18
    ## 539   10786                      Queen Cozinha 1997-12-19
    ## 540   10787                   La maison d'Asie 1997-12-19
    ## 541   10788                         QUICK-Stop 1997-12-22
    ## 542   10789                  Folies gourmandes 1997-12-22
    ## 543   10790                Gourmet Lanchonetes 1997-12-22
    ## 544   10791                     Frankenversand 1997-12-23
    ## 545   10792                     Wolski  Zajazd 1997-12-23
    ## 546   10793                    Around the Horn 1997-12-24
    ## 547   10794                        Que Delícia 1997-12-24
    ## 548   10795                       Ernst Handel 1997-12-24
    ## 549   10796                   HILARIÓN-Abastos 1997-12-25
    ## 550   10797           Drachenblut Delikatessen 1997-12-25
    ## 551   10798                     Island Trading 1997-12-26
    ## 552   10799                    Königlich Essen 1997-12-26
    ## 553   10800                 Seven Seas Imports 1997-12-26
    ## 554   10801          Bólido Comidas preparadas 1997-12-29
    ## 555   10802                      Simons bistro 1997-12-29
    ## 556   10803             Wellington Importadora 1997-12-30
    ## 557   10804                 Seven Seas Imports 1997-12-30
    ## 558   10805                     The Big Cheese 1997-12-30
    ## 559   10806               Victuailles en stock 1997-12-31
    ## 560   10807                     Franchi S.p.A. 1997-12-31
    ## 561   10808             Princesa Isabel Vinhos 1998-01-01
    ## 562   10809             Wellington Importadora 1998-01-01
    ## 563   10810      Laughing Bacchus Wine Cellars 1998-01-01
    ## 564   10811                   LINO-Delicateses 1998-01-02
    ## 565   10812                 Reggiani Caseifici 1998-01-02
    ## 566   10813                 Ricardo Adocicados 1998-01-05
    ## 567   10814               Victuailles en stock 1998-01-05
    ## 568   10815                 Save-a-lot Markets 1998-01-05
    ## 569   10816            Great Lakes Food Market 1998-01-06
    ## 570   10817                    Königlich Essen 1998-01-06
    ## 571   10818       Magazzini Alimentari Riuniti 1998-01-07
    ## 572   10819         Cactus Comidas para llevar 1998-01-07
    ## 573   10820         Rattlesnake Canyon Grocery 1998-01-07
    ## 574   10821              Split Rail Beer & Ale 1998-01-08
    ## 575   10822  Trail's Head Gourmet Provisioners 1998-01-08
    ## 576   10823                  LILA-Supermercado 1998-01-09
    ## 577   10824                     Folk och fä HB 1998-01-09
    ## 578   10825           Drachenblut Delikatessen 1998-01-09
    ## 579   10826               Blondel père et fils 1998-01-12
    ## 580   10827                           Bon app' 1998-01-12
    ## 581   10828                      Rancho grande 1998-01-13
    ## 582   10829                     Island Trading 1998-01-13
    ## 583   10830             Tradição Hipermercados 1998-01-13
    ## 584   10831                      Santé Gourmet 1998-01-14
    ## 585   10832                   La maison d'Asie 1998-01-14
    ## 586   10833                 Ottilies Käseladen 1998-01-15
    ## 587   10834             Tradição Hipermercados 1998-01-15
    ## 588   10835                Alfreds Futterkiste 1998-01-15
    ## 589   10836                       Ernst Handel 1998-01-16
    ## 590   10837                 Berglunds snabbköp 1998-01-16
    ## 591   10838                   LINO-Delicateses 1998-01-19
    ## 592   10839             Tradição Hipermercados 1998-01-19
    ## 593   10840                   LINO-Delicateses 1998-01-19
    ## 594   10841                   Suprêmes délices 1998-01-20
    ## 595   10842                Tortuga Restaurante 1998-01-20
    ## 596   10843               Victuailles en stock 1998-01-21
    ## 597   10844                   Piccolo und mehr 1998-01-21
    ## 598   10845                         QUICK-Stop 1998-01-21
    ## 599   10846                   Suprêmes délices 1998-01-22
    ## 600   10847                 Save-a-lot Markets 1998-01-22
    ## 601   10848              Consolidated Holdings 1998-01-23
    ## 602   10849                    Königlich Essen 1998-01-23
    ## 603   10850               Victuailles en stock 1998-01-23
    ## 604   10851                 Ricardo Adocicados 1998-01-26
    ## 605   10852         Rattlesnake Canyon Grocery 1998-01-26
    ## 606   10853            Blauer See Delikatessen 1998-01-27
    ## 607   10854                       Ernst Handel 1998-01-27
    ## 608   10855             Old World Delicatessen 1998-01-27
    ## 609   10856            Antonio Moreno Taquería 1998-01-28
    ## 610   10857                 Berglunds snabbköp 1998-01-28
    ## 611   10858               La corne d'abondance 1998-01-29
    ## 612   10859                     Frankenversand 1998-01-29
    ## 613   10860                France restauration 1998-01-29
    ## 614   10861               White Clover Markets 1998-01-30
    ## 615   10862                Lehmanns Marktstand 1998-01-30
    ## 616   10863                   HILARIÓN-Abastos 1998-02-02
    ## 617   10864                    Around the Horn 1998-02-02
    ## 618   10865                         QUICK-Stop 1998-02-02
    ## 619   10866                 Berglunds snabbköp 1998-02-03
    ## 620   10867           Lonesome Pine Restaurant 1998-02-03
    ## 621   10868                      Queen Cozinha 1998-02-04
    ## 622   10869                 Seven Seas Imports 1998-02-04
    ## 623   10870                     Wolski  Zajazd 1998-02-04
    ## 624   10871                           Bon app' 1998-02-05
    ## 625   10872                Godos Cocina Típica 1998-02-05
    ## 626   10873                        Wilman Kala 1998-02-06
    ## 627   10874                Godos Cocina Típica 1998-02-06
    ## 628   10875                 Berglunds snabbköp 1998-02-06
    ## 629   10876                           Bon app' 1998-02-09
    ## 630   10877                 Ricardo Adocicados 1998-02-09
    ## 631   10878                         QUICK-Stop 1998-02-10
    ## 632   10879                        Wilman Kala 1998-02-10
    ## 633   10880                     Folk och fä HB 1998-02-10
    ## 634   10881         Cactus Comidas para llevar 1998-02-11
    ## 635   10882                 Save-a-lot Markets 1998-02-11
    ## 636   10883           Lonesome Pine Restaurant 1998-02-12
    ## 637   10884                  Let's Stop N Shop 1998-02-12
    ## 638   10885                   Suprêmes délices 1998-02-12
    ## 639   10886                      Hanari Carnes 1998-02-13
    ## 640   10887             Galería del gastrónomo 1998-02-13
    ## 641   10888                Godos Cocina Típica 1998-02-16
    ## 642   10889         Rattlesnake Canyon Grocery 1998-02-16
    ## 643   10890                    Du monde entier 1998-02-16
    ## 644   10891                Lehmanns Marktstand 1998-02-17
    ## 645   10892                       Maison Dewey 1998-02-17
    ## 646   10893                    Königlich Essen 1998-02-18
    ## 647   10894                 Save-a-lot Markets 1998-02-18
    ## 648   10895                       Ernst Handel 1998-02-18
    ## 649   10896                       Maison Dewey 1998-02-19
    ## 650   10897       Hungry Owl All-Night Grocers 1998-02-19
    ## 651   10898             Océano Atlántico Ltda. 1998-02-20
    ## 652   10899                  LILA-Supermercado 1998-02-20
    ## 653   10900             Wellington Importadora 1998-02-20
    ## 654   10901                   HILARIÓN-Abastos 1998-02-23
    ## 655   10902                     Folk och fä HB 1998-02-23
    ## 656   10903                      Hanari Carnes 1998-02-24
    ## 657   10904               White Clover Markets 1998-02-24
    ## 658   10905             Wellington Importadora 1998-02-24
    ## 659   10906                     Wolski  Zajazd 1998-02-25
    ## 660   10907               Spécialités du monde 1998-02-25
    ## 661   10908                 Reggiani Caseifici 1998-02-26
    ## 662   10909                      Santé Gourmet 1998-02-26
    ## 663   10910                        Wilman Kala 1998-02-26
    ## 664   10911                Godos Cocina Típica 1998-02-26
    ## 665   10912       Hungry Owl All-Night Grocers 1998-02-26
    ## 666   10913                      Queen Cozinha 1998-02-26
    ## 667   10914                      Queen Cozinha 1998-02-27
    ## 668   10915                Tortuga Restaurante 1998-02-27
    ## 669   10916                      Rancho grande 1998-02-27
    ## 670   10917                   Romero y tomillo 1998-03-02
    ## 671   10918              Bottom-Dollar Markets 1998-03-02
    ## 672   10919                   LINO-Delicateses 1998-03-02
    ## 673   10920                    Around the Horn 1998-03-03
    ## 674   10921                       Vaffeljernet 1998-03-03
    ## 675   10922                      Hanari Carnes 1998-03-03
    ## 676   10923                   La maison d'Asie 1998-03-03
    ## 677   10924                 Berglunds snabbköp 1998-03-04
    ## 678   10925                      Hanari Carnes 1998-03-04
    ## 679   10926 Ana Trujillo Emparedados y helados 1998-03-04
    ## 680   10927               La corne d'abondance 1998-03-05
    ## 681   10928             Galería del gastrónomo 1998-03-05
    ## 682   10929                     Frankenversand 1998-03-05
    ## 683   10930                   Suprêmes délices 1998-03-06
    ## 684   10931                 Richter Supermarkt 1998-03-06
    ## 685   10932                           Bon app' 1998-03-06
    ## 686   10933                     Island Trading 1998-03-06
    ## 687   10934                Lehmanns Marktstand 1998-03-09
    ## 688   10935             Wellington Importadora 1998-03-09
    ## 689   10936            Great Lakes Food Market 1998-03-09
    ## 690   10937         Cactus Comidas para llevar 1998-03-10
    ## 691   10938                         QUICK-Stop 1998-03-10
    ## 692   10939       Magazzini Alimentari Riuniti 1998-03-10
    ## 693   10940                           Bon app' 1998-03-11
    ## 694   10941                 Save-a-lot Markets 1998-03-11
    ## 695   10942                 Reggiani Caseifici 1998-03-11
    ## 696   10943                      B's Beverages 1998-03-11
    ## 697   10944              Bottom-Dollar Markets 1998-03-12
    ## 698   10945             Morgenstern Gesundkost 1998-03-12
    ## 699   10946                       Vaffeljernet 1998-03-12
    ## 700   10947                      B's Beverages 1998-03-13
    ## 701   10948                Godos Cocina Típica 1998-03-13
    ## 702   10949              Bottom-Dollar Markets 1998-03-13
    ## 703   10950       Magazzini Alimentari Riuniti 1998-03-16
    ## 704   10951                 Richter Supermarkt 1998-03-16
    ## 705   10952                Alfreds Futterkiste 1998-03-16
    ## 706   10953                    Around the Horn 1998-03-16
    ## 707   10954                   LINO-Delicateses 1998-03-17
    ## 708   10955                     Folk och fä HB 1998-03-17
    ## 709   10956            Blauer See Delikatessen 1998-03-17
    ## 710   10957                   HILARIÓN-Abastos 1998-03-18
    ## 711   10958             Océano Atlántico Ltda. 1998-03-18
    ## 712   10959                Gourmet Lanchonetes 1998-03-18
    ## 713   10960                   HILARIÓN-Abastos 1998-03-19
    ## 714   10961                      Queen Cozinha 1998-03-19
    ## 715   10962                         QUICK-Stop 1998-03-19
    ## 716   10963     Furia Bacalhau e Frutos do Mar 1998-03-19
    ## 717   10964               Spécialités du monde 1998-03-20
    ## 718   10965             Old World Delicatessen 1998-03-20
    ## 719   10966                  Chop-suey Chinese 1998-03-20
    ## 720   10967                 Toms Spezialitäten 1998-03-23
    ## 721   10968                       Ernst Handel 1998-03-23
    ## 722   10969                   Comércio Mineiro 1998-03-23
    ## 723   10970          Bólido Comidas preparadas 1998-03-24
    ## 724   10971                France restauration 1998-03-24
    ## 725   10972               La corne d'abondance 1998-03-24
    ## 726   10973               La corne d'abondance 1998-03-24
    ## 727   10974              Split Rail Beer & Ale 1998-03-25
    ## 728   10975              Bottom-Dollar Markets 1998-03-25
    ## 729   10976                   HILARIÓN-Abastos 1998-03-25
    ## 730   10977                     Folk och fä HB 1998-03-26
    ## 731   10978                       Maison Dewey 1998-03-26
    ## 732   10979                       Ernst Handel 1998-03-26
    ## 733   10980                     Folk och fä HB 1998-03-27
    ## 734   10981                      Hanari Carnes 1998-03-27
    ## 735   10982              Bottom-Dollar Markets 1998-03-27
    ## 736   10983                 Save-a-lot Markets 1998-03-27
    ## 737   10984                 Save-a-lot Markets 1998-03-30
    ## 738   10985       Hungry Owl All-Night Grocers 1998-03-30
    ## 739   10986             Océano Atlántico Ltda. 1998-03-30
    ## 740   10987                 Eastern Connection 1998-03-31
    ## 741   10988         Rattlesnake Canyon Grocery 1998-03-31
    ## 742   10989                        Que Delícia 1998-03-31
    ## 743   10990                       Ernst Handel 1998-04-01
    ## 744   10991                         QUICK-Stop 1998-04-01
    ## 745   10992                     The Big Cheese 1998-04-01
    ## 746   10993                     Folk och fä HB 1998-04-01
    ## 747   10994                       Vaffeljernet 1998-04-02
    ## 748   10995          Pericles Comidas clásicas 1998-04-02
    ## 749   10996                         QUICK-Stop 1998-04-02
    ## 750   10997                  LILA-Supermercado 1998-04-03
    ## 751   10998                     Wolski  Zajazd 1998-04-03
    ## 752   10999                 Ottilies Käseladen 1998-04-03
    ## 753   11000         Rattlesnake Canyon Grocery 1998-04-06
    ## 754   11001                     Folk och fä HB 1998-04-06
    ## 755   11002                 Save-a-lot Markets 1998-04-06
    ## 756   11003                    The Cracker Box 1998-04-06
    ## 757   11004                       Maison Dewey 1998-04-07
    ## 758   11005                        Wilman Kala 1998-04-07
    ## 759   11006            Great Lakes Food Market 1998-04-07
    ## 760   11007             Princesa Isabel Vinhos 1998-04-08
    ## 761   11008                       Ernst Handel 1998-04-08
    ## 762   11009                Godos Cocina Típica 1998-04-08
    ## 763   11010                 Reggiani Caseifici 1998-04-09
    ## 764   11011                Alfreds Futterkiste 1998-04-09
    ## 765   11012                     Frankenversand 1998-04-09
    ## 766   11013                   Romero y tomillo 1998-04-09
    ## 767   11014                   LINO-Delicateses 1998-04-10
    ## 768   11015                      Santé Gourmet 1998-04-10
    ## 769   11016                    Around the Horn 1998-04-10
    ## 770   11017                       Ernst Handel 1998-04-13
    ## 771   11018           Lonesome Pine Restaurant 1998-04-13
    ## 772   11019                      Rancho grande 1998-04-13
    ## 773   11020                 Ottilies Käseladen 1998-04-14
    ## 774   11021                         QUICK-Stop 1998-04-14
    ## 775   11022                      Hanari Carnes 1998-04-14
    ## 776   11023                      B's Beverages 1998-04-14
    ## 777   11024                 Eastern Connection 1998-04-15
    ## 778   11025                     Wartian Herkku 1998-04-15
    ## 779   11026                     Franchi S.p.A. 1998-04-15
    ## 780   11027              Bottom-Dollar Markets 1998-04-16
    ## 781   11028                    Königlich Essen 1998-04-16
    ## 782   11029                  Chop-suey Chinese 1998-04-16
    ## 783   11030                 Save-a-lot Markets 1998-04-17
    ## 784   11031                 Save-a-lot Markets 1998-04-17
    ## 785   11032               White Clover Markets 1998-04-17
    ## 786   11033                 Richter Supermarkt 1998-04-17
    ## 787   11034             Old World Delicatessen 1998-04-20
    ## 788   11035                   Suprêmes délices 1998-04-20
    ## 789   11036           Drachenblut Delikatessen 1998-04-20
    ## 790   11037                Godos Cocina Típica 1998-04-21
    ## 791   11038                   Suprêmes délices 1998-04-21
    ## 792   11039                   LINO-Delicateses 1998-04-21
    ## 793   11040            Great Lakes Food Market 1998-04-22
    ## 794   11041                  Chop-suey Chinese 1998-04-22
    ## 795   11042                   Comércio Mineiro 1998-04-22
    ## 796   11043               Spécialités du monde 1998-04-22
    ## 797   11044                     Wolski  Zajazd 1998-04-23
    ## 798   11045              Bottom-Dollar Markets 1998-04-23
    ## 799   11046                  Die Wandernde Kuh 1998-04-23
    ## 800   11047                 Eastern Connection 1998-04-24
    ## 801   11048              Bottom-Dollar Markets 1998-04-24
    ## 802   11049                Gourmet Lanchonetes 1998-04-24
    ## 803   11050                     Folk och fä HB 1998-04-27
    ## 804   11051                   La maison d'Asie 1998-04-27
    ## 805   11052                      Hanari Carnes 1998-04-27
    ## 806   11053                   Piccolo und mehr 1998-04-27
    ## 807   11054         Cactus Comidas para llevar 1998-04-28
    ## 808   11055                   HILARIÓN-Abastos 1998-04-28
    ## 809   11056                 Eastern Connection 1998-04-28
    ## 810   11057                        North/South 1998-04-29
    ## 811   11058            Blauer See Delikatessen 1998-04-29
    ## 812   11059                 Ricardo Adocicados 1998-04-29
    ## 813   11060                     Franchi S.p.A. 1998-04-30
    ## 814   11061            Great Lakes Food Market 1998-04-30
    ## 815   11062                 Reggiani Caseifici 1998-04-30
    ## 816   11063       Hungry Owl All-Night Grocers 1998-04-30
    ## 817   11064                 Save-a-lot Markets 1998-05-01
    ## 818   11065                  LILA-Supermercado 1998-05-01
    ## 819   11066               White Clover Markets 1998-05-01
    ## 820   11067           Drachenblut Delikatessen 1998-05-04
    ## 821   11068                      Queen Cozinha 1998-05-04
    ## 822   11069                Tortuga Restaurante 1998-05-04
    ## 823   11070                Lehmanns Marktstand 1998-05-05
    ## 824   11071                  LILA-Supermercado 1998-05-05
    ## 825   11072                       Ernst Handel 1998-05-05
    ## 826   11073          Pericles Comidas clásicas 1998-05-05
    ## 827   11074                      Simons bistro 1998-05-06
    ## 828   11075                 Richter Supermarkt 1998-05-06
    ## 829   11076                           Bon app' 1998-05-06
    ## 830   11077         Rattlesnake Canyon Grocery 1998-05-06

``` r
sqldf("SELECT O.OrderID,C.CompanyName,O.OrderDate
       FROM Orders AS O
       LEFT JOIN Customers As C
      USING(CustomerID);")
```

    ##     OrderID                        CompanyName  OrderDate
    ## 1     10248                        Wilman Kala 1996-07-04
    ## 2     10249             Tradição Hipermercados 1996-07-05
    ## 3     10250                      Hanari Carnes 1996-07-08
    ## 4     10251               Victuailles en stock 1996-07-08
    ## 5     10252                   Suprêmes délices 1996-07-09
    ## 6     10253                      Hanari Carnes 1996-07-10
    ## 7     10254                  Chop-suey Chinese 1996-07-11
    ## 8     10255                 Richter Supermarkt 1996-07-12
    ## 9     10256             Wellington Importadora 1996-07-15
    ## 10    10257                   HILARIÓN-Abastos 1996-07-16
    ## 11    10258                       Ernst Handel 1996-07-17
    ## 12    10259         Centro comercial Moctezuma 1996-07-18
    ## 13    10260             Old World Delicatessen 1996-07-19
    ## 14    10261                        Que Delícia 1996-07-19
    ## 15    10262         Rattlesnake Canyon Grocery 1996-07-22
    ## 16    10263                       Ernst Handel 1996-07-23
    ## 17    10264                     Folk och fä HB 1996-07-24
    ## 18    10265               Blondel père et fils 1996-07-25
    ## 19    10266                     Wartian Herkku 1996-07-26
    ## 20    10267                     Frankenversand 1996-07-29
    ## 21    10268               GROSELLA-Restaurante 1996-07-30
    ## 22    10269               White Clover Markets 1996-07-31
    ## 23    10270                     Wartian Herkku 1996-08-01
    ## 24    10271              Split Rail Beer & Ale 1996-08-01
    ## 25    10272         Rattlesnake Canyon Grocery 1996-08-02
    ## 26    10273                         QUICK-Stop 1996-08-05
    ## 27    10274          Vins et alcools Chevalier 1996-08-06
    ## 28    10275       Magazzini Alimentari Riuniti 1996-08-07
    ## 29    10276                Tortuga Restaurante 1996-08-08
    ## 30    10277             Morgenstern Gesundkost 1996-08-09
    ## 31    10278                 Berglunds snabbköp 1996-08-12
    ## 32    10279                Lehmanns Marktstand 1996-08-13
    ## 33    10280                 Berglunds snabbköp 1996-08-14
    ## 34    10281                   Romero y tomillo 1996-08-14
    ## 35    10282                   Romero y tomillo 1996-08-15
    ## 36    10283                  LILA-Supermercado 1996-08-16
    ## 37    10284                Lehmanns Marktstand 1996-08-19
    ## 38    10285                         QUICK-Stop 1996-08-20
    ## 39    10286                         QUICK-Stop 1996-08-21
    ## 40    10287                 Ricardo Adocicados 1996-08-22
    ## 41    10288                 Reggiani Caseifici 1996-08-23
    ## 42    10289                      B's Beverages 1996-08-26
    ## 43    10290                   Comércio Mineiro 1996-08-27
    ## 44    10291                        Que Delícia 1996-08-27
    ## 45    10292             Tradição Hipermercados 1996-08-28
    ## 46    10293                Tortuga Restaurante 1996-08-29
    ## 47    10294         Rattlesnake Canyon Grocery 1996-08-30
    ## 48    10295          Vins et alcools Chevalier 1996-09-02
    ## 49    10296                  LILA-Supermercado 1996-09-03
    ## 50    10297               Blondel père et fils 1996-09-04
    ## 51    10298       Hungry Owl All-Night Grocers 1996-09-05
    ## 52    10299                 Ricardo Adocicados 1996-09-06
    ## 53    10300       Magazzini Alimentari Riuniti 1996-09-09
    ## 54    10301                  Die Wandernde Kuh 1996-09-09
    ## 55    10302                   Suprêmes délices 1996-09-10
    ## 56    10303                Godos Cocina Típica 1996-09-11
    ## 57    10304                Tortuga Restaurante 1996-09-12
    ## 58    10305             Old World Delicatessen 1996-09-13
    ## 59    10306                   Romero y tomillo 1996-09-16
    ## 60    10307           Lonesome Pine Restaurant 1996-09-17
    ## 61    10308 Ana Trujillo Emparedados y helados 1996-09-18
    ## 62    10309       Hungry Owl All-Night Grocers 1996-09-19
    ## 63    10310                     The Big Cheese 1996-09-20
    ## 64    10311                    Du monde entier 1996-09-20
    ## 65    10312                  Die Wandernde Kuh 1996-09-23
    ## 66    10313                         QUICK-Stop 1996-09-24
    ## 67    10314         Rattlesnake Canyon Grocery 1996-09-25
    ## 68    10315                     Island Trading 1996-09-26
    ## 69    10316         Rattlesnake Canyon Grocery 1996-09-27
    ## 70    10317           Lonesome Pine Restaurant 1996-09-30
    ## 71    10318                     Island Trading 1996-10-01
    ## 72    10319                Tortuga Restaurante 1996-10-02
    ## 73    10320                     Wartian Herkku 1996-10-03
    ## 74    10321                     Island Trading 1996-10-03
    ## 75    10322          Pericles Comidas clásicas 1996-10-04
    ## 76    10323                    Königlich Essen 1996-10-07
    ## 77    10324                 Save-a-lot Markets 1996-10-08
    ## 78    10325                    Königlich Essen 1996-10-09
    ## 79    10326          Bólido Comidas preparadas 1996-10-10
    ## 80    10327                     Folk och fä HB 1996-10-11
    ## 81    10328     Furia Bacalhau e Frutos do Mar 1996-10-14
    ## 82    10329              Split Rail Beer & Ale 1996-10-15
    ## 83    10330                  LILA-Supermercado 1996-10-16
    ## 84    10331                           Bon app' 1996-10-16
    ## 85    10332                     Mère Paillarde 1996-10-17
    ## 86    10333                     Wartian Herkku 1996-10-18
    ## 87    10334               Victuailles en stock 1996-10-21
    ## 88    10335       Hungry Owl All-Night Grocers 1996-10-22
    ## 89    10336             Princesa Isabel Vinhos 1996-10-23
    ## 90    10337                     Frankenversand 1996-10-24
    ## 91    10338             Old World Delicatessen 1996-10-25
    ## 92    10339                     Mère Paillarde 1996-10-28
    ## 93    10340                           Bon app' 1996-10-29
    ## 94    10341                      Simons bistro 1996-10-29
    ## 95    10342                     Frankenversand 1996-10-30
    ## 96    10343                Lehmanns Marktstand 1996-10-31
    ## 97    10344               White Clover Markets 1996-11-01
    ## 98    10345                         QUICK-Stop 1996-11-04
    ## 99    10346         Rattlesnake Canyon Grocery 1996-11-05
    ## 100   10347                 Familia Arquibaldo 1996-11-06
    ## 101   10348                  Die Wandernde Kuh 1996-11-07
    ## 102   10349              Split Rail Beer & Ale 1996-11-08
    ## 103   10350                   La maison d'Asie 1996-11-11
    ## 104   10351                       Ernst Handel 1996-11-11
    ## 105   10352     Furia Bacalhau e Frutos do Mar 1996-11-12
    ## 106   10353                   Piccolo und mehr 1996-11-13
    ## 107   10354          Pericles Comidas clásicas 1996-11-14
    ## 108   10355                    Around the Horn 1996-11-15
    ## 109   10356                  Die Wandernde Kuh 1996-11-18
    ## 110   10357                  LILA-Supermercado 1996-11-19
    ## 111   10358                   La maison d'Asie 1996-11-20
    ## 112   10359                 Seven Seas Imports 1996-11-21
    ## 113   10360               Blondel père et fils 1996-11-22
    ## 114   10361                         QUICK-Stop 1996-11-22
    ## 115   10362                           Bon app' 1996-11-25
    ## 116   10363           Drachenblut Delikatessen 1996-11-26
    ## 117   10364                 Eastern Connection 1996-11-26
    ## 118   10365            Antonio Moreno Taquería 1996-11-27
    ## 119   10366             Galería del gastrónomo 1996-11-28
    ## 120   10367                       Vaffeljernet 1996-11-28
    ## 121   10368                       Ernst Handel 1996-11-29
    ## 122   10369              Split Rail Beer & Ale 1996-12-02
    ## 123   10370                  Chop-suey Chinese 1996-12-03
    ## 124   10371                   La maison d'Asie 1996-12-03
    ## 125   10372                      Queen Cozinha 1996-12-04
    ## 126   10373       Hungry Owl All-Night Grocers 1996-12-05
    ## 127   10374                     Wolski  Zajazd 1996-12-05
    ## 128   10375         Hungry Coyote Import Store 1996-12-06
    ## 129   10376                     Mère Paillarde 1996-12-09
    ## 130   10377                 Seven Seas Imports 1996-12-09
    ## 131   10378                     Folk och fä HB 1996-12-10
    ## 132   10379                        Que Delícia 1996-12-11
    ## 133   10380       Hungry Owl All-Night Grocers 1996-12-12
    ## 134   10381                  LILA-Supermercado 1996-12-12
    ## 135   10382                       Ernst Handel 1996-12-13
    ## 136   10383                    Around the Horn 1996-12-16
    ## 137   10384                 Berglunds snabbköp 1996-12-16
    ## 138   10385              Split Rail Beer & Ale 1996-12-17
    ## 139   10386                 Familia Arquibaldo 1996-12-18
    ## 140   10387                      Santé Gourmet 1996-12-18
    ## 141   10388                 Seven Seas Imports 1996-12-19
    ## 142   10389              Bottom-Dollar Markets 1996-12-20
    ## 143   10390                       Ernst Handel 1996-12-23
    ## 144   10391           Drachenblut Delikatessen 1996-12-23
    ## 145   10392                   Piccolo und mehr 1996-12-24
    ## 146   10393                 Save-a-lot Markets 1996-12-25
    ## 147   10394         Hungry Coyote Import Store 1996-12-25
    ## 148   10395                   HILARIÓN-Abastos 1996-12-26
    ## 149   10396                     Frankenversand 1996-12-27
    ## 150   10397             Princesa Isabel Vinhos 1996-12-27
    ## 151   10398                 Save-a-lot Markets 1996-12-30
    ## 152   10399                       Vaffeljernet 1996-12-31
    ## 153   10400                 Eastern Connection 1997-01-01
    ## 154   10401         Rattlesnake Canyon Grocery 1997-01-01
    ## 155   10402                       Ernst Handel 1997-01-02
    ## 156   10403                       Ernst Handel 1997-01-03
    ## 157   10404       Magazzini Alimentari Riuniti 1997-01-03
    ## 158   10405                   LINO-Delicateses 1997-01-06
    ## 159   10406                      Queen Cozinha 1997-01-07
    ## 160   10407                 Ottilies Käseladen 1997-01-07
    ## 161   10408                  Folies gourmandes 1997-01-08
    ## 162   10409             Océano Atlántico Ltda. 1997-01-09
    ## 163   10410              Bottom-Dollar Markets 1997-01-10
    ## 164   10411              Bottom-Dollar Markets 1997-01-10
    ## 165   10412                     Wartian Herkku 1997-01-13
    ## 166   10413                   La maison d'Asie 1997-01-14
    ## 167   10414                 Familia Arquibaldo 1997-01-14
    ## 168   10415         Hungry Coyote Import Store 1997-01-15
    ## 169   10416                     Wartian Herkku 1997-01-16
    ## 170   10417                      Simons bistro 1997-01-16
    ## 171   10418                         QUICK-Stop 1997-01-17
    ## 172   10419                 Richter Supermarkt 1997-01-20
    ## 173   10420             Wellington Importadora 1997-01-21
    ## 174   10421                        Que Delícia 1997-01-21
    ## 175   10422                     Franchi S.p.A. 1997-01-22
    ## 176   10423                Gourmet Lanchonetes 1997-01-23
    ## 177   10424                     Mère Paillarde 1997-01-23
    ## 178   10425                   La maison d'Asie 1997-01-24
    ## 179   10426             Galería del gastrónomo 1997-01-27
    ## 180   10427                   Piccolo und mehr 1997-01-27
    ## 181   10428                 Reggiani Caseifici 1997-01-28
    ## 182   10429       Hungry Owl All-Night Grocers 1997-01-29
    ## 183   10430                       Ernst Handel 1997-01-30
    ## 184   10431              Bottom-Dollar Markets 1997-01-30
    ## 185   10432              Split Rail Beer & Ale 1997-01-31
    ## 186   10433             Princesa Isabel Vinhos 1997-02-03
    ## 187   10434                     Folk och fä HB 1997-02-03
    ## 188   10435              Consolidated Holdings 1997-02-04
    ## 189   10436               Blondel père et fils 1997-02-05
    ## 190   10437                     Wartian Herkku 1997-02-05
    ## 191   10438                 Toms Spezialitäten 1997-02-06
    ## 192   10439                     Mère Paillarde 1997-02-07
    ## 193   10440                 Save-a-lot Markets 1997-02-10
    ## 194   10441             Old World Delicatessen 1997-02-10
    ## 195   10442                       Ernst Handel 1997-02-11
    ## 196   10443                 Reggiani Caseifici 1997-02-12
    ## 197   10444                 Berglunds snabbköp 1997-02-12
    ## 198   10445                 Berglunds snabbköp 1997-02-13
    ## 199   10446                 Toms Spezialitäten 1997-02-14
    ## 200   10447                 Ricardo Adocicados 1997-02-14
    ## 201   10448                      Rancho grande 1997-02-17
    ## 202   10449               Blondel père et fils 1997-02-18
    ## 203   10450               Victuailles en stock 1997-02-19
    ## 204   10451                         QUICK-Stop 1997-02-19
    ## 205   10452                 Save-a-lot Markets 1997-02-20
    ## 206   10453                    Around the Horn 1997-02-21
    ## 207   10454                   La maison d'Asie 1997-02-21
    ## 208   10455                     Wartian Herkku 1997-02-24
    ## 209   10456                    Königlich Essen 1997-02-25
    ## 210   10457                    Königlich Essen 1997-02-25
    ## 211   10458                   Suprêmes délices 1997-02-26
    ## 212   10459               Victuailles en stock 1997-02-27
    ## 213   10460                     Folk och fä HB 1997-02-28
    ## 214   10461                  LILA-Supermercado 1997-02-28
    ## 215   10462              Consolidated Holdings 1997-03-03
    ## 216   10463                   Suprêmes délices 1997-03-04
    ## 217   10464     Furia Bacalhau e Frutos do Mar 1997-03-04
    ## 218   10465                       Vaffeljernet 1997-03-05
    ## 219   10466                   Comércio Mineiro 1997-03-06
    ## 220   10467       Magazzini Alimentari Riuniti 1997-03-06
    ## 221   10468                    Königlich Essen 1997-03-07
    ## 222   10469               White Clover Markets 1997-03-10
    ## 223   10470                           Bon app' 1997-03-11
    ## 224   10471                      B's Beverages 1997-03-11
    ## 225   10472                 Seven Seas Imports 1997-03-12
    ## 226   10473                     Island Trading 1997-03-13
    ## 227   10474          Pericles Comidas clásicas 1997-03-13
    ## 228   10475                   Suprêmes délices 1997-03-14
    ## 229   10476                   HILARIÓN-Abastos 1997-03-17
    ## 230   10477             Princesa Isabel Vinhos 1997-03-17
    ## 231   10478               Victuailles en stock 1997-03-18
    ## 232   10479         Rattlesnake Canyon Grocery 1997-03-19
    ## 233   10480                  Folies gourmandes 1997-03-20
    ## 234   10481                 Ricardo Adocicados 1997-03-20
    ## 235   10482               Lazy K Kountry Store 1997-03-21
    ## 236   10483               White Clover Markets 1997-03-24
    ## 237   10484                      B's Beverages 1997-03-24
    ## 238   10485                   LINO-Delicateses 1997-03-25
    ## 239   10486                   HILARIÓN-Abastos 1997-03-26
    ## 240   10487                      Queen Cozinha 1997-03-26
    ## 241   10488                     Frankenversand 1997-03-27
    ## 242   10489                   Piccolo und mehr 1997-03-28
    ## 243   10490                   HILARIÓN-Abastos 1997-03-31
    ## 244   10491     Furia Bacalhau e Frutos do Mar 1997-03-31
    ## 245   10492              Bottom-Dollar Markets 1997-04-01
    ## 246   10493                   La maison d'Asie 1997-04-02
    ## 247   10494                   Comércio Mineiro 1997-04-02
    ## 248   10495      Laughing Bacchus Wine Cellars 1997-04-03
    ## 249   10496             Tradição Hipermercados 1997-04-04
    ## 250   10497                Lehmanns Marktstand 1997-04-04
    ## 251   10498                   HILARIÓN-Abastos 1997-04-07
    ## 252   10499                  LILA-Supermercado 1997-04-08
    ## 253   10500                   La maison d'Asie 1997-04-09
    ## 254   10501            Blauer See Delikatessen 1997-04-09
    ## 255   10502          Pericles Comidas clásicas 1997-04-10
    ## 256   10503       Hungry Owl All-Night Grocers 1997-04-11
    ## 257   10504               White Clover Markets 1997-04-11
    ## 258   10505                     Mère Paillarde 1997-04-14
    ## 259   10506                    Königlich Essen 1997-04-15
    ## 260   10507            Antonio Moreno Taquería 1997-04-15
    ## 261   10508                 Ottilies Käseladen 1997-04-16
    ## 262   10509            Blauer See Delikatessen 1997-04-17
    ## 263   10510                 Save-a-lot Markets 1997-04-18
    ## 264   10511                           Bon app' 1997-04-18
    ## 265   10512                 Familia Arquibaldo 1997-04-21
    ## 266   10513                  Die Wandernde Kuh 1997-04-22
    ## 267   10514                       Ernst Handel 1997-04-22
    ## 268   10515                         QUICK-Stop 1997-04-23
    ## 269   10516       Hungry Owl All-Night Grocers 1997-04-24
    ## 270   10517                        North/South 1997-04-24
    ## 271   10518                Tortuga Restaurante 1997-04-25
    ## 272   10519                  Chop-suey Chinese 1997-04-28
    ## 273   10520                      Santé Gourmet 1997-04-29
    ## 274   10521         Cactus Comidas para llevar 1997-04-29
    ## 275   10522                Lehmanns Marktstand 1997-04-30
    ## 276   10523                 Seven Seas Imports 1997-05-01
    ## 277   10524                 Berglunds snabbköp 1997-05-01
    ## 278   10525                           Bon app' 1997-05-02
    ## 279   10526                     Wartian Herkku 1997-05-05
    ## 280   10527                         QUICK-Stop 1997-05-05
    ## 281   10528            Great Lakes Food Market 1997-05-06
    ## 282   10529                       Maison Dewey 1997-05-07
    ## 283   10530                   Piccolo und mehr 1997-05-08
    ## 284   10531             Océano Atlántico Ltda. 1997-05-08
    ## 285   10532                 Eastern Connection 1997-05-09
    ## 286   10533                     Folk och fä HB 1997-05-12
    ## 287   10534                Lehmanns Marktstand 1997-05-12
    ## 288   10535            Antonio Moreno Taquería 1997-05-13
    ## 289   10536                Lehmanns Marktstand 1997-05-14
    ## 290   10537                 Richter Supermarkt 1997-05-14
    ## 291   10538                      B's Beverages 1997-05-15
    ## 292   10539                      B's Beverages 1997-05-16
    ## 293   10540                         QUICK-Stop 1997-05-19
    ## 294   10541                      Hanari Carnes 1997-05-19
    ## 295   10542                    Königlich Essen 1997-05-20
    ## 296   10543                  LILA-Supermercado 1997-05-21
    ## 297   10544           Lonesome Pine Restaurant 1997-05-21
    ## 298   10545               Lazy K Kountry Store 1997-05-22
    ## 299   10546               Victuailles en stock 1997-05-23
    ## 300   10547                 Seven Seas Imports 1997-05-23
    ## 301   10548                 Toms Spezialitäten 1997-05-26
    ## 302   10549                         QUICK-Stop 1997-05-27
    ## 303   10550                Godos Cocina Típica 1997-05-28
    ## 304   10551     Furia Bacalhau e Frutos do Mar 1997-05-28
    ## 305   10552                   HILARIÓN-Abastos 1997-05-29
    ## 306   10553                     Wartian Herkku 1997-05-30
    ## 307   10554                 Ottilies Käseladen 1997-05-30
    ## 308   10555                 Save-a-lot Markets 1997-06-02
    ## 309   10556                      Simons bistro 1997-06-03
    ## 310   10557                Lehmanns Marktstand 1997-06-03
    ## 311   10558                    Around the Horn 1997-06-04
    ## 312   10559               Blondel père et fils 1997-06-05
    ## 313   10560                     Frankenversand 1997-06-06
    ## 314   10561                     Folk och fä HB 1997-06-06
    ## 315   10562                 Reggiani Caseifici 1997-06-09
    ## 316   10563                 Ricardo Adocicados 1997-06-10
    ## 317   10564         Rattlesnake Canyon Grocery 1997-06-10
    ## 318   10565                     Mère Paillarde 1997-06-11
    ## 319   10566               Blondel père et fils 1997-06-12
    ## 320   10567       Hungry Owl All-Night Grocers 1997-06-12
    ## 321   10568             Galería del gastrónomo 1997-06-13
    ## 322   10569         Rattlesnake Canyon Grocery 1997-06-16
    ## 323   10570                     Mère Paillarde 1997-06-17
    ## 324   10571                       Ernst Handel 1997-06-17
    ## 325   10572                 Berglunds snabbköp 1997-06-18
    ## 326   10573            Antonio Moreno Taquería 1997-06-19
    ## 327   10574  Trail's Head Gourmet Provisioners 1997-06-19
    ## 328   10575             Morgenstern Gesundkost 1997-06-20
    ## 329   10576                Tortuga Restaurante 1997-06-23
    ## 330   10577  Trail's Head Gourmet Provisioners 1997-06-23
    ## 331   10578                      B's Beverages 1997-06-24
    ## 332   10579                  Let's Stop N Shop 1997-06-25
    ## 333   10580                 Ottilies Käseladen 1997-06-26
    ## 334   10581                 Familia Arquibaldo 1997-06-26
    ## 335   10582            Blauer See Delikatessen 1997-06-27
    ## 336   10583                     Wartian Herkku 1997-06-30
    ## 337   10584               Blondel père et fils 1997-06-30
    ## 338   10585             Wellington Importadora 1997-07-01
    ## 339   10586                 Reggiani Caseifici 1997-07-02
    ## 340   10587                        Que Delícia 1997-07-02
    ## 341   10588                         QUICK-Stop 1997-07-03
    ## 342   10589            Great Lakes Food Market 1997-07-04
    ## 343   10590                     Mère Paillarde 1997-07-07
    ## 344   10591                       Vaffeljernet 1997-07-07
    ## 345   10592                Lehmanns Marktstand 1997-07-08
    ## 346   10593                Lehmanns Marktstand 1997-07-09
    ## 347   10594             Old World Delicatessen 1997-07-09
    ## 348   10595                       Ernst Handel 1997-07-10
    ## 349   10596               White Clover Markets 1997-07-11
    ## 350   10597                   Piccolo und mehr 1997-07-11
    ## 351   10598         Rattlesnake Canyon Grocery 1997-07-14
    ## 352   10599                      B's Beverages 1997-07-15
    ## 353   10600         Hungry Coyote Import Store 1997-07-16
    ## 354   10601                   HILARIÓN-Abastos 1997-07-16
    ## 355   10602                       Vaffeljernet 1997-07-17
    ## 356   10603                 Save-a-lot Markets 1997-07-18
    ## 357   10604     Furia Bacalhau e Frutos do Mar 1997-07-18
    ## 358   10605                     Mère Paillarde 1997-07-21
    ## 359   10606             Tradição Hipermercados 1997-07-22
    ## 360   10607                 Save-a-lot Markets 1997-07-22
    ## 361   10608                 Toms Spezialitäten 1997-07-23
    ## 362   10609                    Du monde entier 1997-07-24
    ## 363   10610                   La maison d'Asie 1997-07-25
    ## 364   10611                     Wolski  Zajazd 1997-07-25
    ## 365   10612                 Save-a-lot Markets 1997-07-28
    ## 366   10613                   HILARIÓN-Abastos 1997-07-29
    ## 367   10614            Blauer See Delikatessen 1997-07-29
    ## 368   10615                        Wilman Kala 1997-07-30
    ## 369   10616            Great Lakes Food Market 1997-07-31
    ## 370   10617            Great Lakes Food Market 1997-07-31
    ## 371   10618                     Mère Paillarde 1997-08-01
    ## 372   10619                     Mère Paillarde 1997-08-04
    ## 373   10620      Laughing Bacchus Wine Cellars 1997-08-05
    ## 374   10621                     Island Trading 1997-08-05
    ## 375   10622                 Ricardo Adocicados 1997-08-06
    ## 376   10623                     Frankenversand 1997-08-07
    ## 377   10624                    The Cracker Box 1997-08-07
    ## 378   10625 Ana Trujillo Emparedados y helados 1997-08-08
    ## 379   10626                 Berglunds snabbköp 1997-08-11
    ## 380   10627                 Save-a-lot Markets 1997-08-11
    ## 381   10628               Blondel père et fils 1997-08-12
    ## 382   10629                Godos Cocina Típica 1997-08-12
    ## 383   10630                    Königlich Essen 1997-08-13
    ## 384   10631                   La maison d'Asie 1997-08-14
    ## 385   10632                  Die Wandernde Kuh 1997-08-14
    ## 386   10633                       Ernst Handel 1997-08-15
    ## 387   10634                  Folies gourmandes 1997-08-15
    ## 388   10635       Magazzini Alimentari Riuniti 1997-08-18
    ## 389   10636                     Wartian Herkku 1997-08-19
    ## 390   10637                      Queen Cozinha 1997-08-19
    ## 391   10638                   LINO-Delicateses 1997-08-20
    ## 392   10639                      Santé Gourmet 1997-08-20
    ## 393   10640                  Die Wandernde Kuh 1997-08-21
    ## 394   10641                   HILARIÓN-Abastos 1997-08-22
    ## 395   10642                      Simons bistro 1997-08-22
    ## 396   10643                Alfreds Futterkiste 1997-08-25
    ## 397   10644             Wellington Importadora 1997-08-25
    ## 398   10645                      Hanari Carnes 1997-08-26
    ## 399   10646       Hungry Owl All-Night Grocers 1997-08-27
    ## 400   10647                        Que Delícia 1997-08-27
    ## 401   10648                 Ricardo Adocicados 1997-08-28
    ## 402   10649                       Maison Dewey 1997-08-28
    ## 403   10650                 Familia Arquibaldo 1997-08-29
    ## 404   10651                  Die Wandernde Kuh 1997-09-01
    ## 405   10652                Gourmet Lanchonetes 1997-09-01
    ## 406   10653                     Frankenversand 1997-09-02
    ## 407   10654                 Berglunds snabbköp 1997-09-02
    ## 408   10655                 Reggiani Caseifici 1997-09-03
    ## 409   10656            Great Lakes Food Market 1997-09-04
    ## 410   10657                 Save-a-lot Markets 1997-09-04
    ## 411   10658                         QUICK-Stop 1997-09-05
    ## 412   10659                      Queen Cozinha 1997-09-05
    ## 413   10660         Hungry Coyote Import Store 1997-09-08
    ## 414   10661       Hungry Owl All-Night Grocers 1997-09-09
    ## 415   10662           Lonesome Pine Restaurant 1997-09-09
    ## 416   10663                           Bon app' 1997-09-10
    ## 417   10664     Furia Bacalhau e Frutos do Mar 1997-09-10
    ## 418   10665           Lonesome Pine Restaurant 1997-09-11
    ## 419   10666                 Richter Supermarkt 1997-09-12
    ## 420   10667                       Ernst Handel 1997-09-12
    ## 421   10668                  Die Wandernde Kuh 1997-09-15
    ## 422   10669                      Simons bistro 1997-09-15
    ## 423   10670                     Frankenversand 1997-09-16
    ## 424   10671                France restauration 1997-09-17
    ## 425   10672                 Berglunds snabbköp 1997-09-17
    ## 426   10673                        Wilman Kala 1997-09-18
    ## 427   10674                     Island Trading 1997-09-18
    ## 428   10675                     Frankenversand 1997-09-19
    ## 429   10676                Tortuga Restaurante 1997-09-22
    ## 430   10677            Antonio Moreno Taquería 1997-09-22
    ## 431   10678                 Save-a-lot Markets 1997-09-23
    ## 432   10679               Blondel père et fils 1997-09-23
    ## 433   10680             Old World Delicatessen 1997-09-24
    ## 434   10681            Great Lakes Food Market 1997-09-25
    ## 435   10682            Antonio Moreno Taquería 1997-09-25
    ## 436   10683                    Du monde entier 1997-09-26
    ## 437   10684                 Ottilies Käseladen 1997-09-26
    ## 438   10685                Gourmet Lanchonetes 1997-09-29
    ## 439   10686                   Piccolo und mehr 1997-09-30
    ## 440   10687       Hungry Owl All-Night Grocers 1997-09-30
    ## 441   10688                       Vaffeljernet 1997-10-01
    ## 442   10689                 Berglunds snabbköp 1997-10-01
    ## 443   10690                      Hanari Carnes 1997-10-02
    ## 444   10691                         QUICK-Stop 1997-10-03
    ## 445   10692                Alfreds Futterkiste 1997-10-03
    ## 446   10693               White Clover Markets 1997-10-06
    ## 447   10694                         QUICK-Stop 1997-10-06
    ## 448   10695                        Wilman Kala 1997-10-07
    ## 449   10696               White Clover Markets 1997-10-08
    ## 450   10697                   LINO-Delicateses 1997-10-08
    ## 451   10698                       Ernst Handel 1997-10-09
    ## 452   10699             Morgenstern Gesundkost 1997-10-09
    ## 453   10700                 Save-a-lot Markets 1997-10-10
    ## 454   10701       Hungry Owl All-Night Grocers 1997-10-13
    ## 455   10702                Alfreds Futterkiste 1997-10-13
    ## 456   10703                     Folk och fä HB 1997-10-14
    ## 457   10704                      Queen Cozinha 1997-10-14
    ## 458   10705                   HILARIÓN-Abastos 1997-10-15
    ## 459   10706             Old World Delicatessen 1997-10-16
    ## 460   10707                    Around the Horn 1997-10-16
    ## 461   10708                     The Big Cheese 1997-10-17
    ## 462   10709                Gourmet Lanchonetes 1997-10-17
    ## 463   10710                     Franchi S.p.A. 1997-10-20
    ## 464   10711                 Save-a-lot Markets 1997-10-21
    ## 465   10712       Hungry Owl All-Night Grocers 1997-10-21
    ## 466   10713                 Save-a-lot Markets 1997-10-22
    ## 467   10714                 Save-a-lot Markets 1997-10-22
    ## 468   10715                           Bon app' 1997-10-23
    ## 469   10716                      Rancho grande 1997-10-24
    ## 470   10717                     Frankenversand 1997-10-24
    ## 471   10718                    Königlich Essen 1997-10-27
    ## 472   10719                  Let's Stop N Shop 1997-10-27
    ## 473   10720                        Que Delícia 1997-10-28
    ## 474   10721                         QUICK-Stop 1997-10-29
    ## 475   10722                 Save-a-lot Markets 1997-10-29
    ## 476   10723               White Clover Markets 1997-10-30
    ## 477   10724                     Mère Paillarde 1997-10-30
    ## 478   10725                 Familia Arquibaldo 1997-10-31
    ## 479   10726                 Eastern Connection 1997-11-03
    ## 480   10727                 Reggiani Caseifici 1997-11-03
    ## 481   10728                      Queen Cozinha 1997-11-04
    ## 482   10729                   LINO-Delicateses 1997-11-04
    ## 483   10730                           Bon app' 1997-11-05
    ## 484   10731                  Chop-suey Chinese 1997-11-06
    ## 485   10732                           Bon app' 1997-11-06
    ## 486   10733                 Berglunds snabbköp 1997-11-07
    ## 487   10734                Gourmet Lanchonetes 1997-11-07
    ## 488   10735                  Let's Stop N Shop 1997-11-10
    ## 489   10736       Hungry Owl All-Night Grocers 1997-11-11
    ## 490   10737          Vins et alcools Chevalier 1997-11-11
    ## 491   10738               Spécialités du monde 1997-11-12
    ## 492   10739          Vins et alcools Chevalier 1997-11-12
    ## 493   10740               White Clover Markets 1997-11-13
    ## 494   10741                    Around the Horn 1997-11-14
    ## 495   10742              Bottom-Dollar Markets 1997-11-14
    ## 496   10743                    Around the Horn 1997-11-17
    ## 497   10744                       Vaffeljernet 1997-11-17
    ## 498   10745                         QUICK-Stop 1997-11-18
    ## 499   10746                  Chop-suey Chinese 1997-11-19
    ## 500   10747                   Piccolo und mehr 1997-11-19
    ## 501   10748                 Save-a-lot Markets 1997-11-20
    ## 502   10749                     Island Trading 1997-11-20
    ## 503   10750                     Wartian Herkku 1997-11-21
    ## 504   10751                 Richter Supermarkt 1997-11-24
    ## 505   10752                        North/South 1997-11-24
    ## 506   10753                     Franchi S.p.A. 1997-11-25
    ## 507   10754       Magazzini Alimentari Riuniti 1997-11-25
    ## 508   10755                           Bon app' 1997-11-26
    ## 509   10756              Split Rail Beer & Ale 1997-11-27
    ## 510   10757                 Save-a-lot Markets 1997-11-27
    ## 511   10758                 Richter Supermarkt 1997-11-28
    ## 512   10759 Ana Trujillo Emparedados y helados 1997-11-28
    ## 513   10760                       Maison Dewey 1997-12-01
    ## 514   10761         Rattlesnake Canyon Grocery 1997-12-02
    ## 515   10762                     Folk och fä HB 1997-12-02
    ## 516   10763                  Folies gourmandes 1997-12-03
    ## 517   10764                       Ernst Handel 1997-12-03
    ## 518   10765                         QUICK-Stop 1997-12-04
    ## 519   10766                 Ottilies Käseladen 1997-12-05
    ## 520   10767                   Suprêmes délices 1997-12-05
    ## 521   10768                    Around the Horn 1997-12-08
    ## 522   10769                       Vaffeljernet 1997-12-08
    ## 523   10770                      Hanari Carnes 1997-12-09
    ## 524   10771                       Ernst Handel 1997-12-10
    ## 525   10772                Lehmanns Marktstand 1997-12-10
    ## 526   10773                       Ernst Handel 1997-12-11
    ## 527   10774                     Folk och fä HB 1997-12-11
    ## 528   10775                    The Cracker Box 1997-12-12
    ## 529   10776                       Ernst Handel 1997-12-15
    ## 530   10777                Gourmet Lanchonetes 1997-12-15
    ## 531   10778                 Berglunds snabbköp 1997-12-16
    ## 532   10779             Morgenstern Gesundkost 1997-12-16
    ## 533   10780                  LILA-Supermercado 1997-12-16
    ## 534   10781                     Wartian Herkku 1997-12-17
    ## 535   10782         Cactus Comidas para llevar 1997-12-17
    ## 536   10783                      Hanari Carnes 1997-12-18
    ## 537   10784       Magazzini Alimentari Riuniti 1997-12-18
    ## 538   10785               GROSELLA-Restaurante 1997-12-18
    ## 539   10786                      Queen Cozinha 1997-12-19
    ## 540   10787                   La maison d'Asie 1997-12-19
    ## 541   10788                         QUICK-Stop 1997-12-22
    ## 542   10789                  Folies gourmandes 1997-12-22
    ## 543   10790                Gourmet Lanchonetes 1997-12-22
    ## 544   10791                     Frankenversand 1997-12-23
    ## 545   10792                     Wolski  Zajazd 1997-12-23
    ## 546   10793                    Around the Horn 1997-12-24
    ## 547   10794                        Que Delícia 1997-12-24
    ## 548   10795                       Ernst Handel 1997-12-24
    ## 549   10796                   HILARIÓN-Abastos 1997-12-25
    ## 550   10797           Drachenblut Delikatessen 1997-12-25
    ## 551   10798                     Island Trading 1997-12-26
    ## 552   10799                    Königlich Essen 1997-12-26
    ## 553   10800                 Seven Seas Imports 1997-12-26
    ## 554   10801          Bólido Comidas preparadas 1997-12-29
    ## 555   10802                      Simons bistro 1997-12-29
    ## 556   10803             Wellington Importadora 1997-12-30
    ## 557   10804                 Seven Seas Imports 1997-12-30
    ## 558   10805                     The Big Cheese 1997-12-30
    ## 559   10806               Victuailles en stock 1997-12-31
    ## 560   10807                     Franchi S.p.A. 1997-12-31
    ## 561   10808             Princesa Isabel Vinhos 1998-01-01
    ## 562   10809             Wellington Importadora 1998-01-01
    ## 563   10810      Laughing Bacchus Wine Cellars 1998-01-01
    ## 564   10811                   LINO-Delicateses 1998-01-02
    ## 565   10812                 Reggiani Caseifici 1998-01-02
    ## 566   10813                 Ricardo Adocicados 1998-01-05
    ## 567   10814               Victuailles en stock 1998-01-05
    ## 568   10815                 Save-a-lot Markets 1998-01-05
    ## 569   10816            Great Lakes Food Market 1998-01-06
    ## 570   10817                    Königlich Essen 1998-01-06
    ## 571   10818       Magazzini Alimentari Riuniti 1998-01-07
    ## 572   10819         Cactus Comidas para llevar 1998-01-07
    ## 573   10820         Rattlesnake Canyon Grocery 1998-01-07
    ## 574   10821              Split Rail Beer & Ale 1998-01-08
    ## 575   10822  Trail's Head Gourmet Provisioners 1998-01-08
    ## 576   10823                  LILA-Supermercado 1998-01-09
    ## 577   10824                     Folk och fä HB 1998-01-09
    ## 578   10825           Drachenblut Delikatessen 1998-01-09
    ## 579   10826               Blondel père et fils 1998-01-12
    ## 580   10827                           Bon app' 1998-01-12
    ## 581   10828                      Rancho grande 1998-01-13
    ## 582   10829                     Island Trading 1998-01-13
    ## 583   10830             Tradição Hipermercados 1998-01-13
    ## 584   10831                      Santé Gourmet 1998-01-14
    ## 585   10832                   La maison d'Asie 1998-01-14
    ## 586   10833                 Ottilies Käseladen 1998-01-15
    ## 587   10834             Tradição Hipermercados 1998-01-15
    ## 588   10835                Alfreds Futterkiste 1998-01-15
    ## 589   10836                       Ernst Handel 1998-01-16
    ## 590   10837                 Berglunds snabbköp 1998-01-16
    ## 591   10838                   LINO-Delicateses 1998-01-19
    ## 592   10839             Tradição Hipermercados 1998-01-19
    ## 593   10840                   LINO-Delicateses 1998-01-19
    ## 594   10841                   Suprêmes délices 1998-01-20
    ## 595   10842                Tortuga Restaurante 1998-01-20
    ## 596   10843               Victuailles en stock 1998-01-21
    ## 597   10844                   Piccolo und mehr 1998-01-21
    ## 598   10845                         QUICK-Stop 1998-01-21
    ## 599   10846                   Suprêmes délices 1998-01-22
    ## 600   10847                 Save-a-lot Markets 1998-01-22
    ## 601   10848              Consolidated Holdings 1998-01-23
    ## 602   10849                    Königlich Essen 1998-01-23
    ## 603   10850               Victuailles en stock 1998-01-23
    ## 604   10851                 Ricardo Adocicados 1998-01-26
    ## 605   10852         Rattlesnake Canyon Grocery 1998-01-26
    ## 606   10853            Blauer See Delikatessen 1998-01-27
    ## 607   10854                       Ernst Handel 1998-01-27
    ## 608   10855             Old World Delicatessen 1998-01-27
    ## 609   10856            Antonio Moreno Taquería 1998-01-28
    ## 610   10857                 Berglunds snabbköp 1998-01-28
    ## 611   10858               La corne d'abondance 1998-01-29
    ## 612   10859                     Frankenversand 1998-01-29
    ## 613   10860                France restauration 1998-01-29
    ## 614   10861               White Clover Markets 1998-01-30
    ## 615   10862                Lehmanns Marktstand 1998-01-30
    ## 616   10863                   HILARIÓN-Abastos 1998-02-02
    ## 617   10864                    Around the Horn 1998-02-02
    ## 618   10865                         QUICK-Stop 1998-02-02
    ## 619   10866                 Berglunds snabbköp 1998-02-03
    ## 620   10867           Lonesome Pine Restaurant 1998-02-03
    ## 621   10868                      Queen Cozinha 1998-02-04
    ## 622   10869                 Seven Seas Imports 1998-02-04
    ## 623   10870                     Wolski  Zajazd 1998-02-04
    ## 624   10871                           Bon app' 1998-02-05
    ## 625   10872                Godos Cocina Típica 1998-02-05
    ## 626   10873                        Wilman Kala 1998-02-06
    ## 627   10874                Godos Cocina Típica 1998-02-06
    ## 628   10875                 Berglunds snabbköp 1998-02-06
    ## 629   10876                           Bon app' 1998-02-09
    ## 630   10877                 Ricardo Adocicados 1998-02-09
    ## 631   10878                         QUICK-Stop 1998-02-10
    ## 632   10879                        Wilman Kala 1998-02-10
    ## 633   10880                     Folk och fä HB 1998-02-10
    ## 634   10881         Cactus Comidas para llevar 1998-02-11
    ## 635   10882                 Save-a-lot Markets 1998-02-11
    ## 636   10883           Lonesome Pine Restaurant 1998-02-12
    ## 637   10884                  Let's Stop N Shop 1998-02-12
    ## 638   10885                   Suprêmes délices 1998-02-12
    ## 639   10886                      Hanari Carnes 1998-02-13
    ## 640   10887             Galería del gastrónomo 1998-02-13
    ## 641   10888                Godos Cocina Típica 1998-02-16
    ## 642   10889         Rattlesnake Canyon Grocery 1998-02-16
    ## 643   10890                    Du monde entier 1998-02-16
    ## 644   10891                Lehmanns Marktstand 1998-02-17
    ## 645   10892                       Maison Dewey 1998-02-17
    ## 646   10893                    Königlich Essen 1998-02-18
    ## 647   10894                 Save-a-lot Markets 1998-02-18
    ## 648   10895                       Ernst Handel 1998-02-18
    ## 649   10896                       Maison Dewey 1998-02-19
    ## 650   10897       Hungry Owl All-Night Grocers 1998-02-19
    ## 651   10898             Océano Atlántico Ltda. 1998-02-20
    ## 652   10899                  LILA-Supermercado 1998-02-20
    ## 653   10900             Wellington Importadora 1998-02-20
    ## 654   10901                   HILARIÓN-Abastos 1998-02-23
    ## 655   10902                     Folk och fä HB 1998-02-23
    ## 656   10903                      Hanari Carnes 1998-02-24
    ## 657   10904               White Clover Markets 1998-02-24
    ## 658   10905             Wellington Importadora 1998-02-24
    ## 659   10906                     Wolski  Zajazd 1998-02-25
    ## 660   10907               Spécialités du monde 1998-02-25
    ## 661   10908                 Reggiani Caseifici 1998-02-26
    ## 662   10909                      Santé Gourmet 1998-02-26
    ## 663   10910                        Wilman Kala 1998-02-26
    ## 664   10911                Godos Cocina Típica 1998-02-26
    ## 665   10912       Hungry Owl All-Night Grocers 1998-02-26
    ## 666   10913                      Queen Cozinha 1998-02-26
    ## 667   10914                      Queen Cozinha 1998-02-27
    ## 668   10915                Tortuga Restaurante 1998-02-27
    ## 669   10916                      Rancho grande 1998-02-27
    ## 670   10917                   Romero y tomillo 1998-03-02
    ## 671   10918              Bottom-Dollar Markets 1998-03-02
    ## 672   10919                   LINO-Delicateses 1998-03-02
    ## 673   10920                    Around the Horn 1998-03-03
    ## 674   10921                       Vaffeljernet 1998-03-03
    ## 675   10922                      Hanari Carnes 1998-03-03
    ## 676   10923                   La maison d'Asie 1998-03-03
    ## 677   10924                 Berglunds snabbköp 1998-03-04
    ## 678   10925                      Hanari Carnes 1998-03-04
    ## 679   10926 Ana Trujillo Emparedados y helados 1998-03-04
    ## 680   10927               La corne d'abondance 1998-03-05
    ## 681   10928             Galería del gastrónomo 1998-03-05
    ## 682   10929                     Frankenversand 1998-03-05
    ## 683   10930                   Suprêmes délices 1998-03-06
    ## 684   10931                 Richter Supermarkt 1998-03-06
    ## 685   10932                           Bon app' 1998-03-06
    ## 686   10933                     Island Trading 1998-03-06
    ## 687   10934                Lehmanns Marktstand 1998-03-09
    ## 688   10935             Wellington Importadora 1998-03-09
    ## 689   10936            Great Lakes Food Market 1998-03-09
    ## 690   10937         Cactus Comidas para llevar 1998-03-10
    ## 691   10938                         QUICK-Stop 1998-03-10
    ## 692   10939       Magazzini Alimentari Riuniti 1998-03-10
    ## 693   10940                           Bon app' 1998-03-11
    ## 694   10941                 Save-a-lot Markets 1998-03-11
    ## 695   10942                 Reggiani Caseifici 1998-03-11
    ## 696   10943                      B's Beverages 1998-03-11
    ## 697   10944              Bottom-Dollar Markets 1998-03-12
    ## 698   10945             Morgenstern Gesundkost 1998-03-12
    ## 699   10946                       Vaffeljernet 1998-03-12
    ## 700   10947                      B's Beverages 1998-03-13
    ## 701   10948                Godos Cocina Típica 1998-03-13
    ## 702   10949              Bottom-Dollar Markets 1998-03-13
    ## 703   10950       Magazzini Alimentari Riuniti 1998-03-16
    ## 704   10951                 Richter Supermarkt 1998-03-16
    ## 705   10952                Alfreds Futterkiste 1998-03-16
    ## 706   10953                    Around the Horn 1998-03-16
    ## 707   10954                   LINO-Delicateses 1998-03-17
    ## 708   10955                     Folk och fä HB 1998-03-17
    ## 709   10956            Blauer See Delikatessen 1998-03-17
    ## 710   10957                   HILARIÓN-Abastos 1998-03-18
    ## 711   10958             Océano Atlántico Ltda. 1998-03-18
    ## 712   10959                Gourmet Lanchonetes 1998-03-18
    ## 713   10960                   HILARIÓN-Abastos 1998-03-19
    ## 714   10961                      Queen Cozinha 1998-03-19
    ## 715   10962                         QUICK-Stop 1998-03-19
    ## 716   10963     Furia Bacalhau e Frutos do Mar 1998-03-19
    ## 717   10964               Spécialités du monde 1998-03-20
    ## 718   10965             Old World Delicatessen 1998-03-20
    ## 719   10966                  Chop-suey Chinese 1998-03-20
    ## 720   10967                 Toms Spezialitäten 1998-03-23
    ## 721   10968                       Ernst Handel 1998-03-23
    ## 722   10969                   Comércio Mineiro 1998-03-23
    ## 723   10970          Bólido Comidas preparadas 1998-03-24
    ## 724   10971                France restauration 1998-03-24
    ## 725   10972               La corne d'abondance 1998-03-24
    ## 726   10973               La corne d'abondance 1998-03-24
    ## 727   10974              Split Rail Beer & Ale 1998-03-25
    ## 728   10975              Bottom-Dollar Markets 1998-03-25
    ## 729   10976                   HILARIÓN-Abastos 1998-03-25
    ## 730   10977                     Folk och fä HB 1998-03-26
    ## 731   10978                       Maison Dewey 1998-03-26
    ## 732   10979                       Ernst Handel 1998-03-26
    ## 733   10980                     Folk och fä HB 1998-03-27
    ## 734   10981                      Hanari Carnes 1998-03-27
    ## 735   10982              Bottom-Dollar Markets 1998-03-27
    ## 736   10983                 Save-a-lot Markets 1998-03-27
    ## 737   10984                 Save-a-lot Markets 1998-03-30
    ## 738   10985       Hungry Owl All-Night Grocers 1998-03-30
    ## 739   10986             Océano Atlántico Ltda. 1998-03-30
    ## 740   10987                 Eastern Connection 1998-03-31
    ## 741   10988         Rattlesnake Canyon Grocery 1998-03-31
    ## 742   10989                        Que Delícia 1998-03-31
    ## 743   10990                       Ernst Handel 1998-04-01
    ## 744   10991                         QUICK-Stop 1998-04-01
    ## 745   10992                     The Big Cheese 1998-04-01
    ## 746   10993                     Folk och fä HB 1998-04-01
    ## 747   10994                       Vaffeljernet 1998-04-02
    ## 748   10995          Pericles Comidas clásicas 1998-04-02
    ## 749   10996                         QUICK-Stop 1998-04-02
    ## 750   10997                  LILA-Supermercado 1998-04-03
    ## 751   10998                     Wolski  Zajazd 1998-04-03
    ## 752   10999                 Ottilies Käseladen 1998-04-03
    ## 753   11000         Rattlesnake Canyon Grocery 1998-04-06
    ## 754   11001                     Folk och fä HB 1998-04-06
    ## 755   11002                 Save-a-lot Markets 1998-04-06
    ## 756   11003                    The Cracker Box 1998-04-06
    ## 757   11004                       Maison Dewey 1998-04-07
    ## 758   11005                        Wilman Kala 1998-04-07
    ## 759   11006            Great Lakes Food Market 1998-04-07
    ## 760   11007             Princesa Isabel Vinhos 1998-04-08
    ## 761   11008                       Ernst Handel 1998-04-08
    ## 762   11009                Godos Cocina Típica 1998-04-08
    ## 763   11010                 Reggiani Caseifici 1998-04-09
    ## 764   11011                Alfreds Futterkiste 1998-04-09
    ## 765   11012                     Frankenversand 1998-04-09
    ## 766   11013                   Romero y tomillo 1998-04-09
    ## 767   11014                   LINO-Delicateses 1998-04-10
    ## 768   11015                      Santé Gourmet 1998-04-10
    ## 769   11016                    Around the Horn 1998-04-10
    ## 770   11017                       Ernst Handel 1998-04-13
    ## 771   11018           Lonesome Pine Restaurant 1998-04-13
    ## 772   11019                      Rancho grande 1998-04-13
    ## 773   11020                 Ottilies Käseladen 1998-04-14
    ## 774   11021                         QUICK-Stop 1998-04-14
    ## 775   11022                      Hanari Carnes 1998-04-14
    ## 776   11023                      B's Beverages 1998-04-14
    ## 777   11024                 Eastern Connection 1998-04-15
    ## 778   11025                     Wartian Herkku 1998-04-15
    ## 779   11026                     Franchi S.p.A. 1998-04-15
    ## 780   11027              Bottom-Dollar Markets 1998-04-16
    ## 781   11028                    Königlich Essen 1998-04-16
    ## 782   11029                  Chop-suey Chinese 1998-04-16
    ## 783   11030                 Save-a-lot Markets 1998-04-17
    ## 784   11031                 Save-a-lot Markets 1998-04-17
    ## 785   11032               White Clover Markets 1998-04-17
    ## 786   11033                 Richter Supermarkt 1998-04-17
    ## 787   11034             Old World Delicatessen 1998-04-20
    ## 788   11035                   Suprêmes délices 1998-04-20
    ## 789   11036           Drachenblut Delikatessen 1998-04-20
    ## 790   11037                Godos Cocina Típica 1998-04-21
    ## 791   11038                   Suprêmes délices 1998-04-21
    ## 792   11039                   LINO-Delicateses 1998-04-21
    ## 793   11040            Great Lakes Food Market 1998-04-22
    ## 794   11041                  Chop-suey Chinese 1998-04-22
    ## 795   11042                   Comércio Mineiro 1998-04-22
    ## 796   11043               Spécialités du monde 1998-04-22
    ## 797   11044                     Wolski  Zajazd 1998-04-23
    ## 798   11045              Bottom-Dollar Markets 1998-04-23
    ## 799   11046                  Die Wandernde Kuh 1998-04-23
    ## 800   11047                 Eastern Connection 1998-04-24
    ## 801   11048              Bottom-Dollar Markets 1998-04-24
    ## 802   11049                Gourmet Lanchonetes 1998-04-24
    ## 803   11050                     Folk och fä HB 1998-04-27
    ## 804   11051                   La maison d'Asie 1998-04-27
    ## 805   11052                      Hanari Carnes 1998-04-27
    ## 806   11053                   Piccolo und mehr 1998-04-27
    ## 807   11054         Cactus Comidas para llevar 1998-04-28
    ## 808   11055                   HILARIÓN-Abastos 1998-04-28
    ## 809   11056                 Eastern Connection 1998-04-28
    ## 810   11057                        North/South 1998-04-29
    ## 811   11058            Blauer See Delikatessen 1998-04-29
    ## 812   11059                 Ricardo Adocicados 1998-04-29
    ## 813   11060                     Franchi S.p.A. 1998-04-30
    ## 814   11061            Great Lakes Food Market 1998-04-30
    ## 815   11062                 Reggiani Caseifici 1998-04-30
    ## 816   11063       Hungry Owl All-Night Grocers 1998-04-30
    ## 817   11064                 Save-a-lot Markets 1998-05-01
    ## 818   11065                  LILA-Supermercado 1998-05-01
    ## 819   11066               White Clover Markets 1998-05-01
    ## 820   11067           Drachenblut Delikatessen 1998-05-04
    ## 821   11068                      Queen Cozinha 1998-05-04
    ## 822   11069                Tortuga Restaurante 1998-05-04
    ## 823   11070                Lehmanns Marktstand 1998-05-05
    ## 824   11071                  LILA-Supermercado 1998-05-05
    ## 825   11072                       Ernst Handel 1998-05-05
    ## 826   11073          Pericles Comidas clásicas 1998-05-05
    ## 827   11074                      Simons bistro 1998-05-06
    ## 828   11075                 Richter Supermarkt 1998-05-06
    ## 829   11076                           Bon app' 1998-05-06
    ## 830   11077         Rattlesnake Canyon Grocery 1998-05-06

Self-Join within Customers Table representing two Company's from same City
==========================================================================

``` r
sqldf("SELECT A.CompanyName AS Name1,B.CompanyName As Nam2,A.City, B.City
       FROM Customers AS A
       INNER JOIN Customers As B
       WHERE A.CustomerID <> B.CustomerID
       AND A.City = B.City
       ORDER By Name1;")
```

    ##                                   Name1
    ## 1    Ana Trujillo Emparedados y helados
    ## 2    Ana Trujillo Emparedados y helados
    ## 3    Ana Trujillo Emparedados y helados
    ## 4    Ana Trujillo Emparedados y helados
    ## 5               Antonio Moreno Taquería
    ## 6               Antonio Moreno Taquería
    ## 7               Antonio Moreno Taquería
    ## 8               Antonio Moreno Taquería
    ## 9                       Around the Horn
    ## 10                      Around the Horn
    ## 11                      Around the Horn
    ## 12                      Around the Horn
    ## 13                      Around the Horn
    ## 14                        B's Beverages
    ## 15                        B's Beverages
    ## 16                        B's Beverages
    ## 17                        B's Beverages
    ## 18                        B's Beverages
    ## 19            Bólido Comidas preparadas
    ## 20            Bólido Comidas preparadas
    ## 21           Cactus Comidas para llevar
    ## 22           Cactus Comidas para llevar
    ## 23           Centro comercial Moctezuma
    ## 24           Centro comercial Moctezuma
    ## 25           Centro comercial Moctezuma
    ## 26           Centro comercial Moctezuma
    ## 27                     Comércio Mineiro
    ## 28                     Comércio Mineiro
    ## 29                     Comércio Mineiro
    ## 30                Consolidated Holdings
    ## 31                Consolidated Holdings
    ## 32                Consolidated Holdings
    ## 33                Consolidated Holdings
    ## 34                Consolidated Holdings
    ## 35                      Du monde entier
    ## 36                   Eastern Connection
    ## 37                   Eastern Connection
    ## 38                   Eastern Connection
    ## 39                   Eastern Connection
    ## 40                   Eastern Connection
    ## 41 FISSA Fabrica Inter. Salchichas S.A.
    ## 42 FISSA Fabrica Inter. Salchichas S.A.
    ## 43                   Familia Arquibaldo
    ## 44                   Familia Arquibaldo
    ## 45                   Familia Arquibaldo
    ## 46                  France restauration
    ## 47       Furia Bacalhau e Frutos do Mar
    ## 48                        Hanari Carnes
    ## 49                        Hanari Carnes
    ## 50             Lonesome Pine Restaurant
    ## 51                          North/South
    ## 52                          North/South
    ## 53                          North/South
    ## 54                          North/South
    ## 55                          North/South
    ## 56               Océano Atlántico Ltda.
    ## 57               Océano Atlántico Ltda.
    ## 58                    Paris spécialités
    ## 59            Pericles Comidas clásicas
    ## 60            Pericles Comidas clásicas
    ## 61            Pericles Comidas clásicas
    ## 62            Pericles Comidas clásicas
    ## 63               Princesa Isabel Vinhos
    ## 64                          Que Delícia
    ## 65                          Que Delícia
    ## 66                        Queen Cozinha
    ## 67                        Queen Cozinha
    ## 68                        Queen Cozinha
    ## 69                        Rancho grande
    ## 70                        Rancho grande
    ## 71                   Ricardo Adocicados
    ## 72                   Ricardo Adocicados
    ## 73                     Romero y tomillo
    ## 74                     Romero y tomillo
    ## 75                   Seven Seas Imports
    ## 76                   Seven Seas Imports
    ## 77                   Seven Seas Imports
    ## 78                   Seven Seas Imports
    ## 79                   Seven Seas Imports
    ## 80                 Spécialités du monde
    ## 81                       The Big Cheese
    ## 82                  Tortuga Restaurante
    ## 83                  Tortuga Restaurante
    ## 84                  Tortuga Restaurante
    ## 85                  Tortuga Restaurante
    ## 86               Tradição Hipermercados
    ## 87               Tradição Hipermercados
    ## 88               Tradição Hipermercados
    ##                                    Nam2           City           City
    ## 1               Antonio Moreno Taquería    México D.F.    México D.F.
    ## 2            Centro comercial Moctezuma    México D.F.    México D.F.
    ## 3             Pericles Comidas clásicas    México D.F.    México D.F.
    ## 4                   Tortuga Restaurante    México D.F.    México D.F.
    ## 5    Ana Trujillo Emparedados y helados    México D.F.    México D.F.
    ## 6            Centro comercial Moctezuma    México D.F.    México D.F.
    ## 7             Pericles Comidas clásicas    México D.F.    México D.F.
    ## 8                   Tortuga Restaurante    México D.F.    México D.F.
    ## 9                         B's Beverages         London         London
    ## 10                Consolidated Holdings         London         London
    ## 11                   Eastern Connection         London         London
    ## 12                          North/South         London         London
    ## 13                   Seven Seas Imports         London         London
    ## 14                      Around the Horn         London         London
    ## 15                Consolidated Holdings         London         London
    ## 16                   Eastern Connection         London         London
    ## 17                          North/South         London         London
    ## 18                   Seven Seas Imports         London         London
    ## 19 FISSA Fabrica Inter. Salchichas S.A.         Madrid         Madrid
    ## 20                     Romero y tomillo         Madrid         Madrid
    ## 21               Océano Atlántico Ltda.   Buenos Aires   Buenos Aires
    ## 22                        Rancho grande   Buenos Aires   Buenos Aires
    ## 23   Ana Trujillo Emparedados y helados    México D.F.    México D.F.
    ## 24              Antonio Moreno Taquería    México D.F.    México D.F.
    ## 25            Pericles Comidas clásicas    México D.F.    México D.F.
    ## 26                  Tortuga Restaurante    México D.F.    México D.F.
    ## 27                   Familia Arquibaldo      São Paulo      São Paulo
    ## 28                        Queen Cozinha      São Paulo      São Paulo
    ## 29               Tradição Hipermercados      São Paulo      São Paulo
    ## 30                      Around the Horn         London         London
    ## 31                        B's Beverages         London         London
    ## 32                   Eastern Connection         London         London
    ## 33                          North/South         London         London
    ## 34                   Seven Seas Imports         London         London
    ## 35                  France restauration         Nantes         Nantes
    ## 36                      Around the Horn         London         London
    ## 37                        B's Beverages         London         London
    ## 38                Consolidated Holdings         London         London
    ## 39                          North/South         London         London
    ## 40                   Seven Seas Imports         London         London
    ## 41            Bólido Comidas preparadas         Madrid         Madrid
    ## 42                     Romero y tomillo         Madrid         Madrid
    ## 43                     Comércio Mineiro      São Paulo      São Paulo
    ## 44                        Queen Cozinha      São Paulo      São Paulo
    ## 45               Tradição Hipermercados      São Paulo      São Paulo
    ## 46                      Du monde entier         Nantes         Nantes
    ## 47               Princesa Isabel Vinhos         Lisboa         Lisboa
    ## 48                          Que Delícia Rio de Janeiro Rio de Janeiro
    ## 49                   Ricardo Adocicados Rio de Janeiro Rio de Janeiro
    ## 50                       The Big Cheese       Portland       Portland
    ## 51                      Around the Horn         London         London
    ## 52                        B's Beverages         London         London
    ## 53                Consolidated Holdings         London         London
    ## 54                   Eastern Connection         London         London
    ## 55                   Seven Seas Imports         London         London
    ## 56           Cactus Comidas para llevar   Buenos Aires   Buenos Aires
    ## 57                        Rancho grande   Buenos Aires   Buenos Aires
    ## 58                 Spécialités du monde          Paris          Paris
    ## 59   Ana Trujillo Emparedados y helados    México D.F.    México D.F.
    ## 60              Antonio Moreno Taquería    México D.F.    México D.F.
    ## 61           Centro comercial Moctezuma    México D.F.    México D.F.
    ## 62                  Tortuga Restaurante    México D.F.    México D.F.
    ## 63       Furia Bacalhau e Frutos do Mar         Lisboa         Lisboa
    ## 64                        Hanari Carnes Rio de Janeiro Rio de Janeiro
    ## 65                   Ricardo Adocicados Rio de Janeiro Rio de Janeiro
    ## 66                     Comércio Mineiro      São Paulo      São Paulo
    ## 67                   Familia Arquibaldo      São Paulo      São Paulo
    ## 68               Tradição Hipermercados      São Paulo      São Paulo
    ## 69           Cactus Comidas para llevar   Buenos Aires   Buenos Aires
    ## 70               Océano Atlántico Ltda.   Buenos Aires   Buenos Aires
    ## 71                        Hanari Carnes Rio de Janeiro Rio de Janeiro
    ## 72                          Que Delícia Rio de Janeiro Rio de Janeiro
    ## 73            Bólido Comidas preparadas         Madrid         Madrid
    ## 74 FISSA Fabrica Inter. Salchichas S.A.         Madrid         Madrid
    ## 75                      Around the Horn         London         London
    ## 76                        B's Beverages         London         London
    ## 77                Consolidated Holdings         London         London
    ## 78                   Eastern Connection         London         London
    ## 79                          North/South         London         London
    ## 80                    Paris spécialités          Paris          Paris
    ## 81             Lonesome Pine Restaurant       Portland       Portland
    ## 82   Ana Trujillo Emparedados y helados    México D.F.    México D.F.
    ## 83              Antonio Moreno Taquería    México D.F.    México D.F.
    ## 84           Centro comercial Moctezuma    México D.F.    México D.F.
    ## 85            Pericles Comidas clásicas    México D.F.    México D.F.
    ## 86                     Comércio Mineiro      São Paulo      São Paulo
    ## 87                   Familia Arquibaldo      São Paulo      São Paulo
    ## 88                        Queen Cozinha      São Paulo      São Paulo

Joins across 3 tables - Orders,Customers and Shippers
=====================================================

``` r
sqldf("SELECT O.OrderID,C.CompanyName,S.CompanyName
       FROM Orders AS O
       INNER JOIN Customers As C
       USING(CustomerID)
       INNER JOIN Shippers As S
       ON O.ShipVia = S.ShipperID;")
```

    ##     OrderID                        CompanyName      CompanyName
    ## 1     10248                        Wilman Kala Federal Shipping
    ## 2     10249             Tradição Hipermercados   Speedy Express
    ## 3     10250                      Hanari Carnes   United Package
    ## 4     10251               Victuailles en stock   Speedy Express
    ## 5     10252                   Suprêmes délices   United Package
    ## 6     10253                      Hanari Carnes   United Package
    ## 7     10254                  Chop-suey Chinese   United Package
    ## 8     10255                 Richter Supermarkt Federal Shipping
    ## 9     10256             Wellington Importadora   United Package
    ## 10    10257                   HILARIÓN-Abastos Federal Shipping
    ## 11    10258                       Ernst Handel   Speedy Express
    ## 12    10259         Centro comercial Moctezuma Federal Shipping
    ## 13    10260             Old World Delicatessen   Speedy Express
    ## 14    10261                        Que Delícia   United Package
    ## 15    10262         Rattlesnake Canyon Grocery Federal Shipping
    ## 16    10263                       Ernst Handel Federal Shipping
    ## 17    10264                     Folk och fä HB Federal Shipping
    ## 18    10265               Blondel père et fils   Speedy Express
    ## 19    10266                     Wartian Herkku Federal Shipping
    ## 20    10267                     Frankenversand   Speedy Express
    ## 21    10268               GROSELLA-Restaurante Federal Shipping
    ## 22    10269               White Clover Markets   Speedy Express
    ## 23    10270                     Wartian Herkku   Speedy Express
    ## 24    10271              Split Rail Beer & Ale   United Package
    ## 25    10272         Rattlesnake Canyon Grocery   United Package
    ## 26    10273                         QUICK-Stop Federal Shipping
    ## 27    10274          Vins et alcools Chevalier   Speedy Express
    ## 28    10275       Magazzini Alimentari Riuniti   Speedy Express
    ## 29    10276                Tortuga Restaurante Federal Shipping
    ## 30    10277             Morgenstern Gesundkost Federal Shipping
    ## 31    10278                 Berglunds snabbköp   United Package
    ## 32    10279                Lehmanns Marktstand   United Package
    ## 33    10280                 Berglunds snabbköp   Speedy Express
    ## 34    10281                   Romero y tomillo   Speedy Express
    ## 35    10282                   Romero y tomillo   Speedy Express
    ## 36    10283                  LILA-Supermercado Federal Shipping
    ## 37    10284                Lehmanns Marktstand   Speedy Express
    ## 38    10285                         QUICK-Stop   United Package
    ## 39    10286                         QUICK-Stop Federal Shipping
    ## 40    10287                 Ricardo Adocicados Federal Shipping
    ## 41    10288                 Reggiani Caseifici   Speedy Express
    ## 42    10289                      B's Beverages Federal Shipping
    ## 43    10290                   Comércio Mineiro   Speedy Express
    ## 44    10291                        Que Delícia   United Package
    ## 45    10292             Tradição Hipermercados   United Package
    ## 46    10293                Tortuga Restaurante Federal Shipping
    ## 47    10294         Rattlesnake Canyon Grocery   United Package
    ## 48    10295          Vins et alcools Chevalier   United Package
    ## 49    10296                  LILA-Supermercado   Speedy Express
    ## 50    10297               Blondel père et fils   United Package
    ## 51    10298       Hungry Owl All-Night Grocers   United Package
    ## 52    10299                 Ricardo Adocicados   United Package
    ## 53    10300       Magazzini Alimentari Riuniti   United Package
    ## 54    10301                  Die Wandernde Kuh   United Package
    ## 55    10302                   Suprêmes délices   United Package
    ## 56    10303                Godos Cocina Típica   United Package
    ## 57    10304                Tortuga Restaurante   United Package
    ## 58    10305             Old World Delicatessen Federal Shipping
    ## 59    10306                   Romero y tomillo Federal Shipping
    ## 60    10307           Lonesome Pine Restaurant   United Package
    ## 61    10308 Ana Trujillo Emparedados y helados Federal Shipping
    ## 62    10309       Hungry Owl All-Night Grocers   Speedy Express
    ## 63    10310                     The Big Cheese   United Package
    ## 64    10311                    Du monde entier Federal Shipping
    ## 65    10312                  Die Wandernde Kuh   United Package
    ## 66    10313                         QUICK-Stop   United Package
    ## 67    10314         Rattlesnake Canyon Grocery   United Package
    ## 68    10315                     Island Trading   United Package
    ## 69    10316         Rattlesnake Canyon Grocery Federal Shipping
    ## 70    10317           Lonesome Pine Restaurant   Speedy Express
    ## 71    10318                     Island Trading   United Package
    ## 72    10319                Tortuga Restaurante Federal Shipping
    ## 73    10320                     Wartian Herkku Federal Shipping
    ## 74    10321                     Island Trading   United Package
    ## 75    10322          Pericles Comidas clásicas Federal Shipping
    ## 76    10323                    Königlich Essen   Speedy Express
    ## 77    10324                 Save-a-lot Markets   Speedy Express
    ## 78    10325                    Königlich Essen Federal Shipping
    ## 79    10326          Bólido Comidas preparadas   United Package
    ## 80    10327                     Folk och fä HB   Speedy Express
    ## 81    10328     Furia Bacalhau e Frutos do Mar Federal Shipping
    ## 82    10329              Split Rail Beer & Ale   United Package
    ## 83    10330                  LILA-Supermercado   Speedy Express
    ## 84    10331                           Bon app'   Speedy Express
    ## 85    10332                     Mère Paillarde   United Package
    ## 86    10333                     Wartian Herkku Federal Shipping
    ## 87    10334               Victuailles en stock   United Package
    ## 88    10335       Hungry Owl All-Night Grocers   United Package
    ## 89    10336             Princesa Isabel Vinhos   United Package
    ## 90    10337                     Frankenversand Federal Shipping
    ## 91    10338             Old World Delicatessen Federal Shipping
    ## 92    10339                     Mère Paillarde   United Package
    ## 93    10340                           Bon app' Federal Shipping
    ## 94    10341                      Simons bistro Federal Shipping
    ## 95    10342                     Frankenversand   United Package
    ## 96    10343                Lehmanns Marktstand   Speedy Express
    ## 97    10344               White Clover Markets   United Package
    ## 98    10345                         QUICK-Stop   United Package
    ## 99    10346         Rattlesnake Canyon Grocery Federal Shipping
    ## 100   10347                 Familia Arquibaldo Federal Shipping
    ## 101   10348                  Die Wandernde Kuh   United Package
    ## 102   10349              Split Rail Beer & Ale   Speedy Express
    ## 103   10350                   La maison d'Asie   United Package
    ## 104   10351                       Ernst Handel   Speedy Express
    ## 105   10352     Furia Bacalhau e Frutos do Mar Federal Shipping
    ## 106   10353                   Piccolo und mehr Federal Shipping
    ## 107   10354          Pericles Comidas clásicas Federal Shipping
    ## 108   10355                    Around the Horn   Speedy Express
    ## 109   10356                  Die Wandernde Kuh   United Package
    ## 110   10357                  LILA-Supermercado Federal Shipping
    ## 111   10358                   La maison d'Asie   Speedy Express
    ## 112   10359                 Seven Seas Imports Federal Shipping
    ## 113   10360               Blondel père et fils Federal Shipping
    ## 114   10361                         QUICK-Stop   United Package
    ## 115   10362                           Bon app'   Speedy Express
    ## 116   10363           Drachenblut Delikatessen Federal Shipping
    ## 117   10364                 Eastern Connection   Speedy Express
    ## 118   10365            Antonio Moreno Taquería   United Package
    ## 119   10366             Galería del gastrónomo   United Package
    ## 120   10367                       Vaffeljernet Federal Shipping
    ## 121   10368                       Ernst Handel   United Package
    ## 122   10369              Split Rail Beer & Ale   United Package
    ## 123   10370                  Chop-suey Chinese   United Package
    ## 124   10371                   La maison d'Asie   Speedy Express
    ## 125   10372                      Queen Cozinha   United Package
    ## 126   10373       Hungry Owl All-Night Grocers Federal Shipping
    ## 127   10374                     Wolski  Zajazd Federal Shipping
    ## 128   10375         Hungry Coyote Import Store   United Package
    ## 129   10376                     Mère Paillarde   United Package
    ## 130   10377                 Seven Seas Imports Federal Shipping
    ## 131   10378                     Folk och fä HB Federal Shipping
    ## 132   10379                        Que Delícia   Speedy Express
    ## 133   10380       Hungry Owl All-Night Grocers Federal Shipping
    ## 134   10381                  LILA-Supermercado Federal Shipping
    ## 135   10382                       Ernst Handel   Speedy Express
    ## 136   10383                    Around the Horn Federal Shipping
    ## 137   10384                 Berglunds snabbköp Federal Shipping
    ## 138   10385              Split Rail Beer & Ale   United Package
    ## 139   10386                 Familia Arquibaldo Federal Shipping
    ## 140   10387                      Santé Gourmet   United Package
    ## 141   10388                 Seven Seas Imports   Speedy Express
    ## 142   10389              Bottom-Dollar Markets   United Package
    ## 143   10390                       Ernst Handel   Speedy Express
    ## 144   10391           Drachenblut Delikatessen Federal Shipping
    ## 145   10392                   Piccolo und mehr Federal Shipping
    ## 146   10393                 Save-a-lot Markets Federal Shipping
    ## 147   10394         Hungry Coyote Import Store Federal Shipping
    ## 148   10395                   HILARIÓN-Abastos   Speedy Express
    ## 149   10396                     Frankenversand Federal Shipping
    ## 150   10397             Princesa Isabel Vinhos   Speedy Express
    ## 151   10398                 Save-a-lot Markets Federal Shipping
    ## 152   10399                       Vaffeljernet Federal Shipping
    ## 153   10400                 Eastern Connection Federal Shipping
    ## 154   10401         Rattlesnake Canyon Grocery   Speedy Express
    ## 155   10402                       Ernst Handel   United Package
    ## 156   10403                       Ernst Handel Federal Shipping
    ## 157   10404       Magazzini Alimentari Riuniti   Speedy Express
    ## 158   10405                   LINO-Delicateses   Speedy Express
    ## 159   10406                      Queen Cozinha   Speedy Express
    ## 160   10407                 Ottilies Käseladen   United Package
    ## 161   10408                  Folies gourmandes   Speedy Express
    ## 162   10409             Océano Atlántico Ltda.   Speedy Express
    ## 163   10410              Bottom-Dollar Markets Federal Shipping
    ## 164   10411              Bottom-Dollar Markets Federal Shipping
    ## 165   10412                     Wartian Herkku   United Package
    ## 166   10413                   La maison d'Asie   United Package
    ## 167   10414                 Familia Arquibaldo Federal Shipping
    ## 168   10415         Hungry Coyote Import Store   Speedy Express
    ## 169   10416                     Wartian Herkku Federal Shipping
    ## 170   10417                      Simons bistro Federal Shipping
    ## 171   10418                         QUICK-Stop   Speedy Express
    ## 172   10419                 Richter Supermarkt   United Package
    ## 173   10420             Wellington Importadora   Speedy Express
    ## 174   10421                        Que Delícia   Speedy Express
    ## 175   10422                     Franchi S.p.A.   Speedy Express
    ## 176   10423                Gourmet Lanchonetes Federal Shipping
    ## 177   10424                     Mère Paillarde   United Package
    ## 178   10425                   La maison d'Asie   United Package
    ## 179   10426             Galería del gastrónomo   Speedy Express
    ## 180   10427                   Piccolo und mehr   United Package
    ## 181   10428                 Reggiani Caseifici   Speedy Express
    ## 182   10429       Hungry Owl All-Night Grocers   United Package
    ## 183   10430                       Ernst Handel   Speedy Express
    ## 184   10431              Bottom-Dollar Markets   United Package
    ## 185   10432              Split Rail Beer & Ale   United Package
    ## 186   10433             Princesa Isabel Vinhos Federal Shipping
    ## 187   10434                     Folk och fä HB   United Package
    ## 188   10435              Consolidated Holdings   United Package
    ## 189   10436               Blondel père et fils   United Package
    ## 190   10437                     Wartian Herkku   Speedy Express
    ## 191   10438                 Toms Spezialitäten   United Package
    ## 192   10439                     Mère Paillarde Federal Shipping
    ## 193   10440                 Save-a-lot Markets   United Package
    ## 194   10441             Old World Delicatessen   United Package
    ## 195   10442                       Ernst Handel   United Package
    ## 196   10443                 Reggiani Caseifici   Speedy Express
    ## 197   10444                 Berglunds snabbköp Federal Shipping
    ## 198   10445                 Berglunds snabbköp   Speedy Express
    ## 199   10446                 Toms Spezialitäten   Speedy Express
    ## 200   10447                 Ricardo Adocicados   United Package
    ## 201   10448                      Rancho grande   United Package
    ## 202   10449               Blondel père et fils   United Package
    ## 203   10450               Victuailles en stock   United Package
    ## 204   10451                         QUICK-Stop Federal Shipping
    ## 205   10452                 Save-a-lot Markets   Speedy Express
    ## 206   10453                    Around the Horn   United Package
    ## 207   10454                   La maison d'Asie Federal Shipping
    ## 208   10455                     Wartian Herkku   United Package
    ## 209   10456                    Königlich Essen   United Package
    ## 210   10457                    Königlich Essen   Speedy Express
    ## 211   10458                   Suprêmes délices Federal Shipping
    ## 212   10459               Victuailles en stock   United Package
    ## 213   10460                     Folk och fä HB   Speedy Express
    ## 214   10461                  LILA-Supermercado Federal Shipping
    ## 215   10462              Consolidated Holdings   Speedy Express
    ## 216   10463                   Suprêmes délices Federal Shipping
    ## 217   10464     Furia Bacalhau e Frutos do Mar   United Package
    ## 218   10465                       Vaffeljernet Federal Shipping
    ## 219   10466                   Comércio Mineiro   Speedy Express
    ## 220   10467       Magazzini Alimentari Riuniti   United Package
    ## 221   10468                    Königlich Essen Federal Shipping
    ## 222   10469               White Clover Markets   Speedy Express
    ## 223   10470                           Bon app'   United Package
    ## 224   10471                      B's Beverages Federal Shipping
    ## 225   10472                 Seven Seas Imports   Speedy Express
    ## 226   10473                     Island Trading Federal Shipping
    ## 227   10474          Pericles Comidas clásicas   United Package
    ## 228   10475                   Suprêmes délices   Speedy Express
    ## 229   10476                   HILARIÓN-Abastos Federal Shipping
    ## 230   10477             Princesa Isabel Vinhos   United Package
    ## 231   10478               Victuailles en stock Federal Shipping
    ## 232   10479         Rattlesnake Canyon Grocery Federal Shipping
    ## 233   10480                  Folies gourmandes   United Package
    ## 234   10481                 Ricardo Adocicados   United Package
    ## 235   10482               Lazy K Kountry Store Federal Shipping
    ## 236   10483               White Clover Markets   United Package
    ## 237   10484                      B's Beverages Federal Shipping
    ## 238   10485                   LINO-Delicateses   United Package
    ## 239   10486                   HILARIÓN-Abastos   United Package
    ## 240   10487                      Queen Cozinha   United Package
    ## 241   10488                     Frankenversand   United Package
    ## 242   10489                   Piccolo und mehr   United Package
    ## 243   10490                   HILARIÓN-Abastos   United Package
    ## 244   10491     Furia Bacalhau e Frutos do Mar Federal Shipping
    ## 245   10492              Bottom-Dollar Markets   Speedy Express
    ## 246   10493                   La maison d'Asie Federal Shipping
    ## 247   10494                   Comércio Mineiro   United Package
    ## 248   10495      Laughing Bacchus Wine Cellars Federal Shipping
    ## 249   10496             Tradição Hipermercados   United Package
    ## 250   10497                Lehmanns Marktstand   Speedy Express
    ## 251   10498                   HILARIÓN-Abastos   United Package
    ## 252   10499                  LILA-Supermercado   United Package
    ## 253   10500                   La maison d'Asie   Speedy Express
    ## 254   10501            Blauer See Delikatessen Federal Shipping
    ## 255   10502          Pericles Comidas clásicas   Speedy Express
    ## 256   10503       Hungry Owl All-Night Grocers   United Package
    ## 257   10504               White Clover Markets Federal Shipping
    ## 258   10505                     Mère Paillarde Federal Shipping
    ## 259   10506                    Königlich Essen   United Package
    ## 260   10507            Antonio Moreno Taquería   Speedy Express
    ## 261   10508                 Ottilies Käseladen   United Package
    ## 262   10509            Blauer See Delikatessen   Speedy Express
    ## 263   10510                 Save-a-lot Markets Federal Shipping
    ## 264   10511                           Bon app' Federal Shipping
    ## 265   10512                 Familia Arquibaldo   United Package
    ## 266   10513                  Die Wandernde Kuh   Speedy Express
    ## 267   10514                       Ernst Handel   United Package
    ## 268   10515                         QUICK-Stop   Speedy Express
    ## 269   10516       Hungry Owl All-Night Grocers Federal Shipping
    ## 270   10517                        North/South Federal Shipping
    ## 271   10518                Tortuga Restaurante   United Package
    ## 272   10519                  Chop-suey Chinese Federal Shipping
    ## 273   10520                      Santé Gourmet   Speedy Express
    ## 274   10521         Cactus Comidas para llevar   United Package
    ## 275   10522                Lehmanns Marktstand   Speedy Express
    ## 276   10523                 Seven Seas Imports   United Package
    ## 277   10524                 Berglunds snabbköp   United Package
    ## 278   10525                           Bon app'   United Package
    ## 279   10526                     Wartian Herkku   United Package
    ## 280   10527                         QUICK-Stop   Speedy Express
    ## 281   10528            Great Lakes Food Market   United Package
    ## 282   10529                       Maison Dewey   United Package
    ## 283   10530                   Piccolo und mehr   United Package
    ## 284   10531             Océano Atlántico Ltda.   Speedy Express
    ## 285   10532                 Eastern Connection Federal Shipping
    ## 286   10533                     Folk och fä HB   Speedy Express
    ## 287   10534                Lehmanns Marktstand   United Package
    ## 288   10535            Antonio Moreno Taquería   Speedy Express
    ## 289   10536                Lehmanns Marktstand   United Package
    ## 290   10537                 Richter Supermarkt   Speedy Express
    ## 291   10538                      B's Beverages Federal Shipping
    ## 292   10539                      B's Beverages Federal Shipping
    ## 293   10540                         QUICK-Stop Federal Shipping
    ## 294   10541                      Hanari Carnes   Speedy Express
    ## 295   10542                    Königlich Essen Federal Shipping
    ## 296   10543                  LILA-Supermercado   United Package
    ## 297   10544           Lonesome Pine Restaurant   Speedy Express
    ## 298   10545               Lazy K Kountry Store   United Package
    ## 299   10546               Victuailles en stock Federal Shipping
    ## 300   10547                 Seven Seas Imports   United Package
    ## 301   10548                 Toms Spezialitäten   United Package
    ## 302   10549                         QUICK-Stop   Speedy Express
    ## 303   10550                Godos Cocina Típica Federal Shipping
    ## 304   10551     Furia Bacalhau e Frutos do Mar Federal Shipping
    ## 305   10552                   HILARIÓN-Abastos   Speedy Express
    ## 306   10553                     Wartian Herkku   United Package
    ## 307   10554                 Ottilies Käseladen Federal Shipping
    ## 308   10555                 Save-a-lot Markets Federal Shipping
    ## 309   10556                      Simons bistro   Speedy Express
    ## 310   10557                Lehmanns Marktstand   United Package
    ## 311   10558                    Around the Horn   United Package
    ## 312   10559               Blondel père et fils   Speedy Express
    ## 313   10560                     Frankenversand   Speedy Express
    ## 314   10561                     Folk och fä HB   United Package
    ## 315   10562                 Reggiani Caseifici   Speedy Express
    ## 316   10563                 Ricardo Adocicados   United Package
    ## 317   10564         Rattlesnake Canyon Grocery Federal Shipping
    ## 318   10565                     Mère Paillarde   United Package
    ## 319   10566               Blondel père et fils   Speedy Express
    ## 320   10567       Hungry Owl All-Night Grocers   Speedy Express
    ## 321   10568             Galería del gastrónomo Federal Shipping
    ## 322   10569         Rattlesnake Canyon Grocery   Speedy Express
    ## 323   10570                     Mère Paillarde Federal Shipping
    ## 324   10571                       Ernst Handel Federal Shipping
    ## 325   10572                 Berglunds snabbköp   United Package
    ## 326   10573            Antonio Moreno Taquería Federal Shipping
    ## 327   10574  Trail's Head Gourmet Provisioners   United Package
    ## 328   10575             Morgenstern Gesundkost   Speedy Express
    ## 329   10576                Tortuga Restaurante Federal Shipping
    ## 330   10577  Trail's Head Gourmet Provisioners   United Package
    ## 331   10578                      B's Beverages Federal Shipping
    ## 332   10579                  Let's Stop N Shop   United Package
    ## 333   10580                 Ottilies Käseladen Federal Shipping
    ## 334   10581                 Familia Arquibaldo   Speedy Express
    ## 335   10582            Blauer See Delikatessen   United Package
    ## 336   10583                     Wartian Herkku   United Package
    ## 337   10584               Blondel père et fils   Speedy Express
    ## 338   10585             Wellington Importadora   Speedy Express
    ## 339   10586                 Reggiani Caseifici   Speedy Express
    ## 340   10587                        Que Delícia   Speedy Express
    ## 341   10588                         QUICK-Stop Federal Shipping
    ## 342   10589            Great Lakes Food Market   United Package
    ## 343   10590                     Mère Paillarde Federal Shipping
    ## 344   10591                       Vaffeljernet   Speedy Express
    ## 345   10592                Lehmanns Marktstand   Speedy Express
    ## 346   10593                Lehmanns Marktstand   United Package
    ## 347   10594             Old World Delicatessen   United Package
    ## 348   10595                       Ernst Handel   Speedy Express
    ## 349   10596               White Clover Markets   Speedy Express
    ## 350   10597                   Piccolo und mehr Federal Shipping
    ## 351   10598         Rattlesnake Canyon Grocery Federal Shipping
    ## 352   10599                      B's Beverages Federal Shipping
    ## 353   10600         Hungry Coyote Import Store   Speedy Express
    ## 354   10601                   HILARIÓN-Abastos   Speedy Express
    ## 355   10602                       Vaffeljernet   United Package
    ## 356   10603                 Save-a-lot Markets   United Package
    ## 357   10604     Furia Bacalhau e Frutos do Mar   Speedy Express
    ## 358   10605                     Mère Paillarde   United Package
    ## 359   10606             Tradição Hipermercados Federal Shipping
    ## 360   10607                 Save-a-lot Markets   Speedy Express
    ## 361   10608                 Toms Spezialitäten   United Package
    ## 362   10609                    Du monde entier   United Package
    ## 363   10610                   La maison d'Asie   Speedy Express
    ## 364   10611                     Wolski  Zajazd   United Package
    ## 365   10612                 Save-a-lot Markets   United Package
    ## 366   10613                   HILARIÓN-Abastos   United Package
    ## 367   10614            Blauer See Delikatessen Federal Shipping
    ## 368   10615                        Wilman Kala Federal Shipping
    ## 369   10616            Great Lakes Food Market   United Package
    ## 370   10617            Great Lakes Food Market   United Package
    ## 371   10618                     Mère Paillarde   Speedy Express
    ## 372   10619                     Mère Paillarde Federal Shipping
    ## 373   10620      Laughing Bacchus Wine Cellars Federal Shipping
    ## 374   10621                     Island Trading   United Package
    ## 375   10622                 Ricardo Adocicados Federal Shipping
    ## 376   10623                     Frankenversand   United Package
    ## 377   10624                    The Cracker Box   United Package
    ## 378   10625 Ana Trujillo Emparedados y helados   Speedy Express
    ## 379   10626                 Berglunds snabbköp   United Package
    ## 380   10627                 Save-a-lot Markets Federal Shipping
    ## 381   10628               Blondel père et fils Federal Shipping
    ## 382   10629                Godos Cocina Típica Federal Shipping
    ## 383   10630                    Königlich Essen   United Package
    ## 384   10631                   La maison d'Asie   Speedy Express
    ## 385   10632                  Die Wandernde Kuh   Speedy Express
    ## 386   10633                       Ernst Handel Federal Shipping
    ## 387   10634                  Folies gourmandes Federal Shipping
    ## 388   10635       Magazzini Alimentari Riuniti Federal Shipping
    ## 389   10636                     Wartian Herkku   Speedy Express
    ## 390   10637                      Queen Cozinha   Speedy Express
    ## 391   10638                   LINO-Delicateses   Speedy Express
    ## 392   10639                      Santé Gourmet Federal Shipping
    ## 393   10640                  Die Wandernde Kuh   Speedy Express
    ## 394   10641                   HILARIÓN-Abastos   United Package
    ## 395   10642                      Simons bistro Federal Shipping
    ## 396   10643                Alfreds Futterkiste   Speedy Express
    ## 397   10644             Wellington Importadora   United Package
    ## 398   10645                      Hanari Carnes   Speedy Express
    ## 399   10646       Hungry Owl All-Night Grocers Federal Shipping
    ## 400   10647                        Que Delícia   United Package
    ## 401   10648                 Ricardo Adocicados   United Package
    ## 402   10649                       Maison Dewey Federal Shipping
    ## 403   10650                 Familia Arquibaldo Federal Shipping
    ## 404   10651                  Die Wandernde Kuh   United Package
    ## 405   10652                Gourmet Lanchonetes   United Package
    ## 406   10653                     Frankenversand   Speedy Express
    ## 407   10654                 Berglunds snabbköp   Speedy Express
    ## 408   10655                 Reggiani Caseifici   United Package
    ## 409   10656            Great Lakes Food Market   Speedy Express
    ## 410   10657                 Save-a-lot Markets   United Package
    ## 411   10658                         QUICK-Stop   Speedy Express
    ## 412   10659                      Queen Cozinha   United Package
    ## 413   10660         Hungry Coyote Import Store   Speedy Express
    ## 414   10661       Hungry Owl All-Night Grocers Federal Shipping
    ## 415   10662           Lonesome Pine Restaurant   United Package
    ## 416   10663                           Bon app'   United Package
    ## 417   10664     Furia Bacalhau e Frutos do Mar Federal Shipping
    ## 418   10665           Lonesome Pine Restaurant   United Package
    ## 419   10666                 Richter Supermarkt   United Package
    ## 420   10667                       Ernst Handel   Speedy Express
    ## 421   10668                  Die Wandernde Kuh   United Package
    ## 422   10669                      Simons bistro   Speedy Express
    ## 423   10670                     Frankenversand   Speedy Express
    ## 424   10671                France restauration   Speedy Express
    ## 425   10672                 Berglunds snabbköp   United Package
    ## 426   10673                        Wilman Kala   Speedy Express
    ## 427   10674                     Island Trading   United Package
    ## 428   10675                     Frankenversand   United Package
    ## 429   10676                Tortuga Restaurante   United Package
    ## 430   10677            Antonio Moreno Taquería Federal Shipping
    ## 431   10678                 Save-a-lot Markets Federal Shipping
    ## 432   10679               Blondel père et fils Federal Shipping
    ## 433   10680             Old World Delicatessen   Speedy Express
    ## 434   10681            Great Lakes Food Market Federal Shipping
    ## 435   10682            Antonio Moreno Taquería   United Package
    ## 436   10683                    Du monde entier   Speedy Express
    ## 437   10684                 Ottilies Käseladen   Speedy Express
    ## 438   10685                Gourmet Lanchonetes   United Package
    ## 439   10686                   Piccolo und mehr   Speedy Express
    ## 440   10687       Hungry Owl All-Night Grocers   United Package
    ## 441   10688                       Vaffeljernet   United Package
    ## 442   10689                 Berglunds snabbköp   United Package
    ## 443   10690                      Hanari Carnes   Speedy Express
    ## 444   10691                         QUICK-Stop   United Package
    ## 445   10692                Alfreds Futterkiste   United Package
    ## 446   10693               White Clover Markets Federal Shipping
    ## 447   10694                         QUICK-Stop Federal Shipping
    ## 448   10695                        Wilman Kala   Speedy Express
    ## 449   10696               White Clover Markets Federal Shipping
    ## 450   10697                   LINO-Delicateses   Speedy Express
    ## 451   10698                       Ernst Handel   Speedy Express
    ## 452   10699             Morgenstern Gesundkost Federal Shipping
    ## 453   10700                 Save-a-lot Markets   Speedy Express
    ## 454   10701       Hungry Owl All-Night Grocers Federal Shipping
    ## 455   10702                Alfreds Futterkiste   Speedy Express
    ## 456   10703                     Folk och fä HB   United Package
    ## 457   10704                      Queen Cozinha   Speedy Express
    ## 458   10705                   HILARIÓN-Abastos   United Package
    ## 459   10706             Old World Delicatessen Federal Shipping
    ## 460   10707                    Around the Horn Federal Shipping
    ## 461   10708                     The Big Cheese   United Package
    ## 462   10709                Gourmet Lanchonetes Federal Shipping
    ## 463   10710                     Franchi S.p.A.   Speedy Express
    ## 464   10711                 Save-a-lot Markets   United Package
    ## 465   10712       Hungry Owl All-Night Grocers   Speedy Express
    ## 466   10713                 Save-a-lot Markets   Speedy Express
    ## 467   10714                 Save-a-lot Markets Federal Shipping
    ## 468   10715                           Bon app'   Speedy Express
    ## 469   10716                      Rancho grande   United Package
    ## 470   10717                     Frankenversand   United Package
    ## 471   10718                    Königlich Essen Federal Shipping
    ## 472   10719                  Let's Stop N Shop   United Package
    ## 473   10720                        Que Delícia   United Package
    ## 474   10721                         QUICK-Stop Federal Shipping
    ## 475   10722                 Save-a-lot Markets   Speedy Express
    ## 476   10723               White Clover Markets   Speedy Express
    ## 477   10724                     Mère Paillarde   United Package
    ## 478   10725                 Familia Arquibaldo Federal Shipping
    ## 479   10726                 Eastern Connection   Speedy Express
    ## 480   10727                 Reggiani Caseifici   Speedy Express
    ## 481   10728                      Queen Cozinha   United Package
    ## 482   10729                   LINO-Delicateses Federal Shipping
    ## 483   10730                           Bon app'   Speedy Express
    ## 484   10731                  Chop-suey Chinese   Speedy Express
    ## 485   10732                           Bon app'   Speedy Express
    ## 486   10733                 Berglunds snabbköp Federal Shipping
    ## 487   10734                Gourmet Lanchonetes Federal Shipping
    ## 488   10735                  Let's Stop N Shop   United Package
    ## 489   10736       Hungry Owl All-Night Grocers   United Package
    ## 490   10737          Vins et alcools Chevalier   United Package
    ## 491   10738               Spécialités du monde   Speedy Express
    ## 492   10739          Vins et alcools Chevalier Federal Shipping
    ## 493   10740               White Clover Markets   United Package
    ## 494   10741                    Around the Horn Federal Shipping
    ## 495   10742              Bottom-Dollar Markets Federal Shipping
    ## 496   10743                    Around the Horn   United Package
    ## 497   10744                       Vaffeljernet   Speedy Express
    ## 498   10745                         QUICK-Stop   Speedy Express
    ## 499   10746                  Chop-suey Chinese Federal Shipping
    ## 500   10747                   Piccolo und mehr   Speedy Express
    ## 501   10748                 Save-a-lot Markets   Speedy Express
    ## 502   10749                     Island Trading   United Package
    ## 503   10750                     Wartian Herkku   Speedy Express
    ## 504   10751                 Richter Supermarkt Federal Shipping
    ## 505   10752                        North/South Federal Shipping
    ## 506   10753                     Franchi S.p.A.   Speedy Express
    ## 507   10754       Magazzini Alimentari Riuniti Federal Shipping
    ## 508   10755                           Bon app'   United Package
    ## 509   10756              Split Rail Beer & Ale   United Package
    ## 510   10757                 Save-a-lot Markets   Speedy Express
    ## 511   10758                 Richter Supermarkt Federal Shipping
    ## 512   10759 Ana Trujillo Emparedados y helados Federal Shipping
    ## 513   10760                       Maison Dewey   Speedy Express
    ## 514   10761         Rattlesnake Canyon Grocery   United Package
    ## 515   10762                     Folk och fä HB   Speedy Express
    ## 516   10763                  Folies gourmandes Federal Shipping
    ## 517   10764                       Ernst Handel Federal Shipping
    ## 518   10765                         QUICK-Stop Federal Shipping
    ## 519   10766                 Ottilies Käseladen   Speedy Express
    ## 520   10767                   Suprêmes délices Federal Shipping
    ## 521   10768                    Around the Horn   United Package
    ## 522   10769                       Vaffeljernet   Speedy Express
    ## 523   10770                      Hanari Carnes Federal Shipping
    ## 524   10771                       Ernst Handel   United Package
    ## 525   10772                Lehmanns Marktstand   United Package
    ## 526   10773                       Ernst Handel Federal Shipping
    ## 527   10774                     Folk och fä HB   Speedy Express
    ## 528   10775                    The Cracker Box   Speedy Express
    ## 529   10776                       Ernst Handel Federal Shipping
    ## 530   10777                Gourmet Lanchonetes   United Package
    ## 531   10778                 Berglunds snabbköp   Speedy Express
    ## 532   10779             Morgenstern Gesundkost   United Package
    ## 533   10780                  LILA-Supermercado   Speedy Express
    ## 534   10781                     Wartian Herkku Federal Shipping
    ## 535   10782         Cactus Comidas para llevar Federal Shipping
    ## 536   10783                      Hanari Carnes   United Package
    ## 537   10784       Magazzini Alimentari Riuniti Federal Shipping
    ## 538   10785               GROSELLA-Restaurante Federal Shipping
    ## 539   10786                      Queen Cozinha   Speedy Express
    ## 540   10787                   La maison d'Asie   Speedy Express
    ## 541   10788                         QUICK-Stop   United Package
    ## 542   10789                  Folies gourmandes   United Package
    ## 543   10790                Gourmet Lanchonetes   Speedy Express
    ## 544   10791                     Frankenversand   United Package
    ## 545   10792                     Wolski  Zajazd Federal Shipping
    ## 546   10793                    Around the Horn Federal Shipping
    ## 547   10794                        Que Delícia   Speedy Express
    ## 548   10795                       Ernst Handel   United Package
    ## 549   10796                   HILARIÓN-Abastos   Speedy Express
    ## 550   10797           Drachenblut Delikatessen   United Package
    ## 551   10798                     Island Trading   Speedy Express
    ## 552   10799                    Königlich Essen Federal Shipping
    ## 553   10800                 Seven Seas Imports Federal Shipping
    ## 554   10801          Bólido Comidas preparadas   United Package
    ## 555   10802                      Simons bistro   United Package
    ## 556   10803             Wellington Importadora   Speedy Express
    ## 557   10804                 Seven Seas Imports   United Package
    ## 558   10805                     The Big Cheese Federal Shipping
    ## 559   10806               Victuailles en stock   United Package
    ## 560   10807                     Franchi S.p.A.   Speedy Express
    ## 561   10808             Princesa Isabel Vinhos Federal Shipping
    ## 562   10809             Wellington Importadora   Speedy Express
    ## 563   10810      Laughing Bacchus Wine Cellars Federal Shipping
    ## 564   10811                   LINO-Delicateses   Speedy Express
    ## 565   10812                 Reggiani Caseifici   Speedy Express
    ## 566   10813                 Ricardo Adocicados   Speedy Express
    ## 567   10814               Victuailles en stock Federal Shipping
    ## 568   10815                 Save-a-lot Markets Federal Shipping
    ## 569   10816            Great Lakes Food Market   United Package
    ## 570   10817                    Königlich Essen   United Package
    ## 571   10818       Magazzini Alimentari Riuniti Federal Shipping
    ## 572   10819         Cactus Comidas para llevar Federal Shipping
    ## 573   10820         Rattlesnake Canyon Grocery   United Package
    ## 574   10821              Split Rail Beer & Ale   Speedy Express
    ## 575   10822  Trail's Head Gourmet Provisioners Federal Shipping
    ## 576   10823                  LILA-Supermercado   United Package
    ## 577   10824                     Folk och fä HB   Speedy Express
    ## 578   10825           Drachenblut Delikatessen   Speedy Express
    ## 579   10826               Blondel père et fils   Speedy Express
    ## 580   10827                           Bon app'   United Package
    ## 581   10828                      Rancho grande   Speedy Express
    ## 582   10829                     Island Trading   Speedy Express
    ## 583   10830             Tradição Hipermercados   United Package
    ## 584   10831                      Santé Gourmet   United Package
    ## 585   10832                   La maison d'Asie   United Package
    ## 586   10833                 Ottilies Käseladen   United Package
    ## 587   10834             Tradição Hipermercados Federal Shipping
    ## 588   10835                Alfreds Futterkiste Federal Shipping
    ## 589   10836                       Ernst Handel   Speedy Express
    ## 590   10837                 Berglunds snabbköp Federal Shipping
    ## 591   10838                   LINO-Delicateses Federal Shipping
    ## 592   10839             Tradição Hipermercados Federal Shipping
    ## 593   10840                   LINO-Delicateses   United Package
    ## 594   10841                   Suprêmes délices   United Package
    ## 595   10842                Tortuga Restaurante Federal Shipping
    ## 596   10843               Victuailles en stock   United Package
    ## 597   10844                   Piccolo und mehr   United Package
    ## 598   10845                         QUICK-Stop   Speedy Express
    ## 599   10846                   Suprêmes délices Federal Shipping
    ## 600   10847                 Save-a-lot Markets Federal Shipping
    ## 601   10848              Consolidated Holdings   United Package
    ## 602   10849                    Königlich Essen   United Package
    ## 603   10850               Victuailles en stock   Speedy Express
    ## 604   10851                 Ricardo Adocicados   Speedy Express
    ## 605   10852         Rattlesnake Canyon Grocery   Speedy Express
    ## 606   10853            Blauer See Delikatessen   United Package
    ## 607   10854                       Ernst Handel   United Package
    ## 608   10855             Old World Delicatessen   Speedy Express
    ## 609   10856            Antonio Moreno Taquería   United Package
    ## 610   10857                 Berglunds snabbköp   United Package
    ## 611   10858               La corne d'abondance   Speedy Express
    ## 612   10859                     Frankenversand   United Package
    ## 613   10860                France restauration Federal Shipping
    ## 614   10861               White Clover Markets   United Package
    ## 615   10862                Lehmanns Marktstand   United Package
    ## 616   10863                   HILARIÓN-Abastos   United Package
    ## 617   10864                    Around the Horn   United Package
    ## 618   10865                         QUICK-Stop   Speedy Express
    ## 619   10866                 Berglunds snabbköp   Speedy Express
    ## 620   10867           Lonesome Pine Restaurant   Speedy Express
    ## 621   10868                      Queen Cozinha   United Package
    ## 622   10869                 Seven Seas Imports   Speedy Express
    ## 623   10870                     Wolski  Zajazd Federal Shipping
    ## 624   10871                           Bon app'   United Package
    ## 625   10872                Godos Cocina Típica   United Package
    ## 626   10873                        Wilman Kala   Speedy Express
    ## 627   10874                Godos Cocina Típica   United Package
    ## 628   10875                 Berglunds snabbköp   United Package
    ## 629   10876                           Bon app' Federal Shipping
    ## 630   10877                 Ricardo Adocicados   Speedy Express
    ## 631   10878                         QUICK-Stop   Speedy Express
    ## 632   10879                        Wilman Kala Federal Shipping
    ## 633   10880                     Folk och fä HB   Speedy Express
    ## 634   10881         Cactus Comidas para llevar   Speedy Express
    ## 635   10882                 Save-a-lot Markets Federal Shipping
    ## 636   10883           Lonesome Pine Restaurant Federal Shipping
    ## 637   10884                  Let's Stop N Shop   United Package
    ## 638   10885                   Suprêmes délices Federal Shipping
    ## 639   10886                      Hanari Carnes   Speedy Express
    ## 640   10887             Galería del gastrónomo Federal Shipping
    ## 641   10888                Godos Cocina Típica   United Package
    ## 642   10889         Rattlesnake Canyon Grocery Federal Shipping
    ## 643   10890                    Du monde entier   Speedy Express
    ## 644   10891                Lehmanns Marktstand   United Package
    ## 645   10892                       Maison Dewey   United Package
    ## 646   10893                    Königlich Essen   United Package
    ## 647   10894                 Save-a-lot Markets   Speedy Express
    ## 648   10895                       Ernst Handel   Speedy Express
    ## 649   10896                       Maison Dewey Federal Shipping
    ## 650   10897       Hungry Owl All-Night Grocers   United Package
    ## 651   10898             Océano Atlántico Ltda.   United Package
    ## 652   10899                  LILA-Supermercado Federal Shipping
    ## 653   10900             Wellington Importadora   United Package
    ## 654   10901                   HILARIÓN-Abastos   Speedy Express
    ## 655   10902                     Folk och fä HB   Speedy Express
    ## 656   10903                      Hanari Carnes Federal Shipping
    ## 657   10904               White Clover Markets Federal Shipping
    ## 658   10905             Wellington Importadora   United Package
    ## 659   10906                     Wolski  Zajazd Federal Shipping
    ## 660   10907               Spécialités du monde Federal Shipping
    ## 661   10908                 Reggiani Caseifici   United Package
    ## 662   10909                      Santé Gourmet   United Package
    ## 663   10910                        Wilman Kala Federal Shipping
    ## 664   10911                Godos Cocina Típica   Speedy Express
    ## 665   10912       Hungry Owl All-Night Grocers   United Package
    ## 666   10913                      Queen Cozinha   Speedy Express
    ## 667   10914                      Queen Cozinha   Speedy Express
    ## 668   10915                Tortuga Restaurante   United Package
    ## 669   10916                      Rancho grande   United Package
    ## 670   10917                   Romero y tomillo   United Package
    ## 671   10918              Bottom-Dollar Markets Federal Shipping
    ## 672   10919                   LINO-Delicateses   United Package
    ## 673   10920                    Around the Horn   United Package
    ## 674   10921                       Vaffeljernet   Speedy Express
    ## 675   10922                      Hanari Carnes Federal Shipping
    ## 676   10923                   La maison d'Asie Federal Shipping
    ## 677   10924                 Berglunds snabbköp   United Package
    ## 678   10925                      Hanari Carnes   Speedy Express
    ## 679   10926 Ana Trujillo Emparedados y helados Federal Shipping
    ## 680   10927               La corne d'abondance   Speedy Express
    ## 681   10928             Galería del gastrónomo   Speedy Express
    ## 682   10929                     Frankenversand   Speedy Express
    ## 683   10930                   Suprêmes délices Federal Shipping
    ## 684   10931                 Richter Supermarkt   United Package
    ## 685   10932                           Bon app'   Speedy Express
    ## 686   10933                     Island Trading Federal Shipping
    ## 687   10934                Lehmanns Marktstand Federal Shipping
    ## 688   10935             Wellington Importadora Federal Shipping
    ## 689   10936            Great Lakes Food Market   United Package
    ## 690   10937         Cactus Comidas para llevar Federal Shipping
    ## 691   10938                         QUICK-Stop   United Package
    ## 692   10939       Magazzini Alimentari Riuniti   United Package
    ## 693   10940                           Bon app' Federal Shipping
    ## 694   10941                 Save-a-lot Markets   United Package
    ## 695   10942                 Reggiani Caseifici Federal Shipping
    ## 696   10943                      B's Beverages   United Package
    ## 697   10944              Bottom-Dollar Markets Federal Shipping
    ## 698   10945             Morgenstern Gesundkost   Speedy Express
    ## 699   10946                       Vaffeljernet   United Package
    ## 700   10947                      B's Beverages   United Package
    ## 701   10948                Godos Cocina Típica Federal Shipping
    ## 702   10949              Bottom-Dollar Markets Federal Shipping
    ## 703   10950       Magazzini Alimentari Riuniti   United Package
    ## 704   10951                 Richter Supermarkt   United Package
    ## 705   10952                Alfreds Futterkiste   Speedy Express
    ## 706   10953                    Around the Horn   United Package
    ## 707   10954                   LINO-Delicateses   Speedy Express
    ## 708   10955                     Folk och fä HB   United Package
    ## 709   10956            Blauer See Delikatessen   United Package
    ## 710   10957                   HILARIÓN-Abastos Federal Shipping
    ## 711   10958             Océano Atlántico Ltda.   United Package
    ## 712   10959                Gourmet Lanchonetes   United Package
    ## 713   10960                   HILARIÓN-Abastos   Speedy Express
    ## 714   10961                      Queen Cozinha   Speedy Express
    ## 715   10962                         QUICK-Stop   United Package
    ## 716   10963     Furia Bacalhau e Frutos do Mar Federal Shipping
    ## 717   10964               Spécialités du monde   United Package
    ## 718   10965             Old World Delicatessen Federal Shipping
    ## 719   10966                  Chop-suey Chinese   Speedy Express
    ## 720   10967                 Toms Spezialitäten   United Package
    ## 721   10968                       Ernst Handel Federal Shipping
    ## 722   10969                   Comércio Mineiro   United Package
    ## 723   10970          Bólido Comidas preparadas   Speedy Express
    ## 724   10971                France restauration   United Package
    ## 725   10972               La corne d'abondance   United Package
    ## 726   10973               La corne d'abondance   United Package
    ## 727   10974              Split Rail Beer & Ale Federal Shipping
    ## 728   10975              Bottom-Dollar Markets Federal Shipping
    ## 729   10976                   HILARIÓN-Abastos   Speedy Express
    ## 730   10977                     Folk och fä HB Federal Shipping
    ## 731   10978                       Maison Dewey   United Package
    ## 732   10979                       Ernst Handel   United Package
    ## 733   10980                     Folk och fä HB   Speedy Express
    ## 734   10981                      Hanari Carnes   United Package
    ## 735   10982              Bottom-Dollar Markets   Speedy Express
    ## 736   10983                 Save-a-lot Markets   United Package
    ## 737   10984                 Save-a-lot Markets Federal Shipping
    ## 738   10985       Hungry Owl All-Night Grocers   Speedy Express
    ## 739   10986             Océano Atlántico Ltda.   United Package
    ## 740   10987                 Eastern Connection   Speedy Express
    ## 741   10988         Rattlesnake Canyon Grocery   United Package
    ## 742   10989                        Que Delícia   Speedy Express
    ## 743   10990                       Ernst Handel Federal Shipping
    ## 744   10991                         QUICK-Stop   Speedy Express
    ## 745   10992                     The Big Cheese Federal Shipping
    ## 746   10993                     Folk och fä HB Federal Shipping
    ## 747   10994                       Vaffeljernet Federal Shipping
    ## 748   10995          Pericles Comidas clásicas Federal Shipping
    ## 749   10996                         QUICK-Stop   United Package
    ## 750   10997                  LILA-Supermercado   United Package
    ## 751   10998                     Wolski  Zajazd   United Package
    ## 752   10999                 Ottilies Käseladen   United Package
    ## 753   11000         Rattlesnake Canyon Grocery Federal Shipping
    ## 754   11001                     Folk och fä HB   United Package
    ## 755   11002                 Save-a-lot Markets   Speedy Express
    ## 756   11003                    The Cracker Box Federal Shipping
    ## 757   11004                       Maison Dewey   Speedy Express
    ## 758   11005                        Wilman Kala   Speedy Express
    ## 759   11006            Great Lakes Food Market   United Package
    ## 760   11007             Princesa Isabel Vinhos   United Package
    ## 761   11008                       Ernst Handel Federal Shipping
    ## 762   11009                Godos Cocina Típica   Speedy Express
    ## 763   11010                 Reggiani Caseifici   United Package
    ## 764   11011                Alfreds Futterkiste   Speedy Express
    ## 765   11012                     Frankenversand Federal Shipping
    ## 766   11013                   Romero y tomillo   Speedy Express
    ## 767   11014                   LINO-Delicateses Federal Shipping
    ## 768   11015                      Santé Gourmet   United Package
    ## 769   11016                    Around the Horn   United Package
    ## 770   11017                       Ernst Handel   United Package
    ## 771   11018           Lonesome Pine Restaurant   United Package
    ## 772   11019                      Rancho grande Federal Shipping
    ## 773   11020                 Ottilies Käseladen   United Package
    ## 774   11021                         QUICK-Stop   Speedy Express
    ## 775   11022                      Hanari Carnes   United Package
    ## 776   11023                      B's Beverages   United Package
    ## 777   11024                 Eastern Connection   Speedy Express
    ## 778   11025                     Wartian Herkku Federal Shipping
    ## 779   11026                     Franchi S.p.A.   Speedy Express
    ## 780   11027              Bottom-Dollar Markets   Speedy Express
    ## 781   11028                    Königlich Essen   Speedy Express
    ## 782   11029                  Chop-suey Chinese   Speedy Express
    ## 783   11030                 Save-a-lot Markets   United Package
    ## 784   11031                 Save-a-lot Markets   United Package
    ## 785   11032               White Clover Markets Federal Shipping
    ## 786   11033                 Richter Supermarkt Federal Shipping
    ## 787   11034             Old World Delicatessen   Speedy Express
    ## 788   11035                   Suprêmes délices   United Package
    ## 789   11036           Drachenblut Delikatessen Federal Shipping
    ## 790   11037                Godos Cocina Típica   Speedy Express
    ## 791   11038                   Suprêmes délices   United Package
    ## 792   11039                   LINO-Delicateses   United Package
    ## 793   11040            Great Lakes Food Market Federal Shipping
    ## 794   11041                  Chop-suey Chinese   United Package
    ## 795   11042                   Comércio Mineiro   Speedy Express
    ## 796   11043               Spécialités du monde   United Package
    ## 797   11044                     Wolski  Zajazd   Speedy Express
    ## 798   11045              Bottom-Dollar Markets   United Package
    ## 799   11046                  Die Wandernde Kuh   United Package
    ## 800   11047                 Eastern Connection Federal Shipping
    ## 801   11048              Bottom-Dollar Markets Federal Shipping
    ## 802   11049                Gourmet Lanchonetes   Speedy Express
    ## 803   11050                     Folk och fä HB   United Package
    ## 804   11051                   La maison d'Asie Federal Shipping
    ## 805   11052                      Hanari Carnes   Speedy Express
    ## 806   11053                   Piccolo und mehr   United Package
    ## 807   11054         Cactus Comidas para llevar   Speedy Express
    ## 808   11055                   HILARIÓN-Abastos   United Package
    ## 809   11056                 Eastern Connection   United Package
    ## 810   11057                        North/South Federal Shipping
    ## 811   11058            Blauer See Delikatessen Federal Shipping
    ## 812   11059                 Ricardo Adocicados   United Package
    ## 813   11060                     Franchi S.p.A.   United Package
    ## 814   11061            Great Lakes Food Market Federal Shipping
    ## 815   11062                 Reggiani Caseifici   United Package
    ## 816   11063       Hungry Owl All-Night Grocers   United Package
    ## 817   11064                 Save-a-lot Markets   Speedy Express
    ## 818   11065                  LILA-Supermercado   Speedy Express
    ## 819   11066               White Clover Markets   United Package
    ## 820   11067           Drachenblut Delikatessen   United Package
    ## 821   11068                      Queen Cozinha   United Package
    ## 822   11069                Tortuga Restaurante   United Package
    ## 823   11070                Lehmanns Marktstand   Speedy Express
    ## 824   11071                  LILA-Supermercado   Speedy Express
    ## 825   11072                       Ernst Handel   United Package
    ## 826   11073          Pericles Comidas clásicas   United Package
    ## 827   11074                      Simons bistro   United Package
    ## 828   11075                 Richter Supermarkt   United Package
    ## 829   11076                           Bon app'   United Package
    ## 830   11077         Rattlesnake Canyon Grocery   United Package

SQL statement selects all the different cities (only distinct values) from "Customers" and "Suppliers":
=======================================================================================================

UNION - automatically takes only distinct values, to include duplciates use DISTINCT ALL
========================================================================================

``` r
sqldf("SELECT City FROM Customers
       UNION
       SELECT City FROM Suppliers
       ORDER BY City")
```

    ##               City
    ## 1           Aachen
    ## 2      Albuquerque
    ## 3        Anchorage
    ## 4        Ann Arbor
    ## 5           Annecy
    ## 6        Barcelona
    ## 7     Barquisimeto
    ## 8             Bend
    ## 9          Bergamo
    ## 10          Berlin
    ## 11            Bern
    ## 12           Boise
    ## 13          Boston
    ## 14     Brandenburg
    ## 15       Bruxelles
    ## 16          Bräcke
    ## 17    Buenos Aires
    ## 18           Butte
    ## 19        Campinas
    ## 20         Caracas
    ## 21       Charleroi
    ## 22            Cork
    ## 23           Cowes
    ## 24       Cunewalde
    ## 25        Cuxhaven
    ## 26           Elgin
    ## 27          Eugene
    ## 28       Frankfurt
    ## 29  Frankfurt a.M.
    ## 30          Genève
    ## 31            Graz
    ## 32        Göteborg
    ## 33        Helsinki
    ## 34 I. de Margarita
    ## 35        Kirkland
    ## 36            Köln
    ## 37       København
    ## 38          Lander
    ## 39    Lappeenranta
    ## 40         Leipzig
    ## 41           Lille
    ## 42          Lisboa
    ## 43          London
    ## 44           Luleå
    ## 45          Lyngby
    ## 46            Lyon
    ## 47          Madrid
    ## 48      Manchester
    ## 49        Mannheim
    ## 50       Marseille
    ## 51       Melbourne
    ## 52        Montceau
    ## 53        Montréal
    ## 54     México D.F.
    ## 55         München
    ## 56         Münster
    ## 57          Nantes
    ## 58     New Orleans
    ## 59           Osaka
    ## 60            Oulu
    ## 61          Oviedo
    ## 62           Paris
    ## 63        Portland
    ## 64         Ravenna
    ## 65   Reggio Emilia
    ## 66           Reims
    ## 67         Resende
    ## 68  Rio de Janeiro
    ## 69         Salerno
    ## 70        Salzburg
    ## 71   San Cristóbal
    ## 72   San Francisco
    ## 73        Sandvika
    ## 74         Seattle
    ## 75         Sevilla
    ## 76       Singapore
    ## 77         Stavern
    ## 78   Ste-Hyacinthe
    ## 79       Stockholm
    ## 80      Strasbourg
    ## 81       Stuttgart
    ## 82          Sydney
    ## 83       São Paulo
    ## 84           Tokyo
    ## 85          Torino
    ## 86        Toulouse
    ## 87       Tsawassen
    ## 88       Vancouver
    ## 89      Versailles
    ## 90     Walla Walla
    ## 91        Warszawa
    ## 92         Zaandam
    ## 93           Århus

``` r
sqldf("SELECT City FROM Customers
       UNION ALL
       SELECT City FROM Suppliers
       ORDER BY City")
```

    ##                City
    ## 1            Aachen
    ## 2       Albuquerque
    ## 3         Anchorage
    ## 4         Ann Arbor
    ## 5            Annecy
    ## 6         Barcelona
    ## 7      Barquisimeto
    ## 8              Bend
    ## 9           Bergamo
    ## 10           Berlin
    ## 11           Berlin
    ## 12             Bern
    ## 13            Boise
    ## 14           Boston
    ## 15      Brandenburg
    ## 16        Bruxelles
    ## 17           Bräcke
    ## 18     Buenos Aires
    ## 19     Buenos Aires
    ## 20     Buenos Aires
    ## 21            Butte
    ## 22         Campinas
    ## 23          Caracas
    ## 24        Charleroi
    ## 25             Cork
    ## 26            Cowes
    ## 27        Cunewalde
    ## 28         Cuxhaven
    ## 29            Elgin
    ## 30           Eugene
    ## 31        Frankfurt
    ## 32   Frankfurt a.M.
    ## 33           Genève
    ## 34             Graz
    ## 35         Göteborg
    ## 36         Helsinki
    ## 37  I. de Margarita
    ## 38         Kirkland
    ## 39             Köln
    ## 40        København
    ## 41           Lander
    ## 42     Lappeenranta
    ## 43          Leipzig
    ## 44            Lille
    ## 45           Lisboa
    ## 46           Lisboa
    ## 47           London
    ## 48           London
    ## 49           London
    ## 50           London
    ## 51           London
    ## 52           London
    ## 53           London
    ## 54            Luleå
    ## 55           Lyngby
    ## 56             Lyon
    ## 57           Madrid
    ## 58           Madrid
    ## 59           Madrid
    ## 60       Manchester
    ## 61         Mannheim
    ## 62        Marseille
    ## 63        Melbourne
    ## 64         Montceau
    ## 65         Montréal
    ## 66         Montréal
    ## 67      México D.F.
    ## 68      México D.F.
    ## 69      México D.F.
    ## 70      México D.F.
    ## 71      México D.F.
    ## 72          München
    ## 73          Münster
    ## 74           Nantes
    ## 75           Nantes
    ## 76      New Orleans
    ## 77            Osaka
    ## 78             Oulu
    ## 79           Oviedo
    ## 80            Paris
    ## 81            Paris
    ## 82            Paris
    ## 83         Portland
    ## 84         Portland
    ## 85          Ravenna
    ## 86    Reggio Emilia
    ## 87            Reims
    ## 88          Resende
    ## 89   Rio de Janeiro
    ## 90   Rio de Janeiro
    ## 91   Rio de Janeiro
    ## 92          Salerno
    ## 93         Salzburg
    ## 94    San Cristóbal
    ## 95    San Francisco
    ## 96         Sandvika
    ## 97          Seattle
    ## 98          Sevilla
    ## 99        Singapore
    ## 100         Stavern
    ## 101   Ste-Hyacinthe
    ## 102       Stockholm
    ## 103      Strasbourg
    ## 104       Stuttgart
    ## 105          Sydney
    ## 106       São Paulo
    ## 107       São Paulo
    ## 108       São Paulo
    ## 109       São Paulo
    ## 110       São Paulo
    ## 111           Tokyo
    ## 112          Torino
    ## 113        Toulouse
    ## 114       Tsawassen
    ## 115       Vancouver
    ## 116      Versailles
    ## 117     Walla Walla
    ## 118        Warszawa
    ## 119         Zaandam
    ## 120           Århus

SQL statement lists the number of customers in each country
===========================================================

``` r
sqldf("SELECT COUNT(CustomerID), Country
       FROM Customers
       GROUP BY Country")
```

    ##    COUNT(CustomerID)     Country
    ## 1                  3   Argentina
    ## 2                  2     Austria
    ## 3                  2     Belgium
    ## 4                  9      Brazil
    ## 5                  3      Canada
    ## 6                  2     Denmark
    ## 7                  2     Finland
    ## 8                 11      France
    ## 9                 11     Germany
    ## 10                 1     Ireland
    ## 11                 3       Italy
    ## 12                 5      Mexico
    ## 13                 1      Norway
    ## 14                 1      Poland
    ## 15                 2    Portugal
    ## 16                 5       Spain
    ## 17                 2      Sweden
    ## 18                 2 Switzerland
    ## 19                 7          UK
    ## 20                13         USA
    ## 21                 4   Venezuela

SQL statement lists the number of customers in each country, sorted high to low
===============================================================================

``` r
sqldf("SELECT COUNT(CustomerID) , Country
      FROM Customers
      GROUP BY Country
      ORDER BY COUNT(CUstomerID) DESC;")
```

    ##    COUNT(CustomerID)     Country
    ## 1                 13         USA
    ## 2                 11      France
    ## 3                 11     Germany
    ## 4                  9      Brazil
    ## 5                  7          UK
    ## 6                  5      Mexico
    ## 7                  5       Spain
    ## 8                  4   Venezuela
    ## 9                  3   Argentina
    ## 10                 3      Canada
    ## 11                 3       Italy
    ## 12                 2     Austria
    ## 13                 2     Belgium
    ## 14                 2     Denmark
    ## 15                 2     Finland
    ## 16                 2    Portugal
    ## 17                 2      Sweden
    ## 18                 2 Switzerland
    ## 19                 1     Ireland
    ## 20                 1      Norway
    ## 21                 1      Poland

HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.
====================================================================================================

SQL statement lists the number of customers in each country. Only include countries with more than 5 customers
==============================================================================================================

``` r
sqldf("SELECT COUNT(CustomerID), Country
      FROM Customers
      GROUP BY Country
      HAVING COUNT(CustomerID) > 5 
      ORDER BY COUNT(CustomerID);")
```

    ##   COUNT(CustomerID) Country
    ## 1                 7      UK
    ## 2                 9  Brazil
    ## 3                11  France
    ## 4                11 Germany
    ## 5                13     USA

EXISTS operator is used to test for the existence of any record in a subquery.
==============================================================================

SQL statement returns TRUE and lists the suppliers with a product price less than 20
====================================================================================

``` r
sqldf("SELECT DISTINCT S.CompanyName
       FROM Suppliers AS S
       INNER JOIN Product AS P
       ON S.SupplierID =  P. SupplierID
       WHERE P.UnitPrice < 20;")
```

    ##                          CompanyName
    ## 1                     Exotic Liquids
    ## 2                           Mayumi's
    ## 3                      Pavlova, Ltd.
    ## 4           Specialty Biscuits, Ltd.
    ## 5                   PB Knäckebröd AB
    ## 6          Refrescos Americanas LTDA
    ## 7        Heli Süßwaren GmbH & Co. KG
    ## 8            Formaggi Fortini s.r.l.
    ## 9                    Norske Meierier
    ## 10                 Bigfoot Breweries
    ## 11                 Svensk Sjöföda AB
    ## 12        Aux joyeux ecclésiastiques
    ## 13       New England Seafood Cannery
    ## 14                      Leka Trading
    ## 15                        Lyngbysild
    ## 16               Zaanse Snoepfabriek
    ## 17                         Karkki Oy
    ## 18                       G'day, Mate
    ## 19                         Ma Maison
    ## 20              Pasta Buttini s.r.l.
    ## 21                Escargots Nouveaux
    ## 22        New Orleans Cajun Delights
    ## 23                     Tokyo Traders
    ## 24 Plutzer Lebensmittelgroßmärkte AG

SQL statement returns TRUE and lists the productnames if it finds
=================================================================

ANY records in the OrderDetails table that quantity = 10:
=========================================================

``` r
sqldf("SELECT  P.ProductName
      FROM Product P
      INNER JOIN Orders_Details
      USING(ProductId)
      WHERE Quantity = 10
      GROUP BY P.ProductName;")
```

    ##                         ProductName
    ## 1                      Alice Mutton
    ## 2                  Boston Crab Meat
    ## 3                 Camembert Pierrot
    ## 4                  Carnarvon Tigers
    ## 5                              Chai
    ## 6                             Chang
    ## 7                  Chartreuse verte
    ## 8      Chef Anton's Cajun Seasoning
    ## 9                     Côte de Blaye
    ## 10                         Filo Mix
    ## 11                          Geitost
    ## 12                     Genen Shouyu
    ## 13           Gnocchi di nonna Alice
    ## 14                Gorgonzola Telino
    ## 15                       Gravad lax
    ## 16               Guaraná Fantástica
    ## 17                 Gudbrandsdalsost
    ## 18                     Gula Malacca
    ## 19              Gumbär Gummibärchen
    ## 20                            Ikura
    ## 21                      Ipoh Coffee
    ## 22  Jack's New England Clam Chowder
    ## 23                            Konbu
    ## 24                     Lakkalikööri
    ## 25 Louisiana Fiery Hot Pepper Sauce
    ## 26        Louisiana Hot Spiced Okra
    ## 27            Manjimup Dried Apples
    ## 28               Mascarpone Fabioli
    ## 29                         Maxilaku
    ## 30           Mozzarella di Giovanni
    ## 31            Nord-Ost Matjeshering
    ## 32       Northwoods Cranberry Sauce
    ## 33          NuNuCa Nuß-Nougat-Creme
    ## 34  Original Frankfurter grüne Soße
    ## 35                          Pavlova
    ## 36                    Perth Pasties
    ## 37                     Pâté chinois
    ## 38                   Queso Cabrales
    ## 39             Raclette Courdavault
    ## 40                   Ravioli Angelo
    ## 41             Rhönbräu Klosterbier
    ## 42                       Röd Kaviar
    ## 43                Rössle Sauerkraut
    ## 44                    Sasquatch Ale
    ## 45               Schoggi Schokolade
    ## 46              Scottish Longbreads
    ## 47    Singaporean Hokkien Fried Mee
    ## 48              Sir Rodney's Scones
    ## 49                   Sirop d'érable
    ## 50                        Spegesild
    ## 51                   Steeleye Stout
    ## 52                   Tarte au sucre
    ## 53       Teatime Chocolate Biscuits
    ## 54          Thüringer Rostbratwurst
    ## 55                             Tofu
    ## 56                        Tourtière
    ## 57                         Tunnbröd
    ## 58  Uncle Bob's Organic Dried Pears
    ## 59                     Vegie-spread
    ## 60                    Zaanse koeken

SQL statement returns TRUE and lists the productnames if
========================================================

ALL the records in the OrderDetails table has quantity = 10:
============================================================

``` r
sqldf("SELECT  P.ProductName
      FROM Product P
      INNER JOIN Orders_Details
      USING(ProductId)
      WHERE Quantity > 99
      GROUP BY P.ProductName;")
```

    ##                        ProductName
    ## 1                     Alice Mutton
    ## 2                Camembert Pierrot
    ## 3                            Chang
    ## 4                 Chartreuse verte
    ## 5               Guaraná Fantástica
    ## 6                     Gula Malacca
    ## 7                            Ikura
    ## 8  Jack's New England Clam Chowder
    ## 9            Manjimup Dried Apples
    ## 10                   Perth Pasties
    ## 11                    Pâté chinois
    ## 12       Queso Manchego La Pastora
    ## 13            Raclette Courdavault
    ## 14            Rhönbräu Klosterbier
    ## 15                     Røgede sild
    ## 16              Schoggi Schokolade
    ## 17   Singaporean Hokkien Fried Mee
    ## 18                  Sirop d'érable
    ## 19                  Steeleye Stout
    ## 20       Wimmers gute Semmelknödel
