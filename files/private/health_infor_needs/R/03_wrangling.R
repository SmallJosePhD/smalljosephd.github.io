################################################################################
#
#' Re-Evaluating Health Information Needs in Africa during COVID-19
#' 
###############################################################################
# DATA WRANGLING/CLEANING
#
###############################################################################
#First thing first:
#Import tweets

twitter_data <- readRDS("Data/coTreat_tweets.rds")

###############################################################################
#
#DATA WRANGLING OF NIGERIAN TWEETS
#
###############################################################################
#
#Important information:
#This Procedure involves Five stages:
#First - Extraction of country-specific tweets from the merged/binded dataframe
#Second - Filtering/cleaning of irrelevant patterns in the tweet to uncover the suggested remedies
#Third - Merging of similar remedies
#Fourth - Reducing the length of the top 30 remedies suggested to make plotting easy
#FIFTH - Generating the specific remedies
#
###############################################################################

#STAGE ONE: Extract tweets from Nigeria from the binded tweets' dataframe
cureNG <- twitter_data %>%
  filter(geo_locat == "Nigeria")

#####################################

#STAGE TWO: CLEANING THE TWEETS
#This line of codes first selects the column holding the tweets, then a new 

#dataframe (tibble)  with reference line is created to hold the information
#Next, a column name 'Remedies' is created to hold the alleged remedies
#suggested.
#Afterwards, we replace punctuation marks, digits, stop words (is, are they, 
#what etc), and other irrelevant words and patterns with NA, which is then #filtered out.
#The output of this line codes are stored in a dataframe named "cureNG_update"
#Note that we used the count function to sort the remedies



