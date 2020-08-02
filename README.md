# Covid-19

This research aimes to answer the question how developed and developing countries differ in confirmed, death and recovery rates of the Covid-19 pandemic. 
For this, data was aquired from the Johns Hopkins University Center for Systems Science and Engineering (CSSE) https://github.com/datasets/covid-19 (for the documentation of Corona cases worldwide) and the World Bank website https://datahelpdesk.worldbank.org/knowledgebase/articles/906519 (for acquiring a list of developed and developing countries).

The dataset excludes the US cases, because of the high number of cases which would dominate the analysis. And thus, not give an overall view about high income countries.

The "By Income" tab of the original datset of the World Bank (https://github.com/Quendie/Covid-19/blob/master/200801_originaldata_worldbank.xls) was used and Low income ($1,035 or less), Lower middle income ($1,036  to $4,045) and Upper middle income ($4,046 to $12,535) countries were defined as developing countries. The High income ($12,536 or more) were defined as developed countries.
According to different country names in the two datasets, names were changed toward the names used in the CSSE dataset. A list of changed names is listed below:


Congo, Dem. Rep.          -> Congo (Kinshasa)
Congo, Rep.               -> Congo (Brazzaville)
Côte d'Ivoire             -> Cote d'Ivoire
Egypt, Arab Rep.          -> Egypt
Gambia, The               -> Gambia
Iran, Islamic Rep.        -> Iran
Kyrgyz Republic           -> Kyrgyzstan
Lao PDR                   -> Laos
Myanmar                   -> Burma
Russian Federation        -> Russia
São Tomé and Principe     -> Sao Tome and Principe
St. Lucia                  -> Saint Lucia
St. Vincent and the Grenadines -> Saint Vincent and the Grenadines
Syrian Arab Republic      -> Syria
Venezuela, RB             -> Venezuela
Yemen, Rep.               -> Yemen


A new file was created with the corrected country names (https://github.com/Quendie/Covid-19/blob/master/developing_countries.csv).