cureNG_upt <- cureNG %>%
  select(text) %>%
  tibble(line = 1:nrow(cureNG), Tweet = text) %>%
  unnest_tokens(Remedies, text)%>%
  mutate(Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "[[:punct:]]")), NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "[[:digit:]]+[[:digit:]]+") |
                                    str_detect(Remedies, pattern = "(.)\\1{3,}") |
                                    str_detect(Remedies, pattern = "\\b(.)\\b")
                            ),
                            NA),
         Remedies = replace(Remedies,
                            which(Remedies %in% stop_words$word), NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "https|asap|spectatorindex|treat|people|nigeria|patients|world|corona|health|ncdcgov|medical|hospital|government|home|country|doctors|pendemic|stay|test|positive|lagos|patent|remedy|tested|china|news|real|disease|president|infected|death|symptoms|safe|countries|testing|care|free|call|centre|stop|hope|day|days|doctor|spread|abroad|ncdc|called|scientists|lockdonw|confirmed|discharged|govt|protect|fight|prevent|hands|person|lives|finally|kyari|mbuhari|politicians|buhari|governor|workers|guys|private|receiving|approved|center|start|died|solution|abba|abuja|system|minister|save|check|waiting|discovered|life|listen|travel|wait|breaking|water|citizens|taking|finding|follow|mask|public|continue|heard|negative|poor|question") |
                                    str_detect(Remedies, pattern = "cure|coronavirus|treatment|virus|treating|found|dey|isolation|time|lockdown|effective|social|wey|sick|chinese|claim|deadly|hand|video|federal|imagine|read|avoid|clinical|distancing|kill|science|team|bring|recovered|support|family|staff|suddenly|dail|infection|recovery|remember|community|dear|leave|thinking|told|true|coming|discover|divine|jidesanwoolu|victims|wash|amazing|body|hear|kano|leaders|measures|month|morning|protocols|blood|claims|feel|abeg|develop|global|rate|receive|recover|risk|scientist|sickness|takeresponsibility|talk|access|buy|chief|means|provide|trials|week")),
                            NA),  
         Remedies = replace(Remedies, 
                            which(str_detect(Remedies, pattern = "dial|instantly|announce|bless|fear|information|matter|medication|researchers|ventilators|based|issue|live|lost|period|recorded|respiratory|bed|black|chance|economy|happen|heal|illness|join|message|power|prof|reason|telling|total|truth|woman|facility|head|isolate|mobile|punch|prophesy|released|understand|channelstv|happy|link|mind|quarantine|successful|tomorrow|affected|america|april|bad|control|created|dead|emergency|fast|friends|happened|house|human|normal|school|share|shut|change|conditions|discharge|dying|fct|frontline|hard|humanity|knowledge|sense|update|visit|anti|atiku|beds|cnn|confused|fake|fine|geniune|guy|increase|proven|reported|scientific|shit|university|watch|1st|announced|approval|email|enugu|foreign|hunger|left|moment|panic|post|quick|regular|result|russia|study|undergoing|ventilator|amen|americans|build|cough|efforts|equipment|experts|grant|instructions|kindly|media|ministry|nonsense|opportunity|proper|report|respect|results|rich|sentence|single|top|whatsapp|white|wrong|accept|ameen|breakthrough|business|busy|caused|rest|trial|tweet|close|cross|data|dubai|effects|facilities|giving|learn|mass|miracle")),
                            NA), 
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "move|observe|opinion|outbreak|pain|play|poverty|process|prove|release|remain|response|seek|situation|south|special|specific|strong|strongly|strongest|stronger|trips|trust|viral|war|wuhan|adhere|almighty|approves|attention|baby|common|create|effort|enter|football|hair|july|kits|lead|lsmoh|mercy|mild|mouth|oyo|reduce|remains|scam|send|services|shame|sign|calm|citizen|city|class|effect|davido|expected|failed|form|funds|funny|guess|living|low|male|market|note|official|pass|peace|produce|specialist|stella|suffering|suppose|twitter|usa|vital|wake|west|afraid|allowance|aware|awareness|begin|capacity|chairman|dis|efficacy|finish|flown|friend|joke|land|lassa|late|level|loved|milk|option|politics|potential|ravaging|press|providing|revealed|rise|sector|sell|severe|united|wear|wearing|women|worse|agree|answer|approach|bashirahmaad|biology|catch|condition|easily|eat|evil")),
                            NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "epidalert|experience|force|hepatitis|history|huge|including|infectious|knowing|line|list|loss|mail|major|multiple|notwithstanding|paid|physical|political|propare|refused|responding|shown|simple|simply|strike|tired|tireless|trending|wetin|worker|wow|agency|authorities|awon|ban|beg|blame|cheap|click|clinic|commissioner|committee|crazy|critical|earth|english|fall|fly|france|game|germany|ground|hold|immunity|italy|lock|makes|mention|office|ongoing|oxygen|permanent|plasma|pmb|politician|population|position|ppe|putting|ramadan|recommend|required|sanitize|search|stage|takes|verified|words|advice|amount|assume|bank|bigger|caution|cheaper|collect|company|conspiracy|duties|elite|event|expect|father|focus|forget|fund|hiding|highly|humble|leaving|light|nice|offer|police|popular|precautions|price|protocol|quality|raymond|responsibility|rufai|seyi|sleep|speech|statement|status|straight|stuff|stupid|teaching|toluogunlesi|wave|wicked|wit|yoruba|adminstration|afford|alleged|asymptomatic|carry|cold|combat|confirm|cut|dangerous|endsars|enjoy|equipped|existing|expensive|folks|gaint|increasing|infect|jobs|june|lack|league|lmao|mad|myeloma|needful|night|nose|phase|phone|potent|prime|proud|resume|sanwo|song|speaking|spent|step|suggest|tech|throat|transmission|useless|victim|volunteer|wast|5g|9ja|adding|advance|airport|alert|annoying|anymore|arrived|article|assist|attack|average|born|brain|capable|charge|child|communities|concerns|crisis")),
                            NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "built|gaint|gainlikes|gainviews|capital|date|director|double|energy|equally|existence|forefront|forever|gloves|haram|hustle|ignorance|italian|job|king|kudos|launched|meeting|mother|mum|noise|ogun|past|pick|producing|race|recently|record|regrets|rising|rubbish|scarce|solve|spend|spoke|standard|strictly|taste|tears|terms|voice|wealth|wike|wipe|worst|yeah|2nd|advised|ailments|asaba|beauty|biggest|catholic|central|challenge|complications|conduct|conference|confusing|congratulations|corruption|difference|difficult|direct|doubt|economic|education|ekiti|environment|experiment|exposed|eyes|fail|fan|fire|foster|fresh|gates|globe|growing|gullible|hazard|hushpuppi|ignorant|ikpeazu|impossible|india|individuals|institutions|intensive|invent|itching|justice|letter|microbiologist|jhpiego|movie|notice|obvious|path|photos|piece|plague|plan|planet|prepared|previous|trump")), 
                            NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "million|students|wonderful|abia|presidency|underlying|book|crowded|deceased|delta|details|hours|picture|account|deal|index|bill|drop|european|survive|survivors|billions|decided|dude|evidence|sharing|survival|campaign|declared|figures|giant|london|keadrive|laboratory|labs|residents|success|urgent|wife|boost|cdcgov|court|curfew|deputy|deserve|destroy|detect|door|future|helping|idris|importing|include|main|makinde|mallam|muslims|nurse|proof|resources|samples|security|source|supply|valiantnig|wahala|wondering|assured|billions|burial|choos|conclude|curb|curing|current|decide|episode|hell|helps|hotels|hundreds|identified|identify|maintain|march|mates|organisation|organization|production|promised|pursue|responsible|role|round|dreoehanire|ensure|address|idea|territory|iyanya|zjnb9rp0cx|zlhrdiehrn|zlmueuebtk|zlxqyysefa|zlzem6xl8o|zmlwzveklu")),
                            NA),
         Remedies = replace(Remedies, 
                            which(str_detect(Remedies, pattern = "international|nafdac|contact|kaduna|national|cost|manage|nation|management|dies|naija|brought|gonna|returned|ordinary|inside|contracted|donated|managing|action|active|brother|donald|lies|alternative|contracted|drolufunmilayo|practice|practitioners|bcos|epidemic|names|suplies|yaba|administration|broke|costs|earlier|europe|final|naira|studies|village|acting|activities|alot|contacts|demand|donate|families|named|nature|maurice|senegal|running|return|encourage|pregnancy|rajoelina|afternoon|anambra|benefit|covidngr|david|dedicated|ehanire|paying|reddington|rules|suspected|symptomatic|theory|trained|trash|union|universities|urge|usual|virologists|wallahi|belief|believed|secretly|touch|accredited|additional|adequate|adopt|affects|africacdc|allocation|animolenikun|attend|audio|authorization|basic|bauchi|bello|boredom|boss|budget|camp|carried|carrier|carriers|causing|cemetery|certified|chemistry|closure|collaboration|comfort|comments|companies|complete|concern|constituency|content|continent|correct|cover|covered|sample|wisdom|animals|crucial|dabiodunmfr|dangote|darkness|diagnosis|drobafemihamzat|dumb|emmanuel|endorses|enlargement|entire|essential|expand|expose|figure|forgive|french|ghana|girl|girls|google|guide|guinea|gwagwalada|hazmat|heaven|helped|honest|hoping|impact|importation|inclusive|indigenous|innovative|inspected|instagram|insurance|intelligence|intermittent|involved|joy|katsina|kebbi|korea|launches|lfgz1dp5np|limited|mark|master|meant|measure|medicate|mental|magic|minutes|missing|monitor|north|injecting|inject|dry|expert|degree|explain|graduates|zamfara|zamfara|zamfarapheoc|zamfarayligg|zeromalaria|triaging|toilet|theonlydemigod|thankgod|teargasonnrg|teaches|tamsjazz|staging|sprayers|spoilt|spoil|spoiling|soil|singing|shivers|shivering|sfhgfmalariapr1|sensitivity|sentivity|sabotaging|riging|ridaherbalbitters|reginadaniels|plugin|original|originated|odunadekolade|odenigbowine|nafamostat|musician|mamalawo|magodo|lovers|longetivity|localize|locality|letuspray|layconxaccolades|kolakolagbo|ivermectin4uk|ivermectin4sa|invites|invite|donjazzy|engineer|ultimateloveng|Cellgevity|changing|clime|debsextra|encouraging|engaging|engineering|hypocrisy|levity|lovely|yourfavouritesugardaddy|loves|packaging|steady|stealing|teacher|a1dx7npgod|abdallahfatymer|alindigbo|allover|ariyafoodsng")), 
                            NA)
  ) %>%
  filter(!Remedies %in% c('od', 'ba','amp','pls','dr', 'uk', 'ur', 'lab', 'lol', 'de', 'oo', 'ooo', 'abi', 'cc', 'gov', 'ife', 'ppl', 'sef', 'sad', 'sha', 'ni', 'wa', 'el', 'rt', 'ma', 'las', 've', 'ma', 'olu','gov','ago',  'abi', 'ill',   'gt',  'don', 'dont','cov',  'cos','due', 'run', 'jib','tb','coro','dan','tv','bit','bet','age','rip','son','rn','oga','omo','sit', 'virus', 'fg', 'ya', 'dem', 'die', 'covid', 'pay', 'lot', 'fda', 'till', 'sir', 'key', 'bro', 'lie', 'imo', 'act', 'hit', 'dat','fit','na','led','set', 'boy','dm','abu','wan','law', 'air','av','atm', 'una', 'oya', 'icu', 'nah', 'rice', 'flu','sabi', 'sake','sars','secretly','serve','sey','shey','smell', 'speak','stable','stories','suffer','suit','flu','tab','oni','sars','wat','win','won','wont','worth','aka','al','apc','biko','boko','crew','cast','ear','andry','cuz','den','dg','ease','edo','exist','feb','feed','fpn','frame','lollylarry1','obey','ononye','hey','hug','idu','invest','jack','kai','kit','ll','lied','lose','loud','lungs','mark','meet','miss','nddc','ntagmn','vaccine','vaccines','drug', 'ooni','pandemic','patient','africa','african','medicine','medicines','drugs','africans','immune','mix','drink','fever','organics','ebola','cancer','church','mosque','iwu','leaf','diabetes','religion','religious','aids','therapy','typhoid','cash','money','natural','hot','baba','mosques','mohammed','sacrifice','churches','ingredients', 'ewe','palm','amin',"prophet","vanilla", "ancestors", "bishop", "catarrh","optimal","osun","overcome","owerri", "page","pending","petition","pharmaceutical","pharmacist","pharmacy","physician","potus","pple","prefer","prepare","pres","product","promising","prompt","pushing","radio","refuse","refusing","relevant","relief","reveal","reveals","road","ronaldo","rule","scary","secretary","senator","sezekwesili","shouting","similar","sister","society","sort","space","spare","sports","standing","stated","stats","story",'bragging',"sudden","sun","supervision","surely","sweet","tag","task","temiokomi","term","toll","tourism","tuberculosis","type","unable","uncle","unfortunate", "mixture", 'shepeleba','tualebaba1','amoeba','debate','debatable','thebabatundee','malaria', 'cocacola', 'cocacolaco', 'amalar',"ayanfeofgod", "ayplhiv", "azithro", "azt", "bitterness","bleaching","brodashagging","cannabisindustry","chivegps","christmas","compliment","damaging","delordemperor","dicharging","dromoragbon","drzobo","ejigbo","ekpenyongodusu","ekwendigbo","emerging","engineered","engineers","faithoyedepo","foodandgeneinitiation","foodie","foodnetwork","ganjafarmer","hinging","hive","hugging","hypocrite", "hypothesis","igboko"               ,"imaginative","imagining","inevitable","kachallah","mashaallah","rigging","sexy","subhanallah","suppliments","taqabalallahu","urging"))%>%
  filter(!is.na(Remedies))

###########################################

#STAGE THREE: Merging similar remedies
#The following line of codes merge similar remedies together
#The ensuring result is saved in a new column "Merged_Remedies" in the "cureNG_upt"
#dataframe
#We used the sort function to create a separate dataframe to check for similar
#remedies in the "Remedies" column.

cureNG_upt <- cureNG_upt %>%
  mutate(Merged_Remedies = case_when(str_detect(Remedies, "viagra|ultraviolet|garri|hygiene|salt|beans|vanilla|soap|sugar|kerosene|seed|Nigella|tea|kunu|ziza|zobo|alabukun|alábùkún|cassava") ~ "Others (Hygiene, vanilla, salt, soap, viagra, ultraviolet light, garri, sugar, kerosene, Black Seed, Tea, zobo, kunu, cold ziza, Nigella sativa & alábùkún)",
                                     str_detect(Remedies, "syrup|organics|madagascar|organic|cvo") ~ "Madagascar COVID-19 Organic syrup",
                                     str_detect(Remedies,"artemisia|egbin|tazargade|mkpatat|baaba") ~ "Artemisia (Ewe egbin/tazargade/mkpatat/baaba)",
                                     str_detect(Remedies,"cannabis|igbo|ganja|marijuana|cocaine|weed|tobacco|tobbaco|utaba|colorado") ~ "Cannabis (cocaine, weed, igbo, ganja, colorado, marijuana, and utaba/tobacco)",
                                     str_detect(Remedies, "cola|kola|bitter|tea|garlic|onions|onion|pawpaw|garlic|tumeric|alligator|sheer") ~ "Bitter cola, Onions, Garlic, Pawpaw leaf, Garlic, sheer butter, and alligator pepper",
                                     str_detect(Remedies, "music|jazz|smile|love|food|vibes") ~ "Music/Jazz/smile/love/food",
                                     str_detect(Remedies, "hydrochloroquine|chloroquine|chloroquin|choloroquine|azithromycin|vita|hydroxy|hydro|phosphate|zithromax|zinc|bleach|hypo|dettol|azythromicin|azt|azithro|vit|hcq|chlorine|cellgevity") ~ "Hydrochloroquine, Azithromycin, Zinc, Bleach, Zithromax, Vitamin C, Hypo and Dettol",
                                     str_detect(Remedies, "fruit|mango|pineapple|honey|carrot|pawpaw|ginger|orange") ~ "Fruit mixture (pineapple, honey, carrort, orange, and ginger)",
                                     str_detect(Remedies, "herbal|herb|local|agbo|traditional|trado|traditional|jedi|agunmun|dongonyaro|dogoyaro|dongoyaro|neem|ewúro|vernonia|lime|cashew|ewedu|eyin|gargaja") ~ "Traditional/herbal solution (dogonyara, neem tree/leaf, cashew tree, and Ewúro (Vernonia amygdalina/bitter leaf))",
                                     str_detect(Remedies, "dexamethasone|nafamostat|ivermectin|mectizan|avigan|favipiraviv|favipiravir|sulfur") ~ "Dexamethasone, Nafamostat, Ivermectin (Mectizan), and Avigan (Favipiraviv)",
                                     str_detect(Remedies, "mefloquine") ~ "Anti-malaria medication",
                                     str_detect(Remedies, "hiv|remdesivir|ritonavir|lopinavir|oseltamivir|chlorphenamine|remdecivir|remdesvir|retonovir") ~ "Ebola/HIV/Cancer Medication",
                                     str_detect(Remedies, pattern = "god|allah|jesus|prayer|pray|lord|christ|faith|native|babalawo|spiritual|babalawos|zam|Jordan|holy|baqrah|baqarah") ~ "Spirituality (God, Jesus, Allah, Prayer and native/witch doctors)",
                                     str_detect(Remedies, pattern = "alcohol|ogogoro|beer|gin|palmwine|alomo|champagne|shisha|vodka|ashanti") ~ "Alcohol",
                                     str_detect(Remedies, pattern = "anointing|oil") ~ "Palm oil and anointing oil",
                                     str_detect(Remedies, pattern = "sex|breast|sperm|doggy") ~ "Sex, sperm and breast milk",
                                     str_detect(Remedies, pattern = "amala|eba|semovita") ~ "Hot Amala/Eba/Semo",
                                     TRUE ~ Remedies))

##########################################################################
#Hint:
#Use the following code chunk to create a dataframe to sort the remedies column
#Remove "#" before sort and count function.
#sort <- cureNG_upt %>%
#count(Merged_Remedies, sort = T)
#
##########################################################################


#STAGE FOUR: REWORDING OF THE REMEDIES IDENTIFIED 
#Prior to the visualisation of the top 30 remedies, we try to reduce the length 
#of the wordings of some of the merged remedies

cureNG_upt <- cureNG_upt %>%
  mutate(RRemedies = case_when(Merged_Remedies == "Spirituality (God, Jesus, Allah, Prayer and native/witch doctors)" ~ "Spirituality",
                               Merged_Remedies == "Traditional/herbal solution (dogonyara, neem tree/leaf, cashew tree, and Ewúro (Vernonia amygdalina/bitter leaf))" ~ "Herbal solution",
                               Merged_Remedies == "Hydrochloroquine, Azithromycin, Zinc, Bleach, Zithromax, Vitamin C, Hypo and Dettol" ~ "Chloroquine & likes",
                               Merged_Remedies == "Anti-malaria medication" ~ "Malaria drugs",
                               Merged_Remedies == "Bitter cola, Onions, Garlic, Pawpaw leaf, Garlic, sheer butter, and alligator pepper" ~ "Bitter kola and likes",
                               Merged_Remedies == "Cannabis (cocaine, weed, igbo, ganja, colorado, marijuana, and utaba/tobacco)" ~ "Cannabis",
                               Merged_Remedies == "Others (Hygiene, vanilla, salt, soap, viagra, ultraviolet light, garri, sugar, kerosene, Black Seed, Tea, zobo, kunu, cold ziza, Nigella sativa & alábùkún)" ~ "Others",
                               Merged_Remedies == "Music/Jazz/smile/love/food" ~ "Music",
                               Merged_Remedies == "Ebola/HIV/Cancer Medication" ~ "Ebola/HIV/Cancer drugs",
                               Merged_Remedies == "Palm oil and anointing oil" ~ "Palm/anointing oil",
                               Merged_Remedies == "Tea, zobo, kunu, and ziza" ~ "Drinks",
                               Merged_Remedies == "Fruit mixture (pineapple, honey, carrort, orange, and ginger)" ~ "Fruit mix",
                               Merged_Remedies == "Sex, sperm and breast milk" ~ "Sex, sperm  & breast",
                               Merged_Remedies == "Artemisia (Ewe egbin/tazargade/mkpatat/baaba)" ~ "Artemisia",
                               Merged_Remedies == "Madagascar COVID-19 Organic syrup" ~ "Organic syrup",
                               Merged_Remedies == "Dexamethasone, Nafamostat, Ivermectin (Mectizan), and Avigan (Favipiraviv)" ~ "Alledged COVID Drugs",
                               TRUE ~ Merged_Remedies))

##############################################################################  
#STAGE FIVE: DISAGGREGATING THE SPECIFIC REMEDIES 
#The following lines of codes disaggregates the specific remedies recommended

cureNG_spec <- cureNG_upt %>%
  filter(RRemedies %in% c('Spirituality', 'Herbal solution', 'Chloroquine & likes', 
                          'Malaria drugs', 'Others', 'Music', 'Alcohol', 'Ebola/HIV/Cancer drugs',
                          'Bitter kola and likes','Fruit mix', 'Cannabis', "Palm/anointing oil",
                          "Alledged COVID Drugs", "Sex, sperm  & breast",'Organic syrup',
                          "Artemisia", "Hot Amala/Eba/Semo")) %>%
  mutate (Remedies = tolower(Remedies)) %>% 
  mutate(RRemedies = case_when(str_detect(Remedies, "anointing|god|spiritual|jesus|allah|prayer|pray|lord|christ|faith|christianity|christian") ~ "Spirituality",
                               str_detect(Remedies, "ewúro|ewuro|bitter leaf") ~ "Bitter leaf",
                               str_detect(Remedies, "zithromax|azithromycin|azythromicin") ~ "Azithromycin",
                               str_detect(Remedies, "hydrochloroquine|chloroquine|choloroquine|chloroquin|hydroxycloroquine|hydroxyl|hydroxychrolroquine|hydroxycholorquine|hydroxychlorquine|hydroxychloriquine|hydroxy") ~ "Chloroquine",
                               str_detect(Remedies,"artemisia|egbin|tazargade|mkpatat|baaba") ~ "Artemisia",
                               str_detect(Remedies,"remdesvir|remdesiviri|remdecivir|remdesivir") ~ "Remdesivir",
                               str_detect(Remedies,"agbo|herbs") ~ "Herbs",
                               str_detect(Remedies,"igbo|weed") ~ "Weed",
                               TRUE ~ Remedies)) %>% 
  filter (!str_detect(Remedies, "herbal|love|tea|hydro|local|hiv|native|bitter|traditional|food|hygiene|fruit|jedi|sex|sperm|breast|amala|eba|semo|hot|soap|jazz|music")) %>% 
  mutate (RRemedies = case_when(str_detect(Tweet %>% tolower(), "palm oil|palmoil|red oil") ~ "Palm oil",
                                str_detect(Tweet %>% tolower(), "black seed|blackseed") ~ "Black seed oil",
                                str_detect(Tweet %>% tolower(), "madagascar") ~ "Madagascar Organic",
                                str_detect(Tweet %>% tolower(), "cola|kola") ~ "Bitter kola",
                                TRUE ~ RRemedies))

cureNG_spec %>% 
  count(RRemedies, 
        name = "Frequency",
        sort = TRUE)%>%
  mutate(Percentage = Frequency/sum(Frequency)*100)%>%
  kbl(caption = "COVID-19 Remedies Recommended by Nigerians on Twitter") %>%
  kable_material(c("stripped", 'hover'))%>%
  kable_paper(bootstrap_options = c("striped","hover","condensed","responsive"),
              full_width = FALSE) %>%  
  save_kable(file  = "Output/Table/Nigeria_specific_remedies.html")

###############################################################################
#
#DATA WRANGLING OF GHANIAN TWEETS
#
#
###############################################################################

#STAGE ONE: Extract Ghanian tweets from the binded tweets' dataframe

cureGH <- twitter_data %>%
  filter(geo_locat == "Ghana")

##############################################################################

#STAGE TWO: CLEANING THE TWEETS (We follow the same process as in Nigeria)

cureGH_upt <- cureGH %>%
  select(text) %>%
  tibble(line = 1:nrow(cureGH), Tweet = text) %>%
  unnest_tokens(Remedies, text)%>%
  mutate(Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "[[:punct:]]")), NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "[[:digit:]]+[[:digit:]]+") |
                                    str_detect(Remedies, pattern = "(.)\\1{3,}") |
                                    str_detect(Remedies, pattern = "\\b(.)\\b")
                            ),
                            NA),
         Remedies = replace(Remedies,
                            which(Remedies %in% stop_words$word), NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "https|coronavirus|covid|treatment|corona|virus|treat|ghana|people|patients|health|hospital|vaccine|medicine|world|found|president|government|medical|prevention|africa|country|tested|centre|remedy|accra|home|isolation|pandemic|test|nakufoaddo|drugs|hospitals|positive|time|countries|scary|china|gyaigyimii|start|african|false|finding|immune|minister|disease|person|recovered|spread|support|infected|prevent|safe|symptoms|system|leaders|workers|deaths|hear|mask|nation|public|water|bring|centers|fight|money|protocols|receiving|recorded|designated|doctors|jdmahama|kindly|research|waiting|waste|complications|confirmed|died|director|drug|energy|family|fear|ghtoday|hand|london|protect|schools|scientists|social|students|taking|team|attention|clinical|condition|continue|death|english|facilities|facility|flown|infections|infectious|konkrumah|lives|patient|politicians|pray|products|question|talk|akufo|announced|anti|borders|breaking|center|chinese|citizens|company|critical|deadly|effective|ein|forget|heard|infection|inside|leave|medication|morning|municipal|nofear|ofori|joynews|outbreak|ready|recovery|related|remember|school|service|allowance|business|campaign|evidence")),
                            
                            NA))%>%
  filter(!Remedies %in% c('cure','amp','dey','cnn','de','dr','oo','lie', 'life','kill','hiv','fi','fast','dead','beg', 'set','news','bro','ooo', 'fda', 'ei', 'usa', 'tema', 'lol','care','stay','save', 'told','true','real', 'stop','addo', 'fit', 'free','hope','dem','fit','join','ndc', 'wait','ah','call','na','post','cos','day','uk','ei', 'atta','rate','read', 'amen','cost', 'dear','data','govt',"poor","rise","saf","till","tonight","trial","trump","week","album","anaa", "bad", "badwam","based", "bless","brought","class","daily","days","deal","deserves","die","disregard","drink","east","evil","fake","food","front","fs","ga","ghonenews","ghonetv","global","gtnewstoday","guys","happened","hard","herald","hon","house","huge","hv","il","italy", 'plant',"key","killer", "la", "link", "listen", "live", "looked","lord","management", "mandatory","means","media","months","nose","nu", "paying", "potential", "provide", "quick", "radio", "received", "report", "responding", "results", "rich", "run", "running", "sad", "science", "scientific", "severe", "sick", "skin", "story", "suspected", "thinking","tree", "tweet", "twitter", "ugmc", "viral", "whilst", "abroad", "abt", "added", "malaria", 'bacterial', 'bacteria','waakyewednesday','saybanku', 'okxzkfqnut', 'minutes', 'kofiegodfried', 'demigodchesky', 'boil', 'spoil'))%>%
  filter(!is.na(Remedies))

##############################################################################


#STAGE THREE: Merging similar remedies (As in the case of Nigeria)

cureGH_upt <- cureGH_upt %>%
  mutate(Merged_Remedies = case_when(str_detect(Remedies, "kaletra|remdesivir") ~ "Ebola and HIV drugs",
                                     str_detect(Remedies, "neem|lemon|gingers|onions|roots|herbs|fruit|vegetable|phyto|nut|oil|herb|herbatine|rooter|sobolo|bacteria|garlic|ginger") ~ "Herbal remedies (Neem tree, lemon, gingers, onions, roots, herbs, fruits, vegetables, Phytonutrients/phytochemicals, oil & nut bearing plant, Herbatine herbal mixture, Rooter mixture, Sobolo (Zobo), Garlic)",
                                     str_detect(Remedies, "quinine|hydroxychloroquine|azithromycin|chloroquine|hydroxychloroquine|zithromax|hydroacid|peroxide|quinine|favipiravir|avigan|chroloquine|interferon") ~ "Hydrochloroquine, hydroxychloroquine, Hydroacid chloroquine, Hydrogenperoxide, Zithromax, Azithromycin & Vitamin C, Interferon",
                                     str_detect(Remedies, "mouthwash|breast|smile|weed|akrobeto|apio|detol|dettol|marijuana|semen|sex|sexiness") ~ "Others (Mouthwash, smile, breast milk, weed/marijuana, Dettol, Semen Sex)",
                                     str_detect(Remedies, "madagascar|madagascan|organic|organics|cvo|coa|madagasgar") ~ "Madagascar Organic syrup/CVO",
                                     str_detect(Remedies, "adonko|akpeteshie|adutwumwaa|alcohol|achohol|akpeteshi") ~ "Alcohol (Adonko bitters/Adutwumwaa bitters & Akpeteshie)",
                                     str_detect(Remedies, "waakye|fufu|banku") ~ "Food (Waakye, fufu, banku)",
                                     str_detect(Remedies, "god|jesus") ~ "Religiousity (God & Jesus)",
                                     TRUE ~ Remedies))

##########################################################################


#STAGE FOUR: DISAGGREGATING AND REWORDING OF THE REMEDIES IDENTIFIED (As in the case of Nigerian Tweets)

cureGH_upt <- cureGH_upt %>%
  filter(Merged_Remedies %in% c("Ebola and HIV drugs", "Herbal remedies (Neem tree, lemon, gingers, onions, roots, herbs, fruits, vegetables, Phytonutrients/phytochemicals, oil & nut bearing plant, Herbatine herbal mixture, Rooter mixture, Sobolo (Zobo), Garlic)", "Hydrochloroquine, hydroxychloroquine, Hydroacid chloroquine, Hydrogenperoxide, Zithromax, Azithromycin & Vitamin C, Interferon", "Others (Mouthwash, smile, breast milk, weed/marijuana, Dettol, Semen Sex)", "Madagascar Organic syrup/CVO", "Alcohol (Adonko bitters/Adutwumwaa bitters & Akpeteshie)", "Food (Waakye, fufu, banku)", "Religiousity (God & Jesus)"))%>%
  mutate(RRemedies = str_to_sentence(Remedies),
         RRemedies = case_when(str_detect(RRemedies, "Madagascar|Madagascan|Organic|Organics|Cvo|Coa|Madagasgar") ~ "Madagascar COVID Organic (CVO)",
                               str_detect(RRemedies, "Herbatine") ~ "Herbatine herbal mixture",
                              str_detect(RRemedies, "Herbal|Roots|Herbs|Herb") ~ "Herbal Medicine",
                              str_detect(RRemedies, "God|Jesus") ~ "God/Jesus",
                              str_detect(RRemedies, "Quinine|Hydroxychloroquine|Chloroquine|Hydroxychloroquine|Quinine|Chroloquine") ~ "Chloroquine/Hydrochloroquine",
                              str_detect(RRemedies, 'Neem') ~ 'Neem tree',
                              
                              str_detect(RRemedies, "Rooter") ~ "Rooter mixture",
                              str_detect(RRemedies, "Adonko") ~ "Adonko bitters",
                              str_detect(RRemedies, "Adutwumwaa") ~ "Adutwumwaa bitters",
                              str_detect(RRemedies, "Alcohol|Achohol") ~ "Alcohol",
                              str_detect(RRemedies, "Akpeteshie|Akpeteshi") ~ "Akpeteshie",
                              str_detect(RRemedies, "Oil|Nut") ~ "Oil & nut bearing plant",
                              str_detect(RRemedies, "Phyto") ~ "Phytonutrients/phytochemicals",
                              str_detect(RRemedies, "Ginger|Gingers") ~ "Ginger",
                              str_detect(RRemedies, "Dettol|Detol") ~ "Dettol",
                              str_detect(RRemedies, "Peroxide") ~ "Hydrogen Peroxide",
                              str_detect(RRemedies, 'Breast') ~ "Breast Milk",
                              TRUE ~ RRemedies)
         )

#Generating the specific remedies in HTML table 
cureGH_spec <- cureGH_upt %>%
  count(RRemedies, 
        name = "Frequency",
        sort = TRUE)%>%
  mutate(Percentage = Frequency/sum(Frequency)*100)%>%
  kbl(caption = "COVID-19 Remedies Recommended by Ghanians on Twitter") %>%
  kable_material(c("stripped", 'hover'))%>%
  kable_paper(bootstrap_options = c("striped","hover","condensed","responsive"),
              full_width = FALSE)
#We can save the output as a .png file 
#first we need to install PhantomJS using the following code
webshot::install_phantomjs(force = TRUE)

#Next we save the HTML output as .png file (image)
save_kable(x = cureGH_spec,
           file  = "Output/Table/Ghana_specific_remedies.png")


##############################################################################
#STAGE 5: SELECTION OF NON-PHARM AND HERBAL DRUDS
##############################################################################

cureGH_rem <- cureGH_upt%>%
  filter(!RRemedies %in% c('God/Jesus','Oil & nut bearing plant','Breast Milk','Waakye','Akpeteshie','Alcohol','Smile','Weed','Banku','Dettol','Akrobeto','Apio','Fufu','Marijuana','Mouthwash','Semen','Sex','Sexiness')) 

###############################################################################
#
#DATA WRANGLING OF KENYAN TWEETS
#
#
###############################################################################

#STAGE ONE: Extract Kenyan tweets from the binded tweets' dataframe

cureKE <- twitter_data %>%
  filter(geo_locat == "Kenya")

#####################################

#STAGE TWO: CLEANING THE TWEETS (We follow the same process as in Nigeria)

cureKE_upt <- cureKE %>%
  select(text) %>%
  tibble(line = 1:nrow(cureKE), Tweet = text) %>%
  unnest_tokens(Remedies, text)%>%
  mutate(Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "[[:punct:]]")), NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "[[:digit:]]+[[:digit:]]+") |
                                    str_detect(Remedies, pattern = "(.)\\1{3,}") |
                                    str_detect(Remedies, pattern = "\\b(.)\\b")
                            ),
                            NA),
         Remedies = replace(Remedies,
                            which(Remedies %in% stop_words$word), NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "https|coronavirus|treatment|corona")),
                            NA))%>%
  filter(!Remedies %in% c('cure','covid','amp', "treat", "virus", "kenya", "people", "treating", "patients", "health", "vaccine", "kenyans", "pandemic", "remedy", "prevention", "time", "world", "hospital", "government", "medical", "disease", "africa", "nairobi", "country", "president", "stop", "care", "found", "hospitals", "china", "county", "spread", "testing", "continue", "lord", "abroad", "positive", "public", "abnormally", "ya", "hiv", "lockdown", "news", "quarantine", "social", "infected", "stay", "death", "die", "died", "doctors", "home", "hope", "na", "day", "dr", "drug", "icu", "symptoms", "cost", "days", "drugs", "life", "safe", "test", "african", "earth", "money", "due", "pay", "science", "told", "bbi", "citizentvkenya", "free", "isolation", "medicine", "patient", "period", "receiving", "repentance", "solution", "trump", "chinese","fight", "guys", "infection", "kagwe", "nation", "poor", "raila", "support", "call", "countries", "effective", "flu", "leaders", "magufuli", "masks", "measures", "provide", "research", "statehousekenya", "system", "tanzania", "treated", "workers", "allowed", "confirmed", "doctor", "facilities", "malaria", "real", "recovered", "scientists", "vaccines", "called", "cover", "cs", "discovered", "gok", "govt", "human", "india", "italy", "police", "private", "tested", "water", "avoid", "busy", "current", "follow", "funds", "healthcare", "kenyan", "lives", "mass", "nhif", "ni", "related", "risk", "seek", "sick", "start", "survive", "thinking", "travel", "true", "africans", "black","coming", "community", "curfew", "deaths", "facility", "governor", "insurance", "live", "lot", "love", "media", "mombasa", "mutahi", "national", "normal", "power", "prevent", "repent", "save", "severe", "staff", "team", "theravekbc", "total", "blood", "centre", "citizens", "deadly", "diseases", "finding", "frontline", "hapa","including", "kelinkenya", "kenyatta", "ongoing", "protect", "rate", "remember", "rest", "services", "set", "started", "wait", "based", "brought", "business", "cancer", "center", "check", "church", "claims", "clinical", "control", "crisis", "fellow", "forget", "hands", "immune", "key", "kill", "kwa", "lost", "management", "mask", "medics", "million", "paying", "post", "remain", "rich", "scientific", "tests", "till", "unit", "waiting", "week", "wife", "worried", "afford", "ahmednasirlaw", "aids", "america", "beds", "bill", "cures", "daily", "dead", "europe", "fever", "giving", "global", "guidelines", "handle", "hii", "imagine", "isolate", "ksh", "lead", "level", "living", "local", "mild", "moment", "morning", "nations", "political", "pray", "prayers", "protocols", "response", "return", "robertalai", "rwanda", "safety", "spreading", "therapy", "times", "uhuru", "uk", "vaccinated", "watu", "wuhan", "access", "affordable","ama", "antiviral", "bad", "billion", "body", "buy", "capacity", "close", "closed", "companies", "coast", "coastal", "dispensationofrepentance", "globalrepentancecall", "needforglobalrepentance", "universalrepentance", 'olivermathenge', "twigabanana", "clarioncalltorepentance", "coasterians", "godefroid", "godstillincharge", "gods", "herbalist", "kenyaforjesus", "repentandenter", "sugarcoat", "thesixthsealofgod","teamworshipwednesday", "theholyscroll", "thisrepentancecall", "vegmecwe8q", "loliondo"))%>%
  filter(!is.na(Remedies))

##############################################################################

#STAGE THREE: Merging similar remedies (As in the case of Nigerian)

cureKE_upt <- cureKE_upt %>%
  mutate(Merged_Remedies = case_when(str_detect(Remedies, "lopinavir|retonovir|oseltamivir|protease") ~ "HIV Antiretrovirals drugs",
                                     str_detect(Remedies, "chloroquine|hydroxychloroquine|chloquine|choloroquine|hydroxychroquine|hcq|hydrochloric|chloroquin") ~ "Chloroquine/Hydroxychloroquine sulfate/hydrochloric acid",
                                     str_detect(Remedies, "azithromycin|vitamin|ivermectin|cetrezine|antihistamine|antihistamines|anthelminthic|adactone|erythromycin|nitazoxanide|paracetamol|pidotimod|prozac") ~ "Durgs (Azithromycin, vitamin C & D, Ivermectin, Cetrezine, Anthelminthic drug, Spironolactone (Aldactone), Erythromycin, Nitazoxanide, Antihistamine, Paracetamol, Pidotimod, Prozac)",
                                     str_detect(Remedies, "therapeutic|zinc|disinfectants|detergents|bleach|ocean|lachrymatory|methylxanthine|theobromine|mint|theophylline") ~ "Others (Therapeutic/Zinc, Disinfectants, Detergents, Ocean water, Lachrymatory, Methylxanthine, Theobromine, Theophylline)", 
                                     str_detect(Remedies, 'ayurvedic|interferon|coronil') ~ "COVID-19 tablets (Ayurvedic, Interferon alpha 2B)",
                                     str_detect(Remedies, "remdesivir|molnupiravir|favipiravi|avigan|dexamethasone|chlorphenamine|paxlovid|nirmatrelvir|ritonavir|sotrovimab") ~ "COVID durgs",
                                     str_detect(Remedies, 'coa') ~ "COA FS",
                                     str_detect(Remedies, "organic|cvo|madagascar|madagascan") ~ "Madagascar CVO",
                                     str_detect(Remedies, "ginger|lemon|limau|fruit|banana|veg|turmeric|sugarcane") ~ "Fruit (Lemon, Ginger & Banana, Sugercane)",
                                     str_detect(Remedies, "mwarubaine|garlic|rurii|herbal|olive|aloe|artemesia|covidex|lime") ~ "Herbal solution (Garlic, Nwarubaine concoction, Lime, Loliondo & Wanjiru wa rurii, Olive oil, Aloe Vera, Artemesia, Covidex)",
                                     str_detect(Remedies, "alcohol|alchohol|methanol") ~ "Alcohol/Methanol",
                                     str_detect(Remedies, "jesus|shepherd") ~ "Jesus",
                                     str_detect(Remedies, "god|repent|worship|holy|jehovah|yahweh|allah|communion") ~ "Religiousity (God, Allah, Repentance, Worship, Holy Communion)",

                                     TRUE ~ Remedies))


###############################################################################

#STAGE FOUR: REWORDING AND DISAGGREGATING OF THE REMEDIES IDENTIFIED (As in the case of Nigerian Tweets)


cureKE_upt <- cureKE_upt %>%
  filter(Merged_Remedies %in% c("Religiousity (God, Allah, Repentance, Worship, Holy Communion)", "Chloroquine/Hydroxychloroquine sulfate/hydrochloric acid", "Durgs (Azithromycin, vitamin C & D, Ivermectin, Cetrezine, Anthelminthic drug, Spironolactone (Aldactone), Erythromycin, Nitazoxanide, Antihistamine, Paracetamol, Pidotimod, Prozac)", "Herbal solution (Garlic, Nwarubaine concoction, Lime, Loliondo & Wanjiru wa rurii, Olive oil, Aloe Vera, Artemesia, Covidex)", "Fruit (Lemon, Ginger & Banana, Sugercane)", "Others (Therapeutic/Zinc, Disinfectants, Detergents, Ocean water, Lachrymatory, Methylxanthine, Theobromine, Theophylline)", "COVID durgs", "COVID durgs", "Madagascar CVO", "Jesus", "COA FS", "HIV Antiretrovirals drugs", "Alcohol/Methanol", "COVID-19 tablets (Ayurvedic, Interferon alpha 2B)"))%>%
  mutate(RRemedies = str_to_sentence(Remedies),
         RRemedies = case_when(str_detect(RRemedies, "Organic|Cvo|Madagascar|Madagascan") ~ "Madagascar COVID Organic (CVO)",
                               str_detect(RRemedies, "Chloroquine|Hydroxychloroquine|Hydoxychloroquine|Hydrochloroquine|Chloquine|Choloroquine|Hydroxychroquine|Hcq|Hydrochloric|Chloroquin") ~ "Chloroquine/Hydrochloroquine",
                               str_detect(RRemedies, "God|Repent|Worship|Holy|Jehovah|Yahweh|Allah|Communion|Jesus|Shepherd") ~ "Religiousity (God, Allah, & Worship)", 
                               str_detect(RRemedies, "Alcohol|Alchohol") ~ "Alcohol",
                             str_detect(RRemedies, 'Aloe') ~ "Aloe Vera",
                             str_detect(RRemedies, 'Olive') ~ "Olive oil",
                             str_detect(RRemedies, 'Coa') ~ "COA FS",
                             str_detect(RRemedies, 'Ocean') ~ "Ocean water",
                             str_detect(RRemedies, 'Vitamin') ~ "Vitamin C & D",
                             str_detect(RRemedies, "Anthelminthic") ~ "Anthelmintic",
                             str_detect(RRemedies, 'Rurii') ~ "Wanjiru wa rurii",
                             str_detect(RRemedies, "Protease") ~ "Protease inhibitor",
                             str_detect(RRemedies, "Cetrezine") ~ "Cetirizine",
                             str_detect(RRemedies, "Paxlovid|Nirmatrelvir|Ritonavir|Retonovir") ~ "Paxlovid (nirmatrelvir + ritonavir)",
                             str_detect(RRemedies, "Antihistamine|Antihistamines") ~ "Antihistamines",
                             str_detect(RRemedies, "Ivermectin|Ivermectinsaveslives") ~ "Ivermectin",
         TRUE ~ RRemedies)
         )


#Generating the specific remedies in HTML table 
cureKE_spec <- cureKE_upt %>%
  count(RRemedies, 
        name = "Frequency",
        sort = TRUE)%>%
  mutate(Percentage = Frequency/sum(Frequency)*100)%>%
  kbl(caption = "COVID-19 Remedies Recommended by Kenyans on Twitter") %>%
  kable_material(c("stripped", 'hover'))%>%
  kable_paper(bootstrap_options = c("striped","hover","condensed","responsive"),
              full_width = FALSE)
#We can save the output as a .png file 
#first we need to install PhantomJS using the following code
webshot::install_phantomjs(force = TRUE)

#Next we save the HTML output as .png file (image)
save_kable(x = cureKE_spec,
           file  = "Output/Table/Kenya_specific_remedies.png")


##############################################################################
#STAGE 5: SELECTION OF NON-PHARM AND HERBAL DRUDS
##############################################################################

cureKE_rem <- cureKE_upt%>%
  filter(!RRemedies %in% c('Religiousity (God, Allah, & Worship)','Alcohol','Bleach','Disinfectants','Zinc','Detergents','Therapeutic','Methanol','Ocean water','Therapeutics','Turmeric','Mint','Olive oil')) 

###############################################################################
#


###############################################################################
#
#DATA WRANGLING OF SOUTH AFRICAN TWEETS
#
###############################################################################

#STAGE ONE: Extract South African tweets from the binded tweets' dataframe

cureZA <- twitter_data %>%
  filter(geo_locat == "South Africa")

##############################################################################

#STAGE TWO: CLEANING THE TWEETS (We follow the same process as in Nigeria)

cureZA_upt <- cureZA %>%
  select(text) %>%
  tibble(line = 1:nrow(cureZA), Tweet = text) %>%
  unnest_tokens(Remedies, text)%>%
  mutate(Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "[[:punct:]]")), NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "[[:digit:]]+[[:digit:]]+") |
                                    str_detect(Remedies, pattern = "(.)\\1{3,}") |
                                    str_detect(Remedies, pattern = "\\b(.)\\b")
                            ),
                            NA),
         Remedies = replace(Remedies,
                            which(Remedies %in% stop_words$word), NA),
         Remedies = replace(Remedies,
                            which(str_detect(Remedies, pattern = "https|coronavirus|covid|treatment|corona")),
                            NA))%>%
  filter(!Remedies %in% c('cure','amp','drug','treat','virus','people','vaccine','treating','patients','africa','african','found','south','health','hospital','world','government','medical','doctors','prevention','time',"remedy", "symptoms", "lockdown", "president", "flu", "die", "testing", "positive", "country", "home", "pandemic", "drzwelimkhize", "aids", "china", "change", "tested", "infected", "disease", "hospitals", "sign", "petition", "sa", "scientists", "test", "medicine", "news", "guys", "stop", "union", "vaccines", "life", "prevent", "sick", "africans", "cyrilramaphosa", "medication", "traditional", "view", "lives", "money", "article", "countries", "infection", 'hiv', "dr", "rate", "day", "hope", "population", "trump", "called", "care", "deaths", "effective", "anti", "death", "doctor", "immune", "stay", "taking", "days", "public", "real", "stigmabase", "system", "safe", "spread", "contract", "remember", "support", "died", "gonna", "research", "ya", "drugs", "fight", "le", "presidencyza", "save","wait", "account", "bless", "diseases", "months", "private", "approved", "deathly", "drink", "lost", "patient", "start", "black", 'cancer', 'malaria', 'tb','ke','recovery',"alcoholwillbesold","alcoholsales",'herbalinfusion','drinking', 'cooldrink', 'drinks','cigaretteearrings','alcoholban','fastfood', 'gods','herbalist','ivermectin4sa','lemonnherb','spray','teacher','teaspoon','2weeksextension','aspennewvoices','aspiringdrd','breadwinner','brownvinegarandsalttestimony','bsexll2tt9','duckylemon','foodforest','foodies','foodparcels','foodtodiefor','gardeegodrich','foods','godfadasofdeep','godfadasofdeep','hlemonna','hotelwithfoodforest','indizafoods','iasotea','team','imigodoyi','indizatea','jesusalema','lengalaandweedmixture','lennytlegodi','naturalherbs','sgodo6mp','teachers','teaches','tebogoditshego','xsextrpdm8','bygodwilling','steaming','steam','teams',"spraying",'steaks','teas'))%>%
  filter(!is.na(Remedies))

##############################################################################


#STAGE THREE: Merging similar remedies
#The following line of codes merge similar remedies together
#The ensuring result is saved in a new column "Merged_Remedies" in the "cureZA_upt"
#dataframe
#We used the sort function to create a separate dataframe to check for similar
#remedies in the "Remedies" column.

cureZA_upt <- cureZA_upt %>%
  mutate(Merged_Remedies = case_when(str_detect(Remedies, "remdesivir|lopinavir|remdesvir|ritonavir|lopanivir|interferon|redmesivir|ivermectin|invermectin|actemra|ayurveda|ivermax|ivomec|ibrufen|oseltamivir|remdesiver|retonovir") ~ "Lopinavir, remdesivir, Ritonavir, Interferon & ivermectin, Tocilizumab (Actemra)",
                                     str_detect(Remedies, "chloroquine|hydroxychloroquine|peroxide|hydrogenperoxide|hydroxy|hydroxychloroqunie|hydroxychlorquine|dexamethasone|plasmoquinine|azithromycin|zinc|azithromycine|quercetin|syrup") ~ "Hydroxychloroquine",
                                     str_detect(Remedies,"cvo|madagascar") ~ "Madagascar CVO",
                                     str_detect(Remedies,"god|jesus|allah|yahweh|hadith|duo|pray") ~ "God",
                                     str_detect(Remedies, "herb|herbs|herbal|alágbo|eléwéọmọ|herbalife|nevaropine") ~ "Herbal solution",
                                     str_detect(Remedies, "artemisia|mugworts|umhlonyane|artemesia|artismia|arthemisia|avigan") ~ "Artemisia (mugworts/umhlonyane)",
                                     str_detect(Remedies, "bleach|disinfectants|disinfectant|alcohol|lemon|bicarbonate|orange|vitamin|multivitamin|ginger|aspirin|honey|salt|pepper|stoney|medlemon|disprin|haarlemensis|turlington|tea|stameta|beer|cannibus|cannabis|cigarette|cigarettes|therapeutic|weed|fruit|vinegar|whisky|aloeveragel|asprin|dettol|lysol|hennessy|liquor|methanol|onions|shampoo|smoothies|convalescent") ~ "Others (Inc salt & pepper, Brown vingar & salt, Vit D & C)",
                                     str_detect(Remedies, "food|sex|bread|sugars|spicey") ~ "Good food and sex (inc. spicey Indian foods)",
                                     str_detect(Remedies, "lengana|moringa|garlic|beetroot") ~ 'Moringa, Lengana & Garlic',
                                     str_detect(Remedies, 'urine') ~ "Cow urine",
                                     str_detect(Remedies, 'glaze') ~ "Sun glaze",
                                     str_detect(Remedies, "shower") ~ "Cold showers and drink water",
                                     TRUE ~ Remedies))

##########################################################################
#Hint:
#Use the following code chunk to create a dataframe to sort the remedies column
#Remove "#" before sort and count function.
#sort <- cureZA_upt %>%
#count(Merged_Remedies, sort = T)
#
##########################################################################

#STAGE FOUR: REWORDING AND DISAGGREGATING OF THE REMEDIES IDENTIFIED (As in the case of Nigerian Tweets)


cureZA_upt <- cureZA_upt %>%
  filter(Merged_Remedies %in% c('Madagascar CVO','Others (Inc salt & pepper, Brown vingar & salt, Vit D & C)','Lopinavir, remdesivir, Ritonavir, Interferon & ivermectin, Tocilizumab (Actemra)', 'God', 'Hydroxychloroquine', "Herbal solution", "Good food and sex (inc. spicey Indian foods)","Moringa, Lengana & Garlic", "Artemisia (mugworts/umhlonyane)","Cow urine", "Sun glaze", "Cold showers and drink water"))%>%
  mutate(RRemedies = str_to_sentence(Remedies),
         RRemedies = case_when(str_detect(RRemedies, "Urine") ~ "Cow urine",
                               str_detect(RRemedies, "Spicey") ~ "Spicey Indian foods",
                             str_detect(RRemedies, "Madagascar|Cvo") ~ "Madagascar CVO",
                             str_detect(RRemedies, "Hydroxychloroquine|Chloroquine|Peroxide|Hydrogenperoxide|Hydroxy|Hydroxychloroqunie|Hydroxychlorquine|Hydroxchloroquine|Hydrochloroquine|Plasmoquinine") ~ "Chloroquine",
                             str_detect(RRemedies, "Alcohol|Liquor|Methanol|Hennessy|Beer|Whisky") ~ "Alcohol",
                             str_detect(RRemedies, "Herb|Herbs|Herbal|Eléwéọmọ|Alágbo") ~ "Herbs and Herbal Solutions",
                             str_detect(RRemedies, "Invermectin|Ivermectin|Ivermax|Ivomec") ~ "Ivermectin",
                             str_detect(RRemedies, "Artemisia|Mugworts|Umhlonyane|Artemesia|Artismia|Arthemisia|Lengana") ~ "Artemisia (Mugworts/Umhlonyane)",
                             str_detect(RRemedies, "Vitamin") ~ "Vitamin D & C",
                             str_detect(RRemedies, "Actemra") ~ "Tocilizumab (Actemra)",
                             str_detect(RRemedies, "Bleach|Disinfectants|Disinfectant") ~ "Bleach & disinfectants",
                             str_detect(Remedies, "remdesivir|remdesvir|redmesivir|remdesiver") ~ "Remdesivir",
                             str_detect(Remedies, "ritonavir|retonovir|lopinavir|lopanivir") ~ "Lopinavir and Ritonavir",
                             str_detect(RRemedies, "God|Jesus|Allah|Yahweh") ~ "God",
                             str_detect(RRemedies, "Vinegar|Brownvinegarandsalt|Saltandvinegar|Saltandvinegartestimony") ~ "Brown vinegar and salt",
                             str_detect(RRemedies, "Salt|Pepper") ~ "Salt and Pepper",
                             str_detect(RRemedies, "Cannibus|Cannabis|Weed|Cannabis") ~ "Cannabis",
                             str_detect(RRemedies, "Cigarette|Cigarettes") ~ "Cigarettes",
                             str_detect(RRemedies, 'Glaze') ~ "Sun glaze",
                             str_detect(RRemedies, "Shower|Showers") ~ "Cold shower",
                             str_detect(RRemedies,"Syrup") ~ "Cough syrup",
                             str_detect(RRemedies, "Pray|Praying|Prayer|Prayers") ~ "Prayer",
                             str_detect(RRemedies, "Convalescent") ~ "Convalescent plasma",
                             str_detect(RRemedies, "Aspirin|Disprin|Asprin") ~ "Aspirin",
                             str_detect(RRemedies, "Nevaropine") ~ "Nevirapine",
                             str_detect(RRemedies, "Aloeveragel") ~ "Aloe vera gel",
                             str_detect(RRemedies, "Azithromycine|Azithromycin") ~ "Azithromycin",
                             str_detect(RRemedies, "Ibrufen") ~ "Ibuprofen",
                             str_detect(RRemedies, "Lysol|Dettol") ~ "Lysol and Dettol",
                             str_detect(RRemedies, "Therapeutics|Therapeutic") ~ "Therapeutic",
                             TRUE ~ RRemedies)
         )


#Generating the specific remedies in HTML table 
cureZA_spec <- cureZA_upt %>%
  count(RRemedies, 
        name = "Frequency",
        sort = TRUE)%>%
  mutate(Percentage = Frequency/sum(Frequency)*100)%>%
  kbl(caption = "COVID-19 Remedies Recommended by South Africans on Twitter") %>%
  kable_material(c("stripped", 'hover'))%>%
  kable_paper(bootstrap_options = c("striped","hover","condensed","responsive"),
              full_width = FALSE)
#We can save the output as a .png file 
#first we need to install PhantomJS using the following code
webshot::install_phantomjs(force = TRUE)

#Next we save the HTML output as .png file (image)
save_kable(x = cureZA_spec,
           file  = "Output/Table/South-Africa_specific_remedies.png")


##############################################################################
#STAGE 5: SELECTION OF NON-PHARM AND HERBAL DRUDS
##############################################################################

cureZA_rem <- cureZA_upt%>%
  filter(!RRemedies %in% c('God','Alcohol','Prayer','Food','Bleach & disinfectants','Tea','Cannabis','Salt and Pepper','Zinc','Cigarettes','Therapeutic','Cold shower','Cow urine','Sex','Bread','Lysol and Dettol','Smoothies','Stoney','Bicarbonate','Hadith','Onions','Shampoo','Spicey Indian foods','Sugars','Sun glaze')) 

###############################################################################


cureNG_spec %>% 
  group_by(RRemedies) %>% 
  count() %>% arrange(desc(n))


