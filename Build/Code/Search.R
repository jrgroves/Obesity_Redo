
# Set working directory
# setwd()


new_data <- read.table('./Build/Input/Search.dat', sep=' ')
names(new_data) <- c('R0000100',
  'R0298600',
  'R0298601',
  'R0298602',
  'R0298603',
  'R0298604',
  'R0298605',
  'R0298606',
  'R0298607',
  'R0298608',
  'R0298609',
  'R0298610',
  'R0298700',
  'R0298701',
  'R0298702',
  'R0298703',
  'R0298704',
  'R0298705',
  'R0298706',
  'R0298707',
  'R0298708',
  'R0298709',
  'R0298710',
  'R0298800',
  'R0298801',
  'R0298802',
  'R0298803',
  'R0298804',
  'R0298805',
  'R0298806',
  'R0298807',
  'R0298808',
  'R0298809',
  'R0298810',
  'R0298900',
  'R0298901',
  'R0298902',
  'R0298903',
  'R0298904',
  'R0298905',
  'R0298906',
  'R0298907',
  'R0298908',
  'R0298909',
  'R0298910',
  'R0299000',
  'R0299001',
  'R0299002',
  'R0299003',
  'R0299004',
  'R0299005',
  'R0299006',
  'R0299007',
  'R0299008',
  'R0299009',
  'R0299010',
  'R0299100',
  'R0299101',
  'R0299102',
  'R0299103',
  'R0299104',
  'R0299105',
  'R0299106',
  'R0299107',
  'R0299108',
  'R0299109',
  'R0299110',
  'R0536300',
  'R0536401',
  'R0536402',
  'R1235800',
  'R1482600',
  'R2129400',
  'R2129401',
  'R2129402',
  'R2129403',
  'R2129404',
  'R2129405',
  'R2129406',
  'R2129407',
  'R2129408',
  'R2129500',
  'R2129501',
  'R2129502',
  'R2129503',
  'R2129504',
  'R2129505',
  'R2129506',
  'R2129507',
  'R2129508',
  'R2129600',
  'R2129601',
  'R2129602',
  'R2129603',
  'R2129604',
  'R2129605',
  'R2129606',
  'R2129607',
  'R2129608',
  'R2129700',
  'R2129701',
  'R2129702',
  'R2129703',
  'R2129704',
  'R2129705',
  'R2129706',
  'R2129707',
  'R2129708',
  'R2129800',
  'R2129801',
  'R2129802',
  'R2129803',
  'R2129804',
  'R2129805',
  'R2129806',
  'R2129807',
  'R2129808',
  'R2129900',
  'R2129901',
  'R2129902',
  'R2129903',
  'R2129904',
  'R2129905',
  'R2129906',
  'R2129907',
  'R2129908',
  'R3454100',
  'R3454101',
  'R3454102',
  'R3454103',
  'R3454104',
  'R3454105',
  'R3454106',
  'R3454107',
  'R3454108',
  'R3454109',
  'R3454110',
  'R3454200',
  'R3454201',
  'R3454202',
  'R3454203',
  'R3454204',
  'R3454205',
  'R3454206',
  'R3454207',
  'R3454208',
  'R3454209',
  'R3454210',
  'R3454300',
  'R3454301',
  'R3454302',
  'R3454303',
  'R3454304',
  'R3454305',
  'R3454306',
  'R3454307',
  'R3454308',
  'R3454309',
  'R3454310',
  'R3454400',
  'R3454401',
  'R3454402',
  'R3454403',
  'R3454404',
  'R3454405',
  'R3454406',
  'R3454407',
  'R3454408',
  'R3454409',
  'R3454410',
  'R3454500',
  'R3454501',
  'R3454502',
  'R3454503',
  'R3454504',
  'R3454505',
  'R3454506',
  'R3454507',
  'R3454508',
  'R3454509',
  'R3454510',
  'R4850000',
  'R4850001',
  'R4850002',
  'R4850003',
  'R4850004',
  'R4850005',
  'R4850006',
  'R4850007',
  'R4850008',
  'R4850009',
  'R4850100',
  'R4850101',
  'R4850102',
  'R4850103',
  'R4850104',
  'R4850105',
  'R4850106',
  'R4850107',
  'R4850108',
  'R4850109',
  'R4850200',
  'R4850201',
  'R4850202',
  'R4850203',
  'R4850204',
  'R4850205',
  'R4850206',
  'R4850207',
  'R4850208',
  'R4850209',
  'R4850300',
  'R4850301',
  'R4850302',
  'R4850303',
  'R4850304',
  'R4850305',
  'R4850306',
  'R4850307',
  'R4850308',
  'R4850309',
  'R4850400',
  'R4850401',
  'R4850402',
  'R4850403',
  'R4850404',
  'R4850405',
  'R4850406',
  'R4850407',
  'R4850408',
  'R4850409',
  'R4850500',
  'R4850501',
  'R4850502',
  'R4850503',
  'R4850504',
  'R4850505',
  'R4850506',
  'R4850507',
  'R4850508',
  'R4850509',
  'R4850600',
  'R4850601',
  'R4850602',
  'R4850603',
  'R4850604',
  'R4850605',
  'R4850606',
  'R4850607',
  'R4850608',
  'R4850609',
  'R4850700',
  'R4850701',
  'R4850702',
  'R4850703',
  'R4850704',
  'R4850705',
  'R4850706',
  'R4850707',
  'R4850708',
  'R4850709',
  'R6466800',
  'R6466801',
  'R6466802',
  'R6466803',
  'R6466804',
  'R6466805',
  'R6466806',
  'R6466807',
  'R6466808',
  'R6466809',
  'R6466810',
  'R6466811',
  'R6466900',
  'R6466901',
  'R6466902',
  'R6466903',
  'R6466904',
  'R6466905',
  'R6466906',
  'R6466907',
  'R6466908',
  'R6466909',
  'R6466910',
  'R6466911',
  'R6467000',
  'R6467001',
  'R6467002',
  'R6467003',
  'R6467004',
  'R6467005',
  'R6467006',
  'R6467007',
  'R6467008',
  'R6467009',
  'R6467010',
  'R6467011',
  'R6467100',
  'R6467101',
  'R6467102',
  'R6467103',
  'R6467104',
  'R6467105',
  'R6467106',
  'R6467107',
  'R6467108',
  'R6467109',
  'R6467110',
  'R6467111',
  'R6467200',
  'R6467201',
  'R6467202',
  'R6467203',
  'R6467204',
  'R6467205',
  'R6467206',
  'R6467207',
  'R6467208',
  'R6467209',
  'R6467210',
  'R6467211',
  'R6467300',
  'R6467301',
  'R6467302',
  'R6467303',
  'R6467304',
  'R6467305',
  'R6467306',
  'R6467307',
  'R6467308',
  'R6467309',
  'R6467310',
  'R6467311',
  'S0872600',
  'S0872601',
  'S0872602',
  'S0872603',
  'S0872604',
  'S0872605',
  'S0872606',
  'S0872607',
  'S0872608',
  'S0872609',
  'S0872610',
  'S0872611',
  'S0872612',
  'S0872700',
  'S0872701',
  'S0872702',
  'S0872703',
  'S0872704',
  'S0872705',
  'S0872706',
  'S0872707',
  'S0872708',
  'S0872709',
  'S0872710',
  'S0872711',
  'S0872712',
  'S0872800',
  'S0872801',
  'S0872802',
  'S0872803',
  'S0872804',
  'S0872805',
  'S0872806',
  'S0872807',
  'S0872808',
  'S0872809',
  'S0872810',
  'S0872811',
  'S0872812',
  'S0872900',
  'S0872901',
  'S0872902',
  'S0872903',
  'S0872904',
  'S0872905',
  'S0872906',
  'S0872907',
  'S0872908',
  'S0872909',
  'S0872910',
  'S0872911',
  'S0872912',
  'S0873000',
  'S0873001',
  'S0873002',
  'S0873003',
  'S0873004',
  'S0873005',
  'S0873006',
  'S0873007',
  'S0873008',
  'S0873009',
  'S0873010',
  'S0873011',
  'S0873012',
  'S0873100',
  'S0873101',
  'S0873102',
  'S0873103',
  'S0873104',
  'S0873105',
  'S0873106',
  'S0873107',
  'S0873108',
  'S0873111',
  'S0873112',
  'S0873200',
  'S0873201',
  'S0873202',
  'S0873203',
  'S0873204',
  'S0873205',
  'S0873206',
  'S0873207',
  'S0873208',
  'S0873211',
  'S0873212',
  'S0873300',
  'S0873301',
  'S0873302',
  'S0873303',
  'S0873304',
  'S0873305',
  'S0873306',
  'S0873307',
  'S0873308',
  'S0873311',
  'S0873312',
  'S2938600',
  'S2938601',
  'S2938602',
  'S2938603',
  'S2938604',
  'S2938605',
  'S2938606',
  'S2938607',
  'S2938608',
  'S2938609',
  'S2938610',
  'S2938611',
  'S2938700',
  'S2938701',
  'S2938702',
  'S2938703',
  'S2938704',
  'S2938705',
  'S2938706',
  'S2938707',
  'S2938708',
  'S2938709',
  'S2938710',
  'S2938711',
  'S2938800',
  'S2938801',
  'S2938802',
  'S2938803',
  'S2938804',
  'S2938805',
  'S2938806',
  'S2938807',
  'S2938808',
  'S2938809',
  'S2938810',
  'S2938900',
  'S2938901',
  'S2938902',
  'S2938903',
  'S2938904',
  'S2938905',
  'S2938906',
  'S2938907',
  'S2938908',
  'S2938909',
  'S2938910',
  'S2939000',
  'S2939001',
  'S2939002',
  'S2939003',
  'S2939004',
  'S2939005',
  'S2939006',
  'S2939007',
  'S2939008',
  'S2939009',
  'S2939010',
  'S4640500',
  'S4640501',
  'S4640502',
  'S4640503',
  'S4640504',
  'S4640505',
  'S4640506',
  'S4640507',
  'S4640508',
  'S4640509',
  'S4640510',
  'S4640511',
  'S4640600',
  'S4640601',
  'S4640602',
  'S4640603',
  'S4640604',
  'S4640605',
  'S4640606',
  'S4640607',
  'S4640608',
  'S4640609',
  'S4640610',
  'S4640611',
  'S4640700',
  'S4640701',
  'S4640702',
  'S4640703',
  'S4640704',
  'S4640705',
  'S4640706',
  'S4640707',
  'S4640708',
  'S4640709',
  'S4640710',
  'S4640711',
  'S4640800',
  'S4640801',
  'S4640802',
  'S4640803',
  'S4640804',
  'S4640805',
  'S4640806',
  'S4640807',
  'S4640808',
  'S4640809',
  'S4640810',
  'S4640900',
  'S4640901',
  'S4640902',
  'S4640903',
  'S4640904',
  'S4640905',
  'S4640906',
  'S4640907',
  'S4640908',
  'S4640909',
  'S4640910',
  'S4641000',
  'S4641001',
  'S4641002',
  'S4641003',
  'S4641004',
  'S4641005',
  'S4641006',
  'S4641007',
  'S4641008',
  'S4641009',
  'S4641010',
  'S6267700',
  'S6267701',
  'S6267702',
  'S6267703',
  'S6267704',
  'S6267705',
  'S6267706',
  'S6267707',
  'S6267708',
  'S6267709',
  'S6267710',
  'S6267711',
  'S6267800',
  'S6267801',
  'S6267802',
  'S6267803',
  'S6267804',
  'S6267805',
  'S6267806',
  'S6267807',
  'S6267808',
  'S6267809',
  'S6267810',
  'S6267900',
  'S6267901',
  'S6267902',
  'S6267903',
  'S6267904',
  'S6267905',
  'S6267906',
  'S6267907',
  'S6267908',
  'S6267909',
  'S6267910',
  'S6268000',
  'S6268001',
  'S6268002',
  'S6268003',
  'S6268004',
  'S6268005',
  'S6268006',
  'S6268007',
  'S6268008',
  'S6268009',
  'S6268010',
  'S6268100',
  'S6268101',
  'S6268102',
  'S6268103',
  'S6268104',
  'S6268105',
  'S6268106',
  'S6268107',
  'S6268108',
  'S6268109',
  'S6268110',
  'S8298900',
  'S8298901',
  'S8298902',
  'S8298903',
  'S8298904',
  'S8298905',
  'S8298906',
  'S8298907',
  'S8298908',
  'S8298909',
  'S8298910',
  'S8298911',
  'S8299000',
  'S8299001',
  'S8299002',
  'S8299003',
  'S8299004',
  'S8299005',
  'S8299006',
  'S8299007',
  'S8299008',
  'S8299009',
  'S8299010',
  'S8299100',
  'S8299101',
  'S8299102',
  'S8299103',
  'S8299104',
  'S8299105',
  'S8299106',
  'S8299107',
  'S8299108',
  'S8299109',
  'S8299110',
  'S8299200',
  'S8299201',
  'S8299202',
  'S8299203',
  'S8299204',
  'S8299205',
  'S8299206',
  'S8299207',
  'S8299208',
  'S8299209',
  'S8299210',
  'S8299300',
  'S8299301',
  'S8299302',
  'S8299303',
  'S8299304',
  'S8299305',
  'S8299306',
  'S8299307',
  'S8299308',
  'S8299309',
  'S8299310',
  'S8299400',
  'S8299401',
  'S8299402',
  'S8299403',
  'S8299404',
  'S8299405',
  'S8299406',
  'S8299407',
  'S8299408',
  'S8299409',
  'S8299410',
  'T0698800',
  'T0698801',
  'T0698802',
  'T0698803',
  'T0698804',
  'T0698805',
  'T0698806',
  'T0698807',
  'T0698808',
  'T0698809',
  'T0698810',
  'T0698811',
  'T0698900',
  'T0698901',
  'T0698902',
  'T0698903',
  'T0698904',
  'T0698905',
  'T0698906',
  'T0698907',
  'T0698908',
  'T0698909',
  'T0698910',
  'T0699000',
  'T0699001',
  'T0699002',
  'T0699003',
  'T0699004',
  'T0699005',
  'T0699006',
  'T0699007',
  'T0699008',
  'T0699009',
  'T0699010',
  'T0699100',
  'T0699101',
  'T0699102',
  'T0699103',
  'T0699104',
  'T0699105',
  'T0699106',
  'T0699107',
  'T0699108',
  'T0699109',
  'T0699110',
  'T0699200',
  'T0699201',
  'T0699202',
  'T0699203',
  'T0699204',
  'T0699205',
  'T0699206',
  'T0699207',
  'T0699208',
  'T0699209',
  'T0699210',
  'T0699300',
  'T0699301',
  'T0699302',
  'T0699303',
  'T0699304',
  'T0699305',
  'T0699306',
  'T0699307',
  'T0699308',
  'T0699309',
  'T0699310',
  'T0699400',
  'T0699401',
  'T0699402',
  'T0699403',
  'T0699404',
  'T0699405',
  'T0699406',
  'T0699407',
  'T0699408',
  'T0699409',
  'T0699410',
  'T0699500',
  'T0699501',
  'T0699502',
  'T0699503',
  'T0699504',
  'T0699505',
  'T0699506',
  'T0699507',
  'T0699508',
  'T0699509',
  'T0699510',
  'T2748400',
  'T2748401',
  'T2748402',
  'T2748403',
  'T2748404',
  'T2748405',
  'T2748406',
  'T2748407',
  'T2748408',
  'T2748409',
  'T2748410',
  'T2748411',
  'T2748412',
  'T2748413',
  'T2748500',
  'T2748501',
  'T2748502',
  'T2748503',
  'T2748504',
  'T2748505',
  'T2748506',
  'T2748507',
  'T2748508',
  'T2748509',
  'T2748510',
  'T2748511',
  'T2748512',
  'T2748513',
  'T2748600',
  'T2748601',
  'T2748602',
  'T2748603',
  'T2748604',
  'T2748605',
  'T2748606',
  'T2748607',
  'T2748608',
  'T2748609',
  'T2748610',
  'T2748611',
  'T2748612',
  'T2748700',
  'T2748701',
  'T2748702',
  'T2748703',
  'T2748704',
  'T2748705',
  'T2748706',
  'T2748707',
  'T2748708',
  'T2748709',
  'T2748710',
  'T2748711',
  'T2748712',
  'T2748800',
  'T2748801',
  'T2748802',
  'T2748803',
  'T2748804',
  'T2748805',
  'T2748806',
  'T2748807',
  'T2748808',
  'T2748809',
  'T2748810',
  'T2748811',
  'T2748812',
  'T2748900',
  'T2748901',
  'T2748902',
  'T2748903',
  'T2748904',
  'T2748905',
  'T2748906',
  'T2748907',
  'T2748908',
  'T2748909',
  'T2748910',
  'T2748911',
  'T2748912',
  'T2749000',
  'T2749001',
  'T2749002',
  'T2749003',
  'T2749004',
  'T2749005',
  'T2749006',
  'T2749007',
  'T2749008',
  'T2749009',
  'T2749010',
  'T2749011',
  'T2749012',
  'T4234400',
  'T4234401',
  'T4234402',
  'T4234403',
  'T4234404',
  'T4234405',
  'T4234406',
  'T4234407',
  'T4234408',
  'T4234409',
  'T4234410',
  'T4234411',
  'T4234412',
  'T4234500',
  'T4234501',
  'T4234502',
  'T4234503',
  'T4234504',
  'T4234505',
  'T4234506',
  'T4234507',
  'T4234508',
  'T4234509',
  'T4234510',
  'T4234511',
  'T4234512',
  'T4234600',
  'T4234601',
  'T4234602',
  'T4234603',
  'T4234604',
  'T4234605',
  'T4234606',
  'T4234607',
  'T4234608',
  'T4234609',
  'T4234610',
  'T4234611',
  'T4234612',
  'T4234700',
  'T4234701',
  'T4234702',
  'T4234703',
  'T4234704',
  'T4234705',
  'T4234706',
  'T4234707',
  'T4234708',
  'T4234709',
  'T4234710',
  'T4234711',
  'T4234712',
  'T4234800',
  'T4234801',
  'T4234802',
  'T4234803',
  'T4234804',
  'T4234805',
  'T4234806',
  'T4234807',
  'T4234808',
  'T4234809',
  'T4234810',
  'T4234811',
  'T4234812',
  'T5872900',
  'T5872901',
  'T5872902',
  'T5872903',
  'T5872904',
  'T5872905',
  'T5872906',
  'T5872907',
  'T5872908',
  'T5872909',
  'T5872910',
  'T5872911',
  'T5872912',
  'T5873000',
  'T5873001',
  'T5873002',
  'T5873003',
  'T5873004',
  'T5873005',
  'T5873006',
  'T5873007',
  'T5873008',
  'T5873009',
  'T5873010',
  'T5873011',
  'T5873012',
  'T5873100',
  'T5873101',
  'T5873102',
  'T5873103',
  'T5873104',
  'T5873105',
  'T5873106',
  'T5873107',
  'T5873108',
  'T5873109',
  'T5873110',
  'T5873111',
  'T5873112',
  'T5873200',
  'T5873201',
  'T5873202',
  'T5873203',
  'T5873204',
  'T5873205',
  'T5873206',
  'T5873207',
  'T5873208',
  'T5873209',
  'T5873210',
  'T5873211',
  'T5873212',
  'T7297400',
  'T7297401',
  'T7297402',
  'T7297403',
  'T7297404',
  'T7297405',
  'T7297406',
  'T7297407',
  'T7297408',
  'T7297409',
  'T7297410',
  'T7297411',
  'T7297412',
  'T7297500',
  'T7297501',
  'T7297502',
  'T7297503',
  'T7297504',
  'T7297505',
  'T7297506',
  'T7297507',
  'T7297508',
  'T7297509',
  'T7297510',
  'T7297511',
  'T7297512',
  'T7297600',
  'T7297601',
  'T7297602',
  'T7297603',
  'T7297604',
  'T7297605',
  'T7297606',
  'T7297607',
  'T7297608',
  'T7297609',
  'T7297610',
  'T7297611',
  'T7297612',
  'T7297700',
  'T7297701',
  'T7297702',
  'T7297703',
  'T7297704',
  'T7297705',
  'T7297706',
  'T7297707',
  'T7297708',
  'T7297709',
  'T7297710',
  'T7297711',
  'T7297712',
  'T8802400',
  'T8802401',
  'T8802402',
  'T8802403',
  'T8802404',
  'T8802405',
  'T8802406',
  'T8802407',
  'T8802408',
  'T8802409',
  'T8802410',
  'T8802411',
  'T8802412',
  'T8802500',
  'T8802501',
  'T8802502',
  'T8802503',
  'T8802504',
  'T8802505',
  'T8802506',
  'T8802507',
  'T8802508',
  'T8802509',
  'T8802510',
  'T8802511',
  'T8802512',
  'T8802600',
  'T8802601',
  'T8802602',
  'T8802603',
  'T8802604',
  'T8802605',
  'T8802606',
  'T8802607',
  'T8802608',
  'T8802609',
  'T8802610',
  'T8802611',
  'T8802612',
  'T8802700',
  'T8802701',
  'T8802702',
  'T8802703',
  'T8802704',
  'T8802705',
  'T8802706',
  'T8802707',
  'T8802708',
  'T8802709',
  'T8802710',
  'T8802711',
  'T8802712',
  'T8802800',
  'T8802801',
  'T8802802',
  'T8802803',
  'T8802804',
  'T8802805',
  'T8802806',
  'T8802807',
  'T8802808',
  'T8802809',
  'T8802810',
  'T8802811',
  'T8802812',
  'T8802900',
  'T8802901',
  'T8802902',
  'T8802903',
  'T8802904',
  'T8802905',
  'T8802906',
  'T8802907',
  'T8802908',
  'T8802909',
  'T8802910',
  'T8802911',
  'T8802912',
  'T8803000',
  'T8803001',
  'T8803002',
  'T8803003',
  'T8803004',
  'T8803005',
  'T8803006',
  'T8803007',
  'T8803008',
  'T8803009',
  'T8803010',
  'T8803011',
  'T8803012',
  'U0724700',
  'U0724701',
  'U0724702',
  'U0724703',
  'U0724704',
  'U0724705',
  'U0724706',
  'U0724707',
  'U0724708',
  'U0724709',
  'U0724710',
  'U0724711',
  'U0724712',
  'U0724800',
  'U0724801',
  'U0724802',
  'U0724803',
  'U0724804',
  'U0724805',
  'U0724806',
  'U0724807',
  'U0724808',
  'U0724809',
  'U0724810',
  'U0724811',
  'U0724812',
  'U0724900',
  'U0724901',
  'U0724902',
  'U0724903',
  'U0724904',
  'U0724905',
  'U0724906',
  'U0724907',
  'U0724908',
  'U0724909',
  'U0724910',
  'U0724911',
  'U0724912',
  'U0725000',
  'U0725001',
  'U0725002',
  'U0725003',
  'U0725004',
  'U0725005',
  'U0725006',
  'U0725007',
  'U0725008',
  'U0725009',
  'U0725010',
  'U0725011',
  'U0725012',
  'U0725100',
  'U0725101',
  'U0725102',
  'U0725103',
  'U0725104',
  'U0725105',
  'U0725106',
  'U0725107',
  'U0725108',
  'U0725109',
  'U0725110',
  'U0725111',
  'U0725112',
  'U0725200',
  'U0725201',
  'U0725202',
  'U0725203',
  'U0725204',
  'U0725205',
  'U0725206',
  'U0725207',
  'U0725208',
  'U0725209',
  'U0725210',
  'U0725211',
  'U0725212',
  'U0725300',
  'U0725301',
  'U0725302',
  'U0725303',
  'U0725304',
  'U0725305',
  'U0725306',
  'U0725307',
  'U0725308',
  'U0725309',
  'U0725310',
  'U0725311',
  'U0725312',
  'U2664900',
  'U2664901',
  'U2664902',
  'U2664903',
  'U2664904',
  'U2664905',
  'U2664906',
  'U2664907',
  'U2664908',
  'U2664909',
  'U2664910',
  'U2664911',
  'U2664912',
  'U2665000',
  'U2665001',
  'U2665002',
  'U2665003',
  'U2665004',
  'U2665005',
  'U2665006',
  'U2665007',
  'U2665008',
  'U2665009',
  'U2665010',
  'U2665011',
  'U2665012',
  'U2665100',
  'U2665101',
  'U2665102',
  'U2665103',
  'U2665104',
  'U2665105',
  'U2665106',
  'U2665107',
  'U2665108',
  'U2665109',
  'U2665110',
  'U2665111',
  'U2665112',
  'U2665200',
  'U2665201',
  'U2665202',
  'U2665203',
  'U2665204',
  'U2665205',
  'U2665206',
  'U2665207',
  'U2665208',
  'U2665209',
  'U2665210',
  'U2665211',
  'U2665212',
  'U2665300',
  'U2665301',
  'U2665302',
  'U2665303',
  'U2665304',
  'U2665305',
  'U2665306',
  'U2665307',
  'U2665308',
  'U2665309',
  'U2665310',
  'U2665311',
  'U2665312',
  'U2665400',
  'U2665401',
  'U2665402',
  'U2665403',
  'U2665404',
  'U2665405',
  'U2665406',
  'U2665407',
  'U2665408',
  'U2665409',
  'U2665410',
  'U2665411',
  'U2665412',
  'U2665500',
  'U2665501',
  'U2665502',
  'U2665503',
  'U2665504',
  'U2665505',
  'U2665506',
  'U2665507',
  'U2665508',
  'U2665509',
  'U2665510',
  'U2665511',
  'U2665512',
  'U2665600',
  'U2665601',
  'U2665602',
  'U2665603',
  'U2665604',
  'U2665605',
  'U2665606',
  'U2665607',
  'U2665608',
  'U2665609',
  'U2665610',
  'U2665611',
  'U2665612',
  'U2665700',
  'U2665701',
  'U2665702',
  'U2665703',
  'U2665704',
  'U2665705',
  'U2665706',
  'U2665707',
  'U2665708',
  'U2665709',
  'U2665710',
  'U2665711',
  'U2665712')


# Handle missing values

  new_data[new_data == -1] = NA  # Refused 
  new_data[new_data == -2] = NA  # Dont know 
  new_data[new_data == -3] = NA  # Invalid missing 
  new_data[new_data == -4] = NA  # Valid missing 
  new_data[new_data == -5] = NA  # Non-interview 


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$R0000100[1.0 <= data$R0000100 & data$R0000100 <= 999.0] <- 1.0
  data$R0000100[1000.0 <= data$R0000100 & data$R0000100 <= 1999.0] <- 1000.0
  data$R0000100[2000.0 <= data$R0000100 & data$R0000100 <= 2999.0] <- 2000.0
  data$R0000100[3000.0 <= data$R0000100 & data$R0000100 <= 3999.0] <- 3000.0
  data$R0000100[4000.0 <= data$R0000100 & data$R0000100 <= 4999.0] <- 4000.0
  data$R0000100[5000.0 <= data$R0000100 & data$R0000100 <= 5999.0] <- 5000.0
  data$R0000100[6000.0 <= data$R0000100 & data$R0000100 <= 6999.0] <- 6000.0
  data$R0000100[7000.0 <= data$R0000100 & data$R0000100 <= 7999.0] <- 7000.0
  data$R0000100[8000.0 <= data$R0000100 & data$R0000100 <= 8999.0] <- 8000.0
  data$R0000100[9000.0 <= data$R0000100 & data$R0000100 <= 9999.0] <- 9000.0
  data$R0000100 <- factor(data$R0000100, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999"))
  data$R0298600 <- factor(data$R0298600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R0298601[1.0 <= data$R0298601 & data$R0298601 <= 2.0] <- 1.0
  data$R0298601 <- factor(data$R0298601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R0298602[1.0 <= data$R0298602 & data$R0298602 <= 3.0] <- 1.0
  data$R0298602 <- factor(data$R0298602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R0298603[1.0 <= data$R0298603 & data$R0298603 <= 4.0] <- 1.0
  data$R0298603 <- factor(data$R0298603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R0298604[1.0 <= data$R0298604 & data$R0298604 <= 5.0] <- 1.0
  data$R0298604 <- factor(data$R0298604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R0298605[1.0 <= data$R0298605 & data$R0298605 <= 6.0] <- 1.0
  data$R0298605 <- factor(data$R0298605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R0298606[1.0 <= data$R0298606 & data$R0298606 <= 7.0] <- 1.0
  data$R0298606 <- factor(data$R0298606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R0298607[1.0 <= data$R0298607 & data$R0298607 <= 8.0] <- 1.0
  data$R0298607 <- factor(data$R0298607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R0298608[1.0 <= data$R0298608 & data$R0298608 <= 10.0] <- 1.0
  data$R0298608 <- factor(data$R0298608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Friends, relatives helping, school related"))
  data$R0298609[1.0 <= data$R0298609 & data$R0298609 <= 11.0] <- 1.0
  data$R0298609 <- factor(data$R0298609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Nothing"))
  data$R0298610[1.0 <= data$R0298610 & data$R0298610 <= 9.0] <- 1.0
  data$R0298610 <- factor(data$R0298610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R0298700 <- factor(data$R0298700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R0298701[1.0 <= data$R0298701 & data$R0298701 <= 2.0] <- 1.0
  data$R0298701 <- factor(data$R0298701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R0298702[1.0 <= data$R0298702 & data$R0298702 <= 3.0] <- 1.0
  data$R0298702 <- factor(data$R0298702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R0298703[1.0 <= data$R0298703 & data$R0298703 <= 4.0] <- 1.0
  data$R0298703 <- factor(data$R0298703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R0298704[1.0 <= data$R0298704 & data$R0298704 <= 5.0] <- 1.0
  data$R0298704 <- factor(data$R0298704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R0298705[1.0 <= data$R0298705 & data$R0298705 <= 6.0] <- 1.0
  data$R0298705 <- factor(data$R0298705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R0298706[1.0 <= data$R0298706 & data$R0298706 <= 7.0] <- 1.0
  data$R0298706 <- factor(data$R0298706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R0298707[1.0 <= data$R0298707 & data$R0298707 <= 8.0] <- 1.0
  data$R0298707 <- factor(data$R0298707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R0298708[1.0 <= data$R0298708 & data$R0298708 <= 10.0] <- 1.0
  data$R0298708 <- factor(data$R0298708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Friends, relatives helping, school related"))
  data$R0298709[1.0 <= data$R0298709 & data$R0298709 <= 11.0] <- 1.0
  data$R0298709 <- factor(data$R0298709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Nothing"))
  data$R0298710[1.0 <= data$R0298710 & data$R0298710 <= 9.0] <- 1.0
  data$R0298710 <- factor(data$R0298710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R0298800 <- factor(data$R0298800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R0298801[1.0 <= data$R0298801 & data$R0298801 <= 2.0] <- 1.0
  data$R0298801 <- factor(data$R0298801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R0298802[1.0 <= data$R0298802 & data$R0298802 <= 3.0] <- 1.0
  data$R0298802 <- factor(data$R0298802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R0298803[1.0 <= data$R0298803 & data$R0298803 <= 4.0] <- 1.0
  data$R0298803 <- factor(data$R0298803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R0298804[1.0 <= data$R0298804 & data$R0298804 <= 5.0] <- 1.0
  data$R0298804 <- factor(data$R0298804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R0298805[1.0 <= data$R0298805 & data$R0298805 <= 6.0] <- 1.0
  data$R0298805 <- factor(data$R0298805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R0298806[1.0 <= data$R0298806 & data$R0298806 <= 7.0] <- 1.0
  data$R0298806 <- factor(data$R0298806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R0298807[1.0 <= data$R0298807 & data$R0298807 <= 8.0] <- 1.0
  data$R0298807 <- factor(data$R0298807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R0298808[1.0 <= data$R0298808 & data$R0298808 <= 10.0] <- 1.0
  data$R0298808 <- factor(data$R0298808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Friends, relatives helping, school related"))
  data$R0298809[1.0 <= data$R0298809 & data$R0298809 <= 11.0] <- 1.0
  data$R0298809 <- factor(data$R0298809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Nothing"))
  data$R0298810[1.0 <= data$R0298810 & data$R0298810 <= 9.0] <- 1.0
  data$R0298810 <- factor(data$R0298810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R0298900 <- factor(data$R0298900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R0298901[1.0 <= data$R0298901 & data$R0298901 <= 2.0] <- 1.0
  data$R0298901 <- factor(data$R0298901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R0298902[1.0 <= data$R0298902 & data$R0298902 <= 3.0] <- 1.0
  data$R0298902 <- factor(data$R0298902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R0298903[1.0 <= data$R0298903 & data$R0298903 <= 4.0] <- 1.0
  data$R0298903 <- factor(data$R0298903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R0298904[1.0 <= data$R0298904 & data$R0298904 <= 5.0] <- 1.0
  data$R0298904 <- factor(data$R0298904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R0298905[1.0 <= data$R0298905 & data$R0298905 <= 6.0] <- 1.0
  data$R0298905 <- factor(data$R0298905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R0298906[1.0 <= data$R0298906 & data$R0298906 <= 7.0] <- 1.0
  data$R0298906 <- factor(data$R0298906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R0298907[1.0 <= data$R0298907 & data$R0298907 <= 8.0] <- 1.0
  data$R0298907 <- factor(data$R0298907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R0298908[1.0 <= data$R0298908 & data$R0298908 <= 10.0] <- 1.0
  data$R0298908 <- factor(data$R0298908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Friends, relatives helping, school related"))
  data$R0298909[1.0 <= data$R0298909 & data$R0298909 <= 11.0] <- 1.0
  data$R0298909 <- factor(data$R0298909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Nothing"))
  data$R0298910[1.0 <= data$R0298910 & data$R0298910 <= 9.0] <- 1.0
  data$R0298910 <- factor(data$R0298910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R0299000 <- factor(data$R0299000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R0299001[1.0 <= data$R0299001 & data$R0299001 <= 2.0] <- 1.0
  data$R0299001 <- factor(data$R0299001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R0299002[1.0 <= data$R0299002 & data$R0299002 <= 3.0] <- 1.0
  data$R0299002 <- factor(data$R0299002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R0299003[1.0 <= data$R0299003 & data$R0299003 <= 4.0] <- 1.0
  data$R0299003 <- factor(data$R0299003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R0299004[1.0 <= data$R0299004 & data$R0299004 <= 5.0] <- 1.0
  data$R0299004 <- factor(data$R0299004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R0299005[1.0 <= data$R0299005 & data$R0299005 <= 6.0] <- 1.0
  data$R0299005 <- factor(data$R0299005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R0299006[1.0 <= data$R0299006 & data$R0299006 <= 7.0] <- 1.0
  data$R0299006 <- factor(data$R0299006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R0299007[1.0 <= data$R0299007 & data$R0299007 <= 8.0] <- 1.0
  data$R0299007 <- factor(data$R0299007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R0299008[1.0 <= data$R0299008 & data$R0299008 <= 10.0] <- 1.0
  data$R0299008 <- factor(data$R0299008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Friends, relatives helping, school related"))
  data$R0299009[1.0 <= data$R0299009 & data$R0299009 <= 11.0] <- 1.0
  data$R0299009 <- factor(data$R0299009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Nothing"))
  data$R0299010[1.0 <= data$R0299010 & data$R0299010 <= 9.0] <- 1.0
  data$R0299010 <- factor(data$R0299010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R0299100 <- factor(data$R0299100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R0299101[1.0 <= data$R0299101 & data$R0299101 <= 2.0] <- 1.0
  data$R0299101 <- factor(data$R0299101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R0299102[1.0 <= data$R0299102 & data$R0299102 <= 3.0] <- 1.0
  data$R0299102 <- factor(data$R0299102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R0299103[1.0 <= data$R0299103 & data$R0299103 <= 4.0] <- 1.0
  data$R0299103 <- factor(data$R0299103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R0299104[1.0 <= data$R0299104 & data$R0299104 <= 5.0] <- 1.0
  data$R0299104 <- factor(data$R0299104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R0299105[1.0 <= data$R0299105 & data$R0299105 <= 6.0] <- 1.0
  data$R0299105 <- factor(data$R0299105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R0299106[1.0 <= data$R0299106 & data$R0299106 <= 7.0] <- 1.0
  data$R0299106 <- factor(data$R0299106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R0299107[1.0 <= data$R0299107 & data$R0299107 <= 8.0] <- 1.0
  data$R0299107 <- factor(data$R0299107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R0299108[1.0 <= data$R0299108 & data$R0299108 <= 10.0] <- 1.0
  data$R0299108 <- factor(data$R0299108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Friends, relatives helping, school related"))
  data$R0299109[1.0 <= data$R0299109 & data$R0299109 <= 11.0] <- 1.0
  data$R0299109 <- factor(data$R0299109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Nothing"))
  data$R0299110[1.0 <= data$R0299110 & data$R0299110 <= 9.0] <- 1.0
  data$R0299110 <- factor(data$R0299110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R0536300 <- factor(data$R0536300, 
    levels=c(0.0,1.0,2.0), 
    labels=c("No Information",
      "Male",
      "Female"))
  data$R0536401 <- factor(data$R0536401, 
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0), 
    labels=c("1: January",
      "2: February",
      "3: March",
      "4: April",
      "5: May",
      "6: June",
      "7: July",
      "8: August",
      "9: September",
      "10: October",
      "11: November",
      "12: December"))
  data$R1235800 <- factor(data$R1235800, 
    levels=c(0.0,1.0), 
    labels=c("Oversample",
      "Cross-sectional"))
  data$R1482600 <- factor(data$R1482600, 
    levels=c(1.0,2.0,3.0,4.0), 
    labels=c("Black",
      "Hispanic",
      "Mixed Race (Non-Hispanic)",
      "Non-Black / Non-Hispanic"))
  data$R2129400 <- factor(data$R2129400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R2129401[1.0 <= data$R2129401 & data$R2129401 <= 2.0] <- 1.0
  data$R2129401 <- factor(data$R2129401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R2129402[1.0 <= data$R2129402 & data$R2129402 <= 3.0] <- 1.0
  data$R2129402 <- factor(data$R2129402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R2129403[1.0 <= data$R2129403 & data$R2129403 <= 4.0] <- 1.0
  data$R2129403 <- factor(data$R2129403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R2129404[1.0 <= data$R2129404 & data$R2129404 <= 5.0] <- 1.0
  data$R2129404 <- factor(data$R2129404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R2129405[1.0 <= data$R2129405 & data$R2129405 <= 6.0] <- 1.0
  data$R2129405 <- factor(data$R2129405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R2129406[1.0 <= data$R2129406 & data$R2129406 <= 7.0] <- 1.0
  data$R2129406 <- factor(data$R2129406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R2129407[1.0 <= data$R2129407 & data$R2129407 <= 8.0] <- 1.0
  data$R2129407 <- factor(data$R2129407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R2129408[1.0 <= data$R2129408 & data$R2129408 <= 9.0] <- 1.0
  data$R2129408 <- factor(data$R2129408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R2129500 <- factor(data$R2129500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R2129501[1.0 <= data$R2129501 & data$R2129501 <= 2.0] <- 1.0
  data$R2129501 <- factor(data$R2129501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R2129502[1.0 <= data$R2129502 & data$R2129502 <= 3.0] <- 1.0
  data$R2129502 <- factor(data$R2129502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R2129503[1.0 <= data$R2129503 & data$R2129503 <= 4.0] <- 1.0
  data$R2129503 <- factor(data$R2129503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R2129504[1.0 <= data$R2129504 & data$R2129504 <= 5.0] <- 1.0
  data$R2129504 <- factor(data$R2129504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R2129505[1.0 <= data$R2129505 & data$R2129505 <= 6.0] <- 1.0
  data$R2129505 <- factor(data$R2129505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R2129506[1.0 <= data$R2129506 & data$R2129506 <= 7.0] <- 1.0
  data$R2129506 <- factor(data$R2129506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R2129507[1.0 <= data$R2129507 & data$R2129507 <= 8.0] <- 1.0
  data$R2129507 <- factor(data$R2129507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R2129508[1.0 <= data$R2129508 & data$R2129508 <= 9.0] <- 1.0
  data$R2129508 <- factor(data$R2129508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R2129600 <- factor(data$R2129600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R2129601[1.0 <= data$R2129601 & data$R2129601 <= 2.0] <- 1.0
  data$R2129601 <- factor(data$R2129601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R2129602[1.0 <= data$R2129602 & data$R2129602 <= 3.0] <- 1.0
  data$R2129602 <- factor(data$R2129602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R2129603[1.0 <= data$R2129603 & data$R2129603 <= 4.0] <- 1.0
  data$R2129603 <- factor(data$R2129603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R2129604[1.0 <= data$R2129604 & data$R2129604 <= 5.0] <- 1.0
  data$R2129604 <- factor(data$R2129604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R2129605[1.0 <= data$R2129605 & data$R2129605 <= 6.0] <- 1.0
  data$R2129605 <- factor(data$R2129605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R2129606[1.0 <= data$R2129606 & data$R2129606 <= 7.0] <- 1.0
  data$R2129606 <- factor(data$R2129606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R2129607[1.0 <= data$R2129607 & data$R2129607 <= 8.0] <- 1.0
  data$R2129607 <- factor(data$R2129607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R2129608[1.0 <= data$R2129608 & data$R2129608 <= 9.0] <- 1.0
  data$R2129608 <- factor(data$R2129608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R2129700 <- factor(data$R2129700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R2129701[1.0 <= data$R2129701 & data$R2129701 <= 2.0] <- 1.0
  data$R2129701 <- factor(data$R2129701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R2129702[1.0 <= data$R2129702 & data$R2129702 <= 3.0] <- 1.0
  data$R2129702 <- factor(data$R2129702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R2129703[1.0 <= data$R2129703 & data$R2129703 <= 4.0] <- 1.0
  data$R2129703 <- factor(data$R2129703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R2129704[1.0 <= data$R2129704 & data$R2129704 <= 5.0] <- 1.0
  data$R2129704 <- factor(data$R2129704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R2129705[1.0 <= data$R2129705 & data$R2129705 <= 6.0] <- 1.0
  data$R2129705 <- factor(data$R2129705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R2129706[1.0 <= data$R2129706 & data$R2129706 <= 7.0] <- 1.0
  data$R2129706 <- factor(data$R2129706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R2129707[1.0 <= data$R2129707 & data$R2129707 <= 8.0] <- 1.0
  data$R2129707 <- factor(data$R2129707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R2129708[1.0 <= data$R2129708 & data$R2129708 <= 9.0] <- 1.0
  data$R2129708 <- factor(data$R2129708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R2129800 <- factor(data$R2129800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R2129801[1.0 <= data$R2129801 & data$R2129801 <= 2.0] <- 1.0
  data$R2129801 <- factor(data$R2129801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R2129802[1.0 <= data$R2129802 & data$R2129802 <= 3.0] <- 1.0
  data$R2129802 <- factor(data$R2129802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R2129803[1.0 <= data$R2129803 & data$R2129803 <= 4.0] <- 1.0
  data$R2129803 <- factor(data$R2129803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R2129804[1.0 <= data$R2129804 & data$R2129804 <= 5.0] <- 1.0
  data$R2129804 <- factor(data$R2129804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R2129805[1.0 <= data$R2129805 & data$R2129805 <= 6.0] <- 1.0
  data$R2129805 <- factor(data$R2129805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R2129806[1.0 <= data$R2129806 & data$R2129806 <= 7.0] <- 1.0
  data$R2129806 <- factor(data$R2129806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R2129807[1.0 <= data$R2129807 & data$R2129807 <= 8.0] <- 1.0
  data$R2129807 <- factor(data$R2129807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R2129808[1.0 <= data$R2129808 & data$R2129808 <= 9.0] <- 1.0
  data$R2129808 <- factor(data$R2129808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R2129900 <- factor(data$R2129900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employer directly"))
  data$R2129901[1.0 <= data$R2129901 & data$R2129901 <= 2.0] <- 1.0
  data$R2129901 <- factor(data$R2129901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted employment agency"))
  data$R2129902[1.0 <= data$R2129902 & data$R2129902 <= 3.0] <- 1.0
  data$R2129902 <- factor(data$R2129902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Through friends or relatives"))
  data$R2129903[1.0 <= data$R2129903 & data$R2129903 <= 4.0] <- 1.0
  data$R2129903 <- factor(data$R2129903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Contacted a school placement center"))
  data$R2129904[1.0 <= data$R2129904 & data$R2129904 <= 5.0] <- 1.0
  data$R2129904 <- factor(data$R2129904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Sent out resumes or filled out applications"))
  data$R2129905[1.0 <= data$R2129905 & data$R2129905 <= 6.0] <- 1.0
  data$R2129905 <- factor(data$R2129905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Placed an ad"))
  data$R2129906[1.0 <= data$R2129906 & data$R2129906 <= 7.0] <- 1.0
  data$R2129906 <- factor(data$R2129906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Checked union or professional registers"))
  data$R2129907[1.0 <= data$R2129907 & data$R2129907 <= 8.0] <- 1.0
  data$R2129907 <- factor(data$R2129907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Looked at ads"))
  data$R2129908[1.0 <= data$R2129908 & data$R2129908 <= 9.0] <- 1.0
  data$R2129908 <- factor(data$R2129908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER (SPECIFY)"))
  data$R3454100 <- factor(data$R3454100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R3454101[1.0 <= data$R3454101 & data$R3454101 <= 2.0] <- 1.0
  data$R3454101 <- factor(data$R3454101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R3454102[1.0 <= data$R3454102 & data$R3454102 <= 3.0] <- 1.0
  data$R3454102 <- factor(data$R3454102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R3454103[1.0 <= data$R3454103 & data$R3454103 <= 4.0] <- 1.0
  data$R3454103 <- factor(data$R3454103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R3454104[1.0 <= data$R3454104 & data$R3454104 <= 5.0] <- 1.0
  data$R3454104 <- factor(data$R3454104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R3454105[1.0 <= data$R3454105 & data$R3454105 <= 6.0] <- 1.0
  data$R3454105 <- factor(data$R3454105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R3454106[1.0 <= data$R3454106 & data$R3454106 <= 7.0] <- 1.0
  data$R3454106 <- factor(data$R3454106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R3454107[1.0 <= data$R3454107 & data$R3454107 <= 8.0] <- 1.0
  data$R3454107 <- factor(data$R3454107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R3454108[1.0 <= data$R3454108 & data$R3454108 <= 9.0] <- 1.0
  data$R3454108 <- factor(data$R3454108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R3454109[1.0 <= data$R3454109 & data$R3454109 <= 11.0] <- 1.0
  data$R3454109 <- factor(data$R3454109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Internet"))
  data$R3454110[1.0 <= data$R3454110 & data$R3454110 <= 12.0] <- 1.0
  data$R3454110 <- factor(data$R3454110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Employer contacted you directly"))
  data$R3454200 <- factor(data$R3454200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R3454201[1.0 <= data$R3454201 & data$R3454201 <= 2.0] <- 1.0
  data$R3454201 <- factor(data$R3454201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R3454202[1.0 <= data$R3454202 & data$R3454202 <= 3.0] <- 1.0
  data$R3454202 <- factor(data$R3454202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R3454203[1.0 <= data$R3454203 & data$R3454203 <= 4.0] <- 1.0
  data$R3454203 <- factor(data$R3454203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R3454204[1.0 <= data$R3454204 & data$R3454204 <= 5.0] <- 1.0
  data$R3454204 <- factor(data$R3454204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R3454205[1.0 <= data$R3454205 & data$R3454205 <= 6.0] <- 1.0
  data$R3454205 <- factor(data$R3454205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R3454206[1.0 <= data$R3454206 & data$R3454206 <= 7.0] <- 1.0
  data$R3454206 <- factor(data$R3454206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R3454207[1.0 <= data$R3454207 & data$R3454207 <= 8.0] <- 1.0
  data$R3454207 <- factor(data$R3454207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R3454208[1.0 <= data$R3454208 & data$R3454208 <= 9.0] <- 1.0
  data$R3454208 <- factor(data$R3454208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R3454209[1.0 <= data$R3454209 & data$R3454209 <= 11.0] <- 1.0
  data$R3454209 <- factor(data$R3454209, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Internet"))
  data$R3454210[1.0 <= data$R3454210 & data$R3454210 <= 12.0] <- 1.0
  data$R3454210 <- factor(data$R3454210, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Employer contacted you directly"))
  data$R3454300 <- factor(data$R3454300, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R3454301[1.0 <= data$R3454301 & data$R3454301 <= 2.0] <- 1.0
  data$R3454301 <- factor(data$R3454301, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R3454302[1.0 <= data$R3454302 & data$R3454302 <= 3.0] <- 1.0
  data$R3454302 <- factor(data$R3454302, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R3454303[1.0 <= data$R3454303 & data$R3454303 <= 4.0] <- 1.0
  data$R3454303 <- factor(data$R3454303, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R3454304[1.0 <= data$R3454304 & data$R3454304 <= 5.0] <- 1.0
  data$R3454304 <- factor(data$R3454304, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R3454305[1.0 <= data$R3454305 & data$R3454305 <= 6.0] <- 1.0
  data$R3454305 <- factor(data$R3454305, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R3454306[1.0 <= data$R3454306 & data$R3454306 <= 7.0] <- 1.0
  data$R3454306 <- factor(data$R3454306, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R3454307[1.0 <= data$R3454307 & data$R3454307 <= 8.0] <- 1.0
  data$R3454307 <- factor(data$R3454307, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R3454308[1.0 <= data$R3454308 & data$R3454308 <= 9.0] <- 1.0
  data$R3454308 <- factor(data$R3454308, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R3454309[1.0 <= data$R3454309 & data$R3454309 <= 11.0] <- 1.0
  data$R3454309 <- factor(data$R3454309, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Internet"))
  data$R3454310[1.0 <= data$R3454310 & data$R3454310 <= 12.0] <- 1.0
  data$R3454310 <- factor(data$R3454310, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Employer contacted you directly"))
  data$R3454400 <- factor(data$R3454400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R3454401[1.0 <= data$R3454401 & data$R3454401 <= 2.0] <- 1.0
  data$R3454401 <- factor(data$R3454401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R3454402[1.0 <= data$R3454402 & data$R3454402 <= 3.0] <- 1.0
  data$R3454402 <- factor(data$R3454402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R3454403[1.0 <= data$R3454403 & data$R3454403 <= 4.0] <- 1.0
  data$R3454403 <- factor(data$R3454403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R3454404[1.0 <= data$R3454404 & data$R3454404 <= 5.0] <- 1.0
  data$R3454404 <- factor(data$R3454404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R3454405[1.0 <= data$R3454405 & data$R3454405 <= 6.0] <- 1.0
  data$R3454405 <- factor(data$R3454405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R3454406[1.0 <= data$R3454406 & data$R3454406 <= 7.0] <- 1.0
  data$R3454406 <- factor(data$R3454406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R3454407[1.0 <= data$R3454407 & data$R3454407 <= 8.0] <- 1.0
  data$R3454407 <- factor(data$R3454407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R3454408[1.0 <= data$R3454408 & data$R3454408 <= 9.0] <- 1.0
  data$R3454408 <- factor(data$R3454408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R3454409[1.0 <= data$R3454409 & data$R3454409 <= 11.0] <- 1.0
  data$R3454409 <- factor(data$R3454409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Internet"))
  data$R3454410[1.0 <= data$R3454410 & data$R3454410 <= 12.0] <- 1.0
  data$R3454410 <- factor(data$R3454410, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Employer contacted you directly"))
  data$R3454500 <- factor(data$R3454500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R3454501[1.0 <= data$R3454501 & data$R3454501 <= 2.0] <- 1.0
  data$R3454501 <- factor(data$R3454501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R3454502[1.0 <= data$R3454502 & data$R3454502 <= 3.0] <- 1.0
  data$R3454502 <- factor(data$R3454502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R3454503[1.0 <= data$R3454503 & data$R3454503 <= 4.0] <- 1.0
  data$R3454503 <- factor(data$R3454503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R3454504[1.0 <= data$R3454504 & data$R3454504 <= 5.0] <- 1.0
  data$R3454504 <- factor(data$R3454504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R3454505[1.0 <= data$R3454505 & data$R3454505 <= 6.0] <- 1.0
  data$R3454505 <- factor(data$R3454505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R3454506[1.0 <= data$R3454506 & data$R3454506 <= 7.0] <- 1.0
  data$R3454506 <- factor(data$R3454506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R3454507[1.0 <= data$R3454507 & data$R3454507 <= 8.0] <- 1.0
  data$R3454507 <- factor(data$R3454507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R3454508[1.0 <= data$R3454508 & data$R3454508 <= 9.0] <- 1.0
  data$R3454508 <- factor(data$R3454508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R3454509[1.0 <= data$R3454509 & data$R3454509 <= 11.0] <- 1.0
  data$R3454509 <- factor(data$R3454509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Internet"))
  data$R3454510[1.0 <= data$R3454510 & data$R3454510 <= 12.0] <- 1.0
  data$R3454510 <- factor(data$R3454510, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Employer contacted you directly"))
  data$R4850000 <- factor(data$R4850000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R4850001[1.0 <= data$R4850001 & data$R4850001 <= 2.0] <- 1.0
  data$R4850001 <- factor(data$R4850001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R4850002[1.0 <= data$R4850002 & data$R4850002 <= 3.0] <- 1.0
  data$R4850002 <- factor(data$R4850002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R4850003[1.0 <= data$R4850003 & data$R4850003 <= 4.0] <- 1.0
  data$R4850003 <- factor(data$R4850003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R4850004[1.0 <= data$R4850004 & data$R4850004 <= 5.0] <- 1.0
  data$R4850004 <- factor(data$R4850004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R4850005[1.0 <= data$R4850005 & data$R4850005 <= 6.0] <- 1.0
  data$R4850005 <- factor(data$R4850005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R4850006[1.0 <= data$R4850006 & data$R4850006 <= 7.0] <- 1.0
  data$R4850006 <- factor(data$R4850006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R4850007[1.0 <= data$R4850007 & data$R4850007 <= 8.0] <- 1.0
  data$R4850007 <- factor(data$R4850007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R4850008[1.0 <= data$R4850008 & data$R4850008 <= 9.0] <- 1.0
  data$R4850008 <- factor(data$R4850008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R4850009[1.0 <= data$R4850009 & data$R4850009 <= 999.0] <- 1.0
  data$R4850009 <- factor(data$R4850009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R4850100 <- factor(data$R4850100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R4850101[1.0 <= data$R4850101 & data$R4850101 <= 2.0] <- 1.0
  data$R4850101 <- factor(data$R4850101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R4850102[1.0 <= data$R4850102 & data$R4850102 <= 3.0] <- 1.0
  data$R4850102 <- factor(data$R4850102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R4850103[1.0 <= data$R4850103 & data$R4850103 <= 4.0] <- 1.0
  data$R4850103 <- factor(data$R4850103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R4850104[1.0 <= data$R4850104 & data$R4850104 <= 5.0] <- 1.0
  data$R4850104 <- factor(data$R4850104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R4850105[1.0 <= data$R4850105 & data$R4850105 <= 6.0] <- 1.0
  data$R4850105 <- factor(data$R4850105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R4850106[1.0 <= data$R4850106 & data$R4850106 <= 7.0] <- 1.0
  data$R4850106 <- factor(data$R4850106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R4850107[1.0 <= data$R4850107 & data$R4850107 <= 8.0] <- 1.0
  data$R4850107 <- factor(data$R4850107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R4850108[1.0 <= data$R4850108 & data$R4850108 <= 9.0] <- 1.0
  data$R4850108 <- factor(data$R4850108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R4850109[1.0 <= data$R4850109 & data$R4850109 <= 999.0] <- 1.0
  data$R4850109 <- factor(data$R4850109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R4850200 <- factor(data$R4850200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R4850201[1.0 <= data$R4850201 & data$R4850201 <= 2.0] <- 1.0
  data$R4850201 <- factor(data$R4850201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R4850202[1.0 <= data$R4850202 & data$R4850202 <= 3.0] <- 1.0
  data$R4850202 <- factor(data$R4850202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R4850203[1.0 <= data$R4850203 & data$R4850203 <= 4.0] <- 1.0
  data$R4850203 <- factor(data$R4850203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R4850204[1.0 <= data$R4850204 & data$R4850204 <= 5.0] <- 1.0
  data$R4850204 <- factor(data$R4850204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R4850205[1.0 <= data$R4850205 & data$R4850205 <= 6.0] <- 1.0
  data$R4850205 <- factor(data$R4850205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R4850206[1.0 <= data$R4850206 & data$R4850206 <= 7.0] <- 1.0
  data$R4850206 <- factor(data$R4850206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R4850207[1.0 <= data$R4850207 & data$R4850207 <= 8.0] <- 1.0
  data$R4850207 <- factor(data$R4850207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R4850208[1.0 <= data$R4850208 & data$R4850208 <= 9.0] <- 1.0
  data$R4850208 <- factor(data$R4850208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R4850209[1.0 <= data$R4850209 & data$R4850209 <= 999.0] <- 1.0
  data$R4850209 <- factor(data$R4850209, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R4850300 <- factor(data$R4850300, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R4850301[1.0 <= data$R4850301 & data$R4850301 <= 2.0] <- 1.0
  data$R4850301 <- factor(data$R4850301, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R4850302[1.0 <= data$R4850302 & data$R4850302 <= 3.0] <- 1.0
  data$R4850302 <- factor(data$R4850302, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R4850303[1.0 <= data$R4850303 & data$R4850303 <= 4.0] <- 1.0
  data$R4850303 <- factor(data$R4850303, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R4850304[1.0 <= data$R4850304 & data$R4850304 <= 5.0] <- 1.0
  data$R4850304 <- factor(data$R4850304, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R4850305[1.0 <= data$R4850305 & data$R4850305 <= 6.0] <- 1.0
  data$R4850305 <- factor(data$R4850305, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R4850306[1.0 <= data$R4850306 & data$R4850306 <= 7.0] <- 1.0
  data$R4850306 <- factor(data$R4850306, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R4850307[1.0 <= data$R4850307 & data$R4850307 <= 8.0] <- 1.0
  data$R4850307 <- factor(data$R4850307, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R4850308[1.0 <= data$R4850308 & data$R4850308 <= 9.0] <- 1.0
  data$R4850308 <- factor(data$R4850308, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R4850309[1.0 <= data$R4850309 & data$R4850309 <= 999.0] <- 1.0
  data$R4850309 <- factor(data$R4850309, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R4850400 <- factor(data$R4850400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R4850401[1.0 <= data$R4850401 & data$R4850401 <= 2.0] <- 1.0
  data$R4850401 <- factor(data$R4850401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R4850402[1.0 <= data$R4850402 & data$R4850402 <= 3.0] <- 1.0
  data$R4850402 <- factor(data$R4850402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R4850403[1.0 <= data$R4850403 & data$R4850403 <= 4.0] <- 1.0
  data$R4850403 <- factor(data$R4850403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R4850404[1.0 <= data$R4850404 & data$R4850404 <= 5.0] <- 1.0
  data$R4850404 <- factor(data$R4850404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R4850405[1.0 <= data$R4850405 & data$R4850405 <= 6.0] <- 1.0
  data$R4850405 <- factor(data$R4850405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R4850406[1.0 <= data$R4850406 & data$R4850406 <= 7.0] <- 1.0
  data$R4850406 <- factor(data$R4850406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R4850407[1.0 <= data$R4850407 & data$R4850407 <= 8.0] <- 1.0
  data$R4850407 <- factor(data$R4850407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R4850408[1.0 <= data$R4850408 & data$R4850408 <= 9.0] <- 1.0
  data$R4850408 <- factor(data$R4850408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R4850409[1.0 <= data$R4850409 & data$R4850409 <= 999.0] <- 1.0
  data$R4850409 <- factor(data$R4850409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R4850500 <- factor(data$R4850500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R4850501[1.0 <= data$R4850501 & data$R4850501 <= 2.0] <- 1.0
  data$R4850501 <- factor(data$R4850501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R4850502[1.0 <= data$R4850502 & data$R4850502 <= 3.0] <- 1.0
  data$R4850502 <- factor(data$R4850502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R4850503[1.0 <= data$R4850503 & data$R4850503 <= 4.0] <- 1.0
  data$R4850503 <- factor(data$R4850503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R4850504[1.0 <= data$R4850504 & data$R4850504 <= 5.0] <- 1.0
  data$R4850504 <- factor(data$R4850504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R4850505[1.0 <= data$R4850505 & data$R4850505 <= 6.0] <- 1.0
  data$R4850505 <- factor(data$R4850505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R4850506[1.0 <= data$R4850506 & data$R4850506 <= 7.0] <- 1.0
  data$R4850506 <- factor(data$R4850506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R4850507[1.0 <= data$R4850507 & data$R4850507 <= 8.0] <- 1.0
  data$R4850507 <- factor(data$R4850507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R4850508[1.0 <= data$R4850508 & data$R4850508 <= 9.0] <- 1.0
  data$R4850508 <- factor(data$R4850508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R4850509[1.0 <= data$R4850509 & data$R4850509 <= 999.0] <- 1.0
  data$R4850509 <- factor(data$R4850509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R4850600 <- factor(data$R4850600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R4850601[1.0 <= data$R4850601 & data$R4850601 <= 2.0] <- 1.0
  data$R4850601 <- factor(data$R4850601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R4850602[1.0 <= data$R4850602 & data$R4850602 <= 3.0] <- 1.0
  data$R4850602 <- factor(data$R4850602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R4850603[1.0 <= data$R4850603 & data$R4850603 <= 4.0] <- 1.0
  data$R4850603 <- factor(data$R4850603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R4850604[1.0 <= data$R4850604 & data$R4850604 <= 5.0] <- 1.0
  data$R4850604 <- factor(data$R4850604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R4850605[1.0 <= data$R4850605 & data$R4850605 <= 6.0] <- 1.0
  data$R4850605 <- factor(data$R4850605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R4850606[1.0 <= data$R4850606 & data$R4850606 <= 7.0] <- 1.0
  data$R4850606 <- factor(data$R4850606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R4850607[1.0 <= data$R4850607 & data$R4850607 <= 8.0] <- 1.0
  data$R4850607 <- factor(data$R4850607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R4850608[1.0 <= data$R4850608 & data$R4850608 <= 9.0] <- 1.0
  data$R4850608 <- factor(data$R4850608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R4850609[1.0 <= data$R4850609 & data$R4850609 <= 999.0] <- 1.0
  data$R4850609 <- factor(data$R4850609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R4850700 <- factor(data$R4850700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R4850701[1.0 <= data$R4850701 & data$R4850701 <= 2.0] <- 1.0
  data$R4850701 <- factor(data$R4850701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R4850702[1.0 <= data$R4850702 & data$R4850702 <= 3.0] <- 1.0
  data$R4850702 <- factor(data$R4850702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R4850703[1.0 <= data$R4850703 & data$R4850703 <= 4.0] <- 1.0
  data$R4850703 <- factor(data$R4850703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R4850704[1.0 <= data$R4850704 & data$R4850704 <= 5.0] <- 1.0
  data$R4850704 <- factor(data$R4850704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R4850705[1.0 <= data$R4850705 & data$R4850705 <= 6.0] <- 1.0
  data$R4850705 <- factor(data$R4850705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R4850706[1.0 <= data$R4850706 & data$R4850706 <= 7.0] <- 1.0
  data$R4850706 <- factor(data$R4850706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R4850707[1.0 <= data$R4850707 & data$R4850707 <= 8.0] <- 1.0
  data$R4850707 <- factor(data$R4850707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R4850708[1.0 <= data$R4850708 & data$R4850708 <= 9.0] <- 1.0
  data$R4850708 <- factor(data$R4850708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$R4850709[1.0 <= data$R4850709 & data$R4850709 <= 999.0] <- 1.0
  data$R4850709 <- factor(data$R4850709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R6466800 <- factor(data$R6466800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R6466801[1.0 <= data$R6466801 & data$R6466801 <= 2.0] <- 1.0
  data$R6466801 <- factor(data$R6466801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R6466802[1.0 <= data$R6466802 & data$R6466802 <= 3.0] <- 1.0
  data$R6466802 <- factor(data$R6466802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R6466803[1.0 <= data$R6466803 & data$R6466803 <= 4.0] <- 1.0
  data$R6466803 <- factor(data$R6466803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R6466804[1.0 <= data$R6466804 & data$R6466804 <= 5.0] <- 1.0
  data$R6466804 <- factor(data$R6466804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R6466805[1.0 <= data$R6466805 & data$R6466805 <= 6.0] <- 1.0
  data$R6466805 <- factor(data$R6466805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R6466806[1.0 <= data$R6466806 & data$R6466806 <= 7.0] <- 1.0
  data$R6466806 <- factor(data$R6466806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R6466807[1.0 <= data$R6466807 & data$R6466807 <= 8.0] <- 1.0
  data$R6466807 <- factor(data$R6466807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R6466808[1.0 <= data$R6466808 & data$R6466808 <= 11.0] <- 1.0
  data$R6466808 <- factor(data$R6466808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. Attended Job Fair"))
  data$R6466809[1.0 <= data$R6466809 & data$R6466809 <= 12.0] <- 1.0
  data$R6466809 <- factor(data$R6466809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "10. Searched on the Internet/ On-line"))
  data$R6466810[1.0 <= data$R6466810 & data$R6466810 <= 9.0] <- 1.0
  data$R6466810 <- factor(data$R6466810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. OTHER (SPECIFY)"))
  data$R6466811[1.0 <= data$R6466811 & data$R6466811 <= 999.0] <- 1.0
  data$R6466811 <- factor(data$R6466811, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R6466900 <- factor(data$R6466900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R6466901[1.0 <= data$R6466901 & data$R6466901 <= 2.0] <- 1.0
  data$R6466901 <- factor(data$R6466901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R6466902[1.0 <= data$R6466902 & data$R6466902 <= 3.0] <- 1.0
  data$R6466902 <- factor(data$R6466902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R6466903[1.0 <= data$R6466903 & data$R6466903 <= 4.0] <- 1.0
  data$R6466903 <- factor(data$R6466903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R6466904[1.0 <= data$R6466904 & data$R6466904 <= 5.0] <- 1.0
  data$R6466904 <- factor(data$R6466904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R6466905[1.0 <= data$R6466905 & data$R6466905 <= 6.0] <- 1.0
  data$R6466905 <- factor(data$R6466905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R6466906[1.0 <= data$R6466906 & data$R6466906 <= 7.0] <- 1.0
  data$R6466906 <- factor(data$R6466906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R6466907[1.0 <= data$R6466907 & data$R6466907 <= 8.0] <- 1.0
  data$R6466907 <- factor(data$R6466907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R6466908[1.0 <= data$R6466908 & data$R6466908 <= 11.0] <- 1.0
  data$R6466908 <- factor(data$R6466908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. Attended Job Fair"))
  data$R6466909[1.0 <= data$R6466909 & data$R6466909 <= 12.0] <- 1.0
  data$R6466909 <- factor(data$R6466909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "10. Searched on the Internet/ On-line"))
  data$R6466910[1.0 <= data$R6466910 & data$R6466910 <= 9.0] <- 1.0
  data$R6466910 <- factor(data$R6466910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. OTHER (SPECIFY)"))
  data$R6466911[1.0 <= data$R6466911 & data$R6466911 <= 999.0] <- 1.0
  data$R6466911 <- factor(data$R6466911, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R6467000 <- factor(data$R6467000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R6467001[1.0 <= data$R6467001 & data$R6467001 <= 2.0] <- 1.0
  data$R6467001 <- factor(data$R6467001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R6467002[1.0 <= data$R6467002 & data$R6467002 <= 3.0] <- 1.0
  data$R6467002 <- factor(data$R6467002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R6467003[1.0 <= data$R6467003 & data$R6467003 <= 4.0] <- 1.0
  data$R6467003 <- factor(data$R6467003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R6467004[1.0 <= data$R6467004 & data$R6467004 <= 5.0] <- 1.0
  data$R6467004 <- factor(data$R6467004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R6467005[1.0 <= data$R6467005 & data$R6467005 <= 6.0] <- 1.0
  data$R6467005 <- factor(data$R6467005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R6467006[1.0 <= data$R6467006 & data$R6467006 <= 7.0] <- 1.0
  data$R6467006 <- factor(data$R6467006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R6467007[1.0 <= data$R6467007 & data$R6467007 <= 8.0] <- 1.0
  data$R6467007 <- factor(data$R6467007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R6467008[1.0 <= data$R6467008 & data$R6467008 <= 11.0] <- 1.0
  data$R6467008 <- factor(data$R6467008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. Attended Job Fair"))
  data$R6467009[1.0 <= data$R6467009 & data$R6467009 <= 12.0] <- 1.0
  data$R6467009 <- factor(data$R6467009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "10. Searched on the Internet/ On-line"))
  data$R6467010[1.0 <= data$R6467010 & data$R6467010 <= 9.0] <- 1.0
  data$R6467010 <- factor(data$R6467010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. OTHER (SPECIFY)"))
  data$R6467011[1.0 <= data$R6467011 & data$R6467011 <= 999.0] <- 1.0
  data$R6467011 <- factor(data$R6467011, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R6467100 <- factor(data$R6467100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R6467101[1.0 <= data$R6467101 & data$R6467101 <= 2.0] <- 1.0
  data$R6467101 <- factor(data$R6467101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R6467102[1.0 <= data$R6467102 & data$R6467102 <= 3.0] <- 1.0
  data$R6467102 <- factor(data$R6467102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R6467103[1.0 <= data$R6467103 & data$R6467103 <= 4.0] <- 1.0
  data$R6467103 <- factor(data$R6467103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R6467104[1.0 <= data$R6467104 & data$R6467104 <= 5.0] <- 1.0
  data$R6467104 <- factor(data$R6467104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R6467105[1.0 <= data$R6467105 & data$R6467105 <= 6.0] <- 1.0
  data$R6467105 <- factor(data$R6467105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R6467106[1.0 <= data$R6467106 & data$R6467106 <= 7.0] <- 1.0
  data$R6467106 <- factor(data$R6467106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R6467107[1.0 <= data$R6467107 & data$R6467107 <= 8.0] <- 1.0
  data$R6467107 <- factor(data$R6467107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R6467108[1.0 <= data$R6467108 & data$R6467108 <= 11.0] <- 1.0
  data$R6467108 <- factor(data$R6467108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. Attended Job Fair"))
  data$R6467109[1.0 <= data$R6467109 & data$R6467109 <= 12.0] <- 1.0
  data$R6467109 <- factor(data$R6467109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "10. Searched on the Internet/ On-line"))
  data$R6467110[1.0 <= data$R6467110 & data$R6467110 <= 9.0] <- 1.0
  data$R6467110 <- factor(data$R6467110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. OTHER (SPECIFY)"))
  data$R6467111[1.0 <= data$R6467111 & data$R6467111 <= 999.0] <- 1.0
  data$R6467111 <- factor(data$R6467111, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R6467200 <- factor(data$R6467200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R6467201[1.0 <= data$R6467201 & data$R6467201 <= 2.0] <- 1.0
  data$R6467201 <- factor(data$R6467201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R6467202[1.0 <= data$R6467202 & data$R6467202 <= 3.0] <- 1.0
  data$R6467202 <- factor(data$R6467202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R6467203[1.0 <= data$R6467203 & data$R6467203 <= 4.0] <- 1.0
  data$R6467203 <- factor(data$R6467203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R6467204[1.0 <= data$R6467204 & data$R6467204 <= 5.0] <- 1.0
  data$R6467204 <- factor(data$R6467204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R6467205[1.0 <= data$R6467205 & data$R6467205 <= 6.0] <- 1.0
  data$R6467205 <- factor(data$R6467205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R6467206[1.0 <= data$R6467206 & data$R6467206 <= 7.0] <- 1.0
  data$R6467206 <- factor(data$R6467206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R6467207[1.0 <= data$R6467207 & data$R6467207 <= 8.0] <- 1.0
  data$R6467207 <- factor(data$R6467207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R6467208[1.0 <= data$R6467208 & data$R6467208 <= 11.0] <- 1.0
  data$R6467208 <- factor(data$R6467208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. Attended Job Fair"))
  data$R6467209[1.0 <= data$R6467209 & data$R6467209 <= 12.0] <- 1.0
  data$R6467209 <- factor(data$R6467209, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "10. Searched on the Internet/ On-line"))
  data$R6467210[1.0 <= data$R6467210 & data$R6467210 <= 9.0] <- 1.0
  data$R6467210 <- factor(data$R6467210, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. OTHER (SPECIFY)"))
  data$R6467211[1.0 <= data$R6467211 & data$R6467211 <= 999.0] <- 1.0
  data$R6467211 <- factor(data$R6467211, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$R6467300 <- factor(data$R6467300, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$R6467301[1.0 <= data$R6467301 & data$R6467301 <= 2.0] <- 1.0
  data$R6467301 <- factor(data$R6467301, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$R6467302[1.0 <= data$R6467302 & data$R6467302 <= 3.0] <- 1.0
  data$R6467302 <- factor(data$R6467302, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$R6467303[1.0 <= data$R6467303 & data$R6467303 <= 4.0] <- 1.0
  data$R6467303 <- factor(data$R6467303, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$R6467304[1.0 <= data$R6467304 & data$R6467304 <= 5.0] <- 1.0
  data$R6467304 <- factor(data$R6467304, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$R6467305[1.0 <= data$R6467305 & data$R6467305 <= 6.0] <- 1.0
  data$R6467305 <- factor(data$R6467305, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$R6467306[1.0 <= data$R6467306 & data$R6467306 <= 7.0] <- 1.0
  data$R6467306 <- factor(data$R6467306, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$R6467307[1.0 <= data$R6467307 & data$R6467307 <= 8.0] <- 1.0
  data$R6467307 <- factor(data$R6467307, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$R6467308[1.0 <= data$R6467308 & data$R6467308 <= 11.0] <- 1.0
  data$R6467308 <- factor(data$R6467308, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. Attended Job Fair"))
  data$R6467309[1.0 <= data$R6467309 & data$R6467309 <= 12.0] <- 1.0
  data$R6467309 <- factor(data$R6467309, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "10. Searched on the Internet/ On-line"))
  data$R6467310[1.0 <= data$R6467310 & data$R6467310 <= 9.0] <- 1.0
  data$R6467310 <- factor(data$R6467310, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. OTHER (SPECIFY)"))
  data$R6467311[1.0 <= data$R6467311 & data$R6467311 <= 999.0] <- 1.0
  data$R6467311 <- factor(data$R6467311, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S0872600 <- factor(data$S0872600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S0872601[1.0 <= data$S0872601 & data$S0872601 <= 2.0] <- 1.0
  data$S0872601 <- factor(data$S0872601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S0872602[1.0 <= data$S0872602 & data$S0872602 <= 3.0] <- 1.0
  data$S0872602 <- factor(data$S0872602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S0872603[1.0 <= data$S0872603 & data$S0872603 <= 4.0] <- 1.0
  data$S0872603 <- factor(data$S0872603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S0872604[1.0 <= data$S0872604 & data$S0872604 <= 5.0] <- 1.0
  data$S0872604 <- factor(data$S0872604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S0872605[1.0 <= data$S0872605 & data$S0872605 <= 6.0] <- 1.0
  data$S0872605 <- factor(data$S0872605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S0872606[1.0 <= data$S0872606 & data$S0872606 <= 7.0] <- 1.0
  data$S0872606 <- factor(data$S0872606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S0872607[1.0 <= data$S0872607 & data$S0872607 <= 8.0] <- 1.0
  data$S0872607 <- factor(data$S0872607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S0872608[1.0 <= data$S0872608 & data$S0872608 <= 9.0] <- 1.0
  data$S0872608 <- factor(data$S0872608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S0872609[1.0 <= data$S0872609 & data$S0872609 <= 11.0] <- 1.0
  data$S0872609 <- factor(data$S0872609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Attended Job Fair"))
  data$S0872610[1.0 <= data$S0872610 & data$S0872610 <= 12.0] <- 1.0
  data$S0872610 <- factor(data$S0872610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Searched on the internet/online"))
  data$S0872611[1.0 <= data$S0872611 & data$S0872611 <= 995.0] <- 1.0
  data$S0872611 <- factor(data$S0872611, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$S0872612[1.0 <= data$S0872612 & data$S0872612 <= 999.0] <- 1.0
  data$S0872612 <- factor(data$S0872612, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S0872700 <- factor(data$S0872700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S0872701[1.0 <= data$S0872701 & data$S0872701 <= 2.0] <- 1.0
  data$S0872701 <- factor(data$S0872701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S0872702[1.0 <= data$S0872702 & data$S0872702 <= 3.0] <- 1.0
  data$S0872702 <- factor(data$S0872702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S0872703[1.0 <= data$S0872703 & data$S0872703 <= 4.0] <- 1.0
  data$S0872703 <- factor(data$S0872703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S0872704[1.0 <= data$S0872704 & data$S0872704 <= 5.0] <- 1.0
  data$S0872704 <- factor(data$S0872704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S0872705[1.0 <= data$S0872705 & data$S0872705 <= 6.0] <- 1.0
  data$S0872705 <- factor(data$S0872705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S0872706[1.0 <= data$S0872706 & data$S0872706 <= 7.0] <- 1.0
  data$S0872706 <- factor(data$S0872706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S0872707[1.0 <= data$S0872707 & data$S0872707 <= 8.0] <- 1.0
  data$S0872707 <- factor(data$S0872707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S0872708[1.0 <= data$S0872708 & data$S0872708 <= 9.0] <- 1.0
  data$S0872708 <- factor(data$S0872708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S0872709[1.0 <= data$S0872709 & data$S0872709 <= 11.0] <- 1.0
  data$S0872709 <- factor(data$S0872709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Attended Job Fair"))
  data$S0872710[1.0 <= data$S0872710 & data$S0872710 <= 12.0] <- 1.0
  data$S0872710 <- factor(data$S0872710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Searched on the internet/online"))
  data$S0872711[1.0 <= data$S0872711 & data$S0872711 <= 995.0] <- 1.0
  data$S0872711 <- factor(data$S0872711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$S0872712[1.0 <= data$S0872712 & data$S0872712 <= 999.0] <- 1.0
  data$S0872712 <- factor(data$S0872712, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S0872800 <- factor(data$S0872800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S0872801[1.0 <= data$S0872801 & data$S0872801 <= 2.0] <- 1.0
  data$S0872801 <- factor(data$S0872801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S0872802[1.0 <= data$S0872802 & data$S0872802 <= 3.0] <- 1.0
  data$S0872802 <- factor(data$S0872802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S0872803[1.0 <= data$S0872803 & data$S0872803 <= 4.0] <- 1.0
  data$S0872803 <- factor(data$S0872803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S0872804[1.0 <= data$S0872804 & data$S0872804 <= 5.0] <- 1.0
  data$S0872804 <- factor(data$S0872804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S0872805[1.0 <= data$S0872805 & data$S0872805 <= 6.0] <- 1.0
  data$S0872805 <- factor(data$S0872805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S0872806[1.0 <= data$S0872806 & data$S0872806 <= 7.0] <- 1.0
  data$S0872806 <- factor(data$S0872806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S0872807[1.0 <= data$S0872807 & data$S0872807 <= 8.0] <- 1.0
  data$S0872807 <- factor(data$S0872807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S0872808[1.0 <= data$S0872808 & data$S0872808 <= 9.0] <- 1.0
  data$S0872808 <- factor(data$S0872808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S0872809[1.0 <= data$S0872809 & data$S0872809 <= 11.0] <- 1.0
  data$S0872809 <- factor(data$S0872809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Attended Job Fair"))
  data$S0872810[1.0 <= data$S0872810 & data$S0872810 <= 12.0] <- 1.0
  data$S0872810 <- factor(data$S0872810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Searched on the internet/online"))
  data$S0872811[1.0 <= data$S0872811 & data$S0872811 <= 995.0] <- 1.0
  data$S0872811 <- factor(data$S0872811, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$S0872812[1.0 <= data$S0872812 & data$S0872812 <= 999.0] <- 1.0
  data$S0872812 <- factor(data$S0872812, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S0872900 <- factor(data$S0872900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S0872901[1.0 <= data$S0872901 & data$S0872901 <= 2.0] <- 1.0
  data$S0872901 <- factor(data$S0872901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S0872902[1.0 <= data$S0872902 & data$S0872902 <= 3.0] <- 1.0
  data$S0872902 <- factor(data$S0872902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S0872903[1.0 <= data$S0872903 & data$S0872903 <= 4.0] <- 1.0
  data$S0872903 <- factor(data$S0872903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S0872904[1.0 <= data$S0872904 & data$S0872904 <= 5.0] <- 1.0
  data$S0872904 <- factor(data$S0872904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S0872905[1.0 <= data$S0872905 & data$S0872905 <= 6.0] <- 1.0
  data$S0872905 <- factor(data$S0872905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S0872906[1.0 <= data$S0872906 & data$S0872906 <= 7.0] <- 1.0
  data$S0872906 <- factor(data$S0872906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S0872907[1.0 <= data$S0872907 & data$S0872907 <= 8.0] <- 1.0
  data$S0872907 <- factor(data$S0872907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S0872908[1.0 <= data$S0872908 & data$S0872908 <= 9.0] <- 1.0
  data$S0872908 <- factor(data$S0872908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S0872909[1.0 <= data$S0872909 & data$S0872909 <= 11.0] <- 1.0
  data$S0872909 <- factor(data$S0872909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Attended Job Fair"))
  data$S0872910[1.0 <= data$S0872910 & data$S0872910 <= 12.0] <- 1.0
  data$S0872910 <- factor(data$S0872910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Searched on the internet/online"))
  data$S0872911[1.0 <= data$S0872911 & data$S0872911 <= 995.0] <- 1.0
  data$S0872911 <- factor(data$S0872911, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$S0872912[1.0 <= data$S0872912 & data$S0872912 <= 999.0] <- 1.0
  data$S0872912 <- factor(data$S0872912, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S0873000 <- factor(data$S0873000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S0873001[1.0 <= data$S0873001 & data$S0873001 <= 2.0] <- 1.0
  data$S0873001 <- factor(data$S0873001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S0873002[1.0 <= data$S0873002 & data$S0873002 <= 3.0] <- 1.0
  data$S0873002 <- factor(data$S0873002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S0873003[1.0 <= data$S0873003 & data$S0873003 <= 4.0] <- 1.0
  data$S0873003 <- factor(data$S0873003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S0873004[1.0 <= data$S0873004 & data$S0873004 <= 5.0] <- 1.0
  data$S0873004 <- factor(data$S0873004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S0873005[1.0 <= data$S0873005 & data$S0873005 <= 6.0] <- 1.0
  data$S0873005 <- factor(data$S0873005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S0873006[1.0 <= data$S0873006 & data$S0873006 <= 7.0] <- 1.0
  data$S0873006 <- factor(data$S0873006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S0873007[1.0 <= data$S0873007 & data$S0873007 <= 8.0] <- 1.0
  data$S0873007 <- factor(data$S0873007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S0873008[1.0 <= data$S0873008 & data$S0873008 <= 9.0] <- 1.0
  data$S0873008 <- factor(data$S0873008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S0873009[1.0 <= data$S0873009 & data$S0873009 <= 11.0] <- 1.0
  data$S0873009 <- factor(data$S0873009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Attended Job Fair"))
  data$S0873010[1.0 <= data$S0873010 & data$S0873010 <= 12.0] <- 1.0
  data$S0873010 <- factor(data$S0873010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "Searched on the internet/online"))
  data$S0873011[1.0 <= data$S0873011 & data$S0873011 <= 995.0] <- 1.0
  data$S0873011 <- factor(data$S0873011, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$S0873012[1.0 <= data$S0873012 & data$S0873012 <= 999.0] <- 1.0
  data$S0873012 <- factor(data$S0873012, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S0873100 <- factor(data$S0873100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S0873101[1.0 <= data$S0873101 & data$S0873101 <= 2.0] <- 1.0
  data$S0873101 <- factor(data$S0873101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S0873102[1.0 <= data$S0873102 & data$S0873102 <= 3.0] <- 1.0
  data$S0873102 <- factor(data$S0873102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S0873103[1.0 <= data$S0873103 & data$S0873103 <= 4.0] <- 1.0
  data$S0873103 <- factor(data$S0873103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S0873104[1.0 <= data$S0873104 & data$S0873104 <= 5.0] <- 1.0
  data$S0873104 <- factor(data$S0873104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S0873105[1.0 <= data$S0873105 & data$S0873105 <= 6.0] <- 1.0
  data$S0873105 <- factor(data$S0873105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S0873106[1.0 <= data$S0873106 & data$S0873106 <= 7.0] <- 1.0
  data$S0873106 <- factor(data$S0873106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S0873107[1.0 <= data$S0873107 & data$S0873107 <= 8.0] <- 1.0
  data$S0873107 <- factor(data$S0873107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S0873108[1.0 <= data$S0873108 & data$S0873108 <= 9.0] <- 1.0
  data$S0873108 <- factor(data$S0873108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S0873111[1.0 <= data$S0873111 & data$S0873111 <= 995.0] <- 1.0
  data$S0873111 <- factor(data$S0873111, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$S0873112[1.0 <= data$S0873112 & data$S0873112 <= 999.0] <- 1.0
  data$S0873112 <- factor(data$S0873112, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S0873200 <- factor(data$S0873200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S0873201[1.0 <= data$S0873201 & data$S0873201 <= 2.0] <- 1.0
  data$S0873201 <- factor(data$S0873201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S0873202[1.0 <= data$S0873202 & data$S0873202 <= 3.0] <- 1.0
  data$S0873202 <- factor(data$S0873202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S0873203[1.0 <= data$S0873203 & data$S0873203 <= 4.0] <- 1.0
  data$S0873203 <- factor(data$S0873203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S0873204[1.0 <= data$S0873204 & data$S0873204 <= 5.0] <- 1.0
  data$S0873204 <- factor(data$S0873204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S0873205[1.0 <= data$S0873205 & data$S0873205 <= 6.0] <- 1.0
  data$S0873205 <- factor(data$S0873205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S0873206[1.0 <= data$S0873206 & data$S0873206 <= 7.0] <- 1.0
  data$S0873206 <- factor(data$S0873206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S0873207[1.0 <= data$S0873207 & data$S0873207 <= 8.0] <- 1.0
  data$S0873207 <- factor(data$S0873207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S0873208[1.0 <= data$S0873208 & data$S0873208 <= 9.0] <- 1.0
  data$S0873208 <- factor(data$S0873208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S0873211[1.0 <= data$S0873211 & data$S0873211 <= 995.0] <- 1.0
  data$S0873211 <- factor(data$S0873211, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$S0873212[1.0 <= data$S0873212 & data$S0873212 <= 999.0] <- 1.0
  data$S0873212 <- factor(data$S0873212, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S0873300 <- factor(data$S0873300, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S0873301[1.0 <= data$S0873301 & data$S0873301 <= 2.0] <- 1.0
  data$S0873301 <- factor(data$S0873301, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S0873302[1.0 <= data$S0873302 & data$S0873302 <= 3.0] <- 1.0
  data$S0873302 <- factor(data$S0873302, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S0873303[1.0 <= data$S0873303 & data$S0873303 <= 4.0] <- 1.0
  data$S0873303 <- factor(data$S0873303, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S0873304[1.0 <= data$S0873304 & data$S0873304 <= 5.0] <- 1.0
  data$S0873304 <- factor(data$S0873304, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S0873305[1.0 <= data$S0873305 & data$S0873305 <= 6.0] <- 1.0
  data$S0873305 <- factor(data$S0873305, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S0873306[1.0 <= data$S0873306 & data$S0873306 <= 7.0] <- 1.0
  data$S0873306 <- factor(data$S0873306, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S0873307[1.0 <= data$S0873307 & data$S0873307 <= 8.0] <- 1.0
  data$S0873307 <- factor(data$S0873307, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S0873308[1.0 <= data$S0873308 & data$S0873308 <= 9.0] <- 1.0
  data$S0873308 <- factor(data$S0873308, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S0873311[1.0 <= data$S0873311 & data$S0873311 <= 995.0] <- 1.0
  data$S0873311 <- factor(data$S0873311, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$S0873312[1.0 <= data$S0873312 & data$S0873312 <= 999.0] <- 1.0
  data$S0873312 <- factor(data$S0873312, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S2938600 <- factor(data$S2938600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S2938601[1.0 <= data$S2938601 & data$S2938601 <= 2.0] <- 1.0
  data$S2938601 <- factor(data$S2938601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S2938602[1.0 <= data$S2938602 & data$S2938602 <= 3.0] <- 1.0
  data$S2938602 <- factor(data$S2938602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S2938603[1.0 <= data$S2938603 & data$S2938603 <= 4.0] <- 1.0
  data$S2938603 <- factor(data$S2938603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S2938604[1.0 <= data$S2938604 & data$S2938604 <= 5.0] <- 1.0
  data$S2938604 <- factor(data$S2938604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S2938605[1.0 <= data$S2938605 & data$S2938605 <= 6.0] <- 1.0
  data$S2938605 <- factor(data$S2938605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S2938606[1.0 <= data$S2938606 & data$S2938606 <= 7.0] <- 1.0
  data$S2938606 <- factor(data$S2938606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S2938607[1.0 <= data$S2938607 & data$S2938607 <= 8.0] <- 1.0
  data$S2938607 <- factor(data$S2938607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S2938608[1.0 <= data$S2938608 & data$S2938608 <= 11.0] <- 1.0
  data$S2938608 <- factor(data$S2938608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job fair"))
  data$S2938609[1.0 <= data$S2938609 & data$S2938609 <= 12.0] <- 1.0
  data$S2938609 <- factor(data$S2938609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched on the internet/online"))
  data$S2938610[1.0 <= data$S2938610 & data$S2938610 <= 9.0] <- 1.0
  data$S2938610 <- factor(data$S2938610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S2938611[1.0 <= data$S2938611 & data$S2938611 <= 999.0] <- 1.0
  data$S2938611 <- factor(data$S2938611, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S2938700 <- factor(data$S2938700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S2938701[1.0 <= data$S2938701 & data$S2938701 <= 2.0] <- 1.0
  data$S2938701 <- factor(data$S2938701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S2938702[1.0 <= data$S2938702 & data$S2938702 <= 3.0] <- 1.0
  data$S2938702 <- factor(data$S2938702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S2938703[1.0 <= data$S2938703 & data$S2938703 <= 4.0] <- 1.0
  data$S2938703 <- factor(data$S2938703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S2938704[1.0 <= data$S2938704 & data$S2938704 <= 5.0] <- 1.0
  data$S2938704 <- factor(data$S2938704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S2938705[1.0 <= data$S2938705 & data$S2938705 <= 6.0] <- 1.0
  data$S2938705 <- factor(data$S2938705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S2938706[1.0 <= data$S2938706 & data$S2938706 <= 7.0] <- 1.0
  data$S2938706 <- factor(data$S2938706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S2938707[1.0 <= data$S2938707 & data$S2938707 <= 8.0] <- 1.0
  data$S2938707 <- factor(data$S2938707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S2938708[1.0 <= data$S2938708 & data$S2938708 <= 11.0] <- 1.0
  data$S2938708 <- factor(data$S2938708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job fair"))
  data$S2938709[1.0 <= data$S2938709 & data$S2938709 <= 12.0] <- 1.0
  data$S2938709 <- factor(data$S2938709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched on the internet/online"))
  data$S2938710[1.0 <= data$S2938710 & data$S2938710 <= 9.0] <- 1.0
  data$S2938710 <- factor(data$S2938710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S2938711[1.0 <= data$S2938711 & data$S2938711 <= 999.0] <- 1.0
  data$S2938711 <- factor(data$S2938711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S2938800 <- factor(data$S2938800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S2938801[1.0 <= data$S2938801 & data$S2938801 <= 2.0] <- 1.0
  data$S2938801 <- factor(data$S2938801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S2938802[1.0 <= data$S2938802 & data$S2938802 <= 3.0] <- 1.0
  data$S2938802 <- factor(data$S2938802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S2938803[1.0 <= data$S2938803 & data$S2938803 <= 4.0] <- 1.0
  data$S2938803 <- factor(data$S2938803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S2938804[1.0 <= data$S2938804 & data$S2938804 <= 5.0] <- 1.0
  data$S2938804 <- factor(data$S2938804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S2938805[1.0 <= data$S2938805 & data$S2938805 <= 6.0] <- 1.0
  data$S2938805 <- factor(data$S2938805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S2938806[1.0 <= data$S2938806 & data$S2938806 <= 7.0] <- 1.0
  data$S2938806 <- factor(data$S2938806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S2938807[1.0 <= data$S2938807 & data$S2938807 <= 8.0] <- 1.0
  data$S2938807 <- factor(data$S2938807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S2938808[1.0 <= data$S2938808 & data$S2938808 <= 11.0] <- 1.0
  data$S2938808 <- factor(data$S2938808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job fair"))
  data$S2938809[1.0 <= data$S2938809 & data$S2938809 <= 12.0] <- 1.0
  data$S2938809 <- factor(data$S2938809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched on the internet/online"))
  data$S2938810[1.0 <= data$S2938810 & data$S2938810 <= 9.0] <- 1.0
  data$S2938810 <- factor(data$S2938810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S2938900 <- factor(data$S2938900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S2938901[1.0 <= data$S2938901 & data$S2938901 <= 2.0] <- 1.0
  data$S2938901 <- factor(data$S2938901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S2938902[1.0 <= data$S2938902 & data$S2938902 <= 3.0] <- 1.0
  data$S2938902 <- factor(data$S2938902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S2938903[1.0 <= data$S2938903 & data$S2938903 <= 4.0] <- 1.0
  data$S2938903 <- factor(data$S2938903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S2938904[1.0 <= data$S2938904 & data$S2938904 <= 5.0] <- 1.0
  data$S2938904 <- factor(data$S2938904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S2938905[1.0 <= data$S2938905 & data$S2938905 <= 6.0] <- 1.0
  data$S2938905 <- factor(data$S2938905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S2938906[1.0 <= data$S2938906 & data$S2938906 <= 7.0] <- 1.0
  data$S2938906 <- factor(data$S2938906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S2938907[1.0 <= data$S2938907 & data$S2938907 <= 8.0] <- 1.0
  data$S2938907 <- factor(data$S2938907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S2938908[1.0 <= data$S2938908 & data$S2938908 <= 11.0] <- 1.0
  data$S2938908 <- factor(data$S2938908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job fair"))
  data$S2938909[1.0 <= data$S2938909 & data$S2938909 <= 12.0] <- 1.0
  data$S2938909 <- factor(data$S2938909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched on the internet/online"))
  data$S2938910[1.0 <= data$S2938910 & data$S2938910 <= 9.0] <- 1.0
  data$S2938910 <- factor(data$S2938910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S2939000 <- factor(data$S2939000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S2939001[1.0 <= data$S2939001 & data$S2939001 <= 2.0] <- 1.0
  data$S2939001 <- factor(data$S2939001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S2939002[1.0 <= data$S2939002 & data$S2939002 <= 3.0] <- 1.0
  data$S2939002 <- factor(data$S2939002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S2939003[1.0 <= data$S2939003 & data$S2939003 <= 4.0] <- 1.0
  data$S2939003 <- factor(data$S2939003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S2939004[1.0 <= data$S2939004 & data$S2939004 <= 5.0] <- 1.0
  data$S2939004 <- factor(data$S2939004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S2939005[1.0 <= data$S2939005 & data$S2939005 <= 6.0] <- 1.0
  data$S2939005 <- factor(data$S2939005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S2939006[1.0 <= data$S2939006 & data$S2939006 <= 7.0] <- 1.0
  data$S2939006 <- factor(data$S2939006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S2939007[1.0 <= data$S2939007 & data$S2939007 <= 8.0] <- 1.0
  data$S2939007 <- factor(data$S2939007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S2939008[1.0 <= data$S2939008 & data$S2939008 <= 11.0] <- 1.0
  data$S2939008 <- factor(data$S2939008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job fair"))
  data$S2939009[1.0 <= data$S2939009 & data$S2939009 <= 12.0] <- 1.0
  data$S2939009 <- factor(data$S2939009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched on the internet/online"))
  data$S2939010[1.0 <= data$S2939010 & data$S2939010 <= 9.0] <- 1.0
  data$S2939010 <- factor(data$S2939010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S4640500 <- factor(data$S4640500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S4640501[1.0 <= data$S4640501 & data$S4640501 <= 2.0] <- 1.0
  data$S4640501 <- factor(data$S4640501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S4640502[1.0 <= data$S4640502 & data$S4640502 <= 3.0] <- 1.0
  data$S4640502 <- factor(data$S4640502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S4640503[1.0 <= data$S4640503 & data$S4640503 <= 4.0] <- 1.0
  data$S4640503 <- factor(data$S4640503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S4640504[1.0 <= data$S4640504 & data$S4640504 <= 5.0] <- 1.0
  data$S4640504 <- factor(data$S4640504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S4640505[1.0 <= data$S4640505 & data$S4640505 <= 6.0] <- 1.0
  data$S4640505 <- factor(data$S4640505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S4640506[1.0 <= data$S4640506 & data$S4640506 <= 7.0] <- 1.0
  data$S4640506 <- factor(data$S4640506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S4640507[1.0 <= data$S4640507 & data$S4640507 <= 8.0] <- 1.0
  data$S4640507 <- factor(data$S4640507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S4640508[1.0 <= data$S4640508 & data$S4640508 <= 9.0] <- 1.0
  data$S4640508 <- factor(data$S4640508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S4640509[1.0 <= data$S4640509 & data$S4640509 <= 11.0] <- 1.0
  data$S4640509 <- factor(data$S4640509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S4640510[1.0 <= data$S4640510 & data$S4640510 <= 12.0] <- 1.0
  data$S4640510 <- factor(data$S4640510, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/ On-line"))
  data$S4640511[1.0 <= data$S4640511 & data$S4640511 <= 999.0] <- 1.0
  data$S4640511 <- factor(data$S4640511, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S4640600 <- factor(data$S4640600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S4640601[1.0 <= data$S4640601 & data$S4640601 <= 2.0] <- 1.0
  data$S4640601 <- factor(data$S4640601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S4640602[1.0 <= data$S4640602 & data$S4640602 <= 3.0] <- 1.0
  data$S4640602 <- factor(data$S4640602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S4640603[1.0 <= data$S4640603 & data$S4640603 <= 4.0] <- 1.0
  data$S4640603 <- factor(data$S4640603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S4640604[1.0 <= data$S4640604 & data$S4640604 <= 5.0] <- 1.0
  data$S4640604 <- factor(data$S4640604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S4640605[1.0 <= data$S4640605 & data$S4640605 <= 6.0] <- 1.0
  data$S4640605 <- factor(data$S4640605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S4640606[1.0 <= data$S4640606 & data$S4640606 <= 7.0] <- 1.0
  data$S4640606 <- factor(data$S4640606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S4640607[1.0 <= data$S4640607 & data$S4640607 <= 8.0] <- 1.0
  data$S4640607 <- factor(data$S4640607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S4640608[1.0 <= data$S4640608 & data$S4640608 <= 9.0] <- 1.0
  data$S4640608 <- factor(data$S4640608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S4640609[1.0 <= data$S4640609 & data$S4640609 <= 11.0] <- 1.0
  data$S4640609 <- factor(data$S4640609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S4640610[1.0 <= data$S4640610 & data$S4640610 <= 12.0] <- 1.0
  data$S4640610 <- factor(data$S4640610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/ On-line"))
  data$S4640611[1.0 <= data$S4640611 & data$S4640611 <= 999.0] <- 1.0
  data$S4640611 <- factor(data$S4640611, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S4640700 <- factor(data$S4640700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S4640701[1.0 <= data$S4640701 & data$S4640701 <= 2.0] <- 1.0
  data$S4640701 <- factor(data$S4640701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S4640702[1.0 <= data$S4640702 & data$S4640702 <= 3.0] <- 1.0
  data$S4640702 <- factor(data$S4640702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S4640703[1.0 <= data$S4640703 & data$S4640703 <= 4.0] <- 1.0
  data$S4640703 <- factor(data$S4640703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S4640704[1.0 <= data$S4640704 & data$S4640704 <= 5.0] <- 1.0
  data$S4640704 <- factor(data$S4640704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S4640705[1.0 <= data$S4640705 & data$S4640705 <= 6.0] <- 1.0
  data$S4640705 <- factor(data$S4640705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S4640706[1.0 <= data$S4640706 & data$S4640706 <= 7.0] <- 1.0
  data$S4640706 <- factor(data$S4640706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S4640707[1.0 <= data$S4640707 & data$S4640707 <= 8.0] <- 1.0
  data$S4640707 <- factor(data$S4640707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S4640708[1.0 <= data$S4640708 & data$S4640708 <= 9.0] <- 1.0
  data$S4640708 <- factor(data$S4640708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S4640709[1.0 <= data$S4640709 & data$S4640709 <= 11.0] <- 1.0
  data$S4640709 <- factor(data$S4640709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S4640710[1.0 <= data$S4640710 & data$S4640710 <= 12.0] <- 1.0
  data$S4640710 <- factor(data$S4640710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/ On-line"))
  data$S4640711[1.0 <= data$S4640711 & data$S4640711 <= 999.0] <- 1.0
  data$S4640711 <- factor(data$S4640711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S4640800 <- factor(data$S4640800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S4640801[1.0 <= data$S4640801 & data$S4640801 <= 2.0] <- 1.0
  data$S4640801 <- factor(data$S4640801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S4640802[1.0 <= data$S4640802 & data$S4640802 <= 3.0] <- 1.0
  data$S4640802 <- factor(data$S4640802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S4640803[1.0 <= data$S4640803 & data$S4640803 <= 4.0] <- 1.0
  data$S4640803 <- factor(data$S4640803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S4640804[1.0 <= data$S4640804 & data$S4640804 <= 5.0] <- 1.0
  data$S4640804 <- factor(data$S4640804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S4640805[1.0 <= data$S4640805 & data$S4640805 <= 6.0] <- 1.0
  data$S4640805 <- factor(data$S4640805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S4640806[1.0 <= data$S4640806 & data$S4640806 <= 7.0] <- 1.0
  data$S4640806 <- factor(data$S4640806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S4640807[1.0 <= data$S4640807 & data$S4640807 <= 8.0] <- 1.0
  data$S4640807 <- factor(data$S4640807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S4640808[1.0 <= data$S4640808 & data$S4640808 <= 9.0] <- 1.0
  data$S4640808 <- factor(data$S4640808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S4640809[1.0 <= data$S4640809 & data$S4640809 <= 11.0] <- 1.0
  data$S4640809 <- factor(data$S4640809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S4640810[1.0 <= data$S4640810 & data$S4640810 <= 12.0] <- 1.0
  data$S4640810 <- factor(data$S4640810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/ On-line"))
  data$S4640900 <- factor(data$S4640900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S4640901[1.0 <= data$S4640901 & data$S4640901 <= 2.0] <- 1.0
  data$S4640901 <- factor(data$S4640901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S4640902[1.0 <= data$S4640902 & data$S4640902 <= 3.0] <- 1.0
  data$S4640902 <- factor(data$S4640902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S4640903[1.0 <= data$S4640903 & data$S4640903 <= 4.0] <- 1.0
  data$S4640903 <- factor(data$S4640903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S4640904[1.0 <= data$S4640904 & data$S4640904 <= 5.0] <- 1.0
  data$S4640904 <- factor(data$S4640904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S4640905[1.0 <= data$S4640905 & data$S4640905 <= 6.0] <- 1.0
  data$S4640905 <- factor(data$S4640905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S4640906[1.0 <= data$S4640906 & data$S4640906 <= 7.0] <- 1.0
  data$S4640906 <- factor(data$S4640906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S4640907[1.0 <= data$S4640907 & data$S4640907 <= 8.0] <- 1.0
  data$S4640907 <- factor(data$S4640907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S4640908[1.0 <= data$S4640908 & data$S4640908 <= 9.0] <- 1.0
  data$S4640908 <- factor(data$S4640908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S4640909[1.0 <= data$S4640909 & data$S4640909 <= 11.0] <- 1.0
  data$S4640909 <- factor(data$S4640909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S4640910[1.0 <= data$S4640910 & data$S4640910 <= 12.0] <- 1.0
  data$S4640910 <- factor(data$S4640910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/ On-line"))
  data$S4641000 <- factor(data$S4641000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S4641001[1.0 <= data$S4641001 & data$S4641001 <= 2.0] <- 1.0
  data$S4641001 <- factor(data$S4641001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S4641002[1.0 <= data$S4641002 & data$S4641002 <= 3.0] <- 1.0
  data$S4641002 <- factor(data$S4641002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S4641003[1.0 <= data$S4641003 & data$S4641003 <= 4.0] <- 1.0
  data$S4641003 <- factor(data$S4641003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S4641004[1.0 <= data$S4641004 & data$S4641004 <= 5.0] <- 1.0
  data$S4641004 <- factor(data$S4641004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S4641005[1.0 <= data$S4641005 & data$S4641005 <= 6.0] <- 1.0
  data$S4641005 <- factor(data$S4641005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S4641006[1.0 <= data$S4641006 & data$S4641006 <= 7.0] <- 1.0
  data$S4641006 <- factor(data$S4641006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S4641007[1.0 <= data$S4641007 & data$S4641007 <= 8.0] <- 1.0
  data$S4641007 <- factor(data$S4641007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S4641008[1.0 <= data$S4641008 & data$S4641008 <= 9.0] <- 1.0
  data$S4641008 <- factor(data$S4641008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S4641009[1.0 <= data$S4641009 & data$S4641009 <= 11.0] <- 1.0
  data$S4641009 <- factor(data$S4641009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S4641010[1.0 <= data$S4641010 & data$S4641010 <= 12.0] <- 1.0
  data$S4641010 <- factor(data$S4641010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/ On-line"))
  data$S6267700 <- factor(data$S6267700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S6267701[1.0 <= data$S6267701 & data$S6267701 <= 2.0] <- 1.0
  data$S6267701 <- factor(data$S6267701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S6267702[1.0 <= data$S6267702 & data$S6267702 <= 3.0] <- 1.0
  data$S6267702 <- factor(data$S6267702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S6267703[1.0 <= data$S6267703 & data$S6267703 <= 4.0] <- 1.0
  data$S6267703 <- factor(data$S6267703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S6267704[1.0 <= data$S6267704 & data$S6267704 <= 5.0] <- 1.0
  data$S6267704 <- factor(data$S6267704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S6267705[1.0 <= data$S6267705 & data$S6267705 <= 6.0] <- 1.0
  data$S6267705 <- factor(data$S6267705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S6267706[1.0 <= data$S6267706 & data$S6267706 <= 7.0] <- 1.0
  data$S6267706 <- factor(data$S6267706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S6267707[1.0 <= data$S6267707 & data$S6267707 <= 8.0] <- 1.0
  data$S6267707 <- factor(data$S6267707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S6267708[1.0 <= data$S6267708 & data$S6267708 <= 9.0] <- 1.0
  data$S6267708 <- factor(data$S6267708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S6267709[1.0 <= data$S6267709 & data$S6267709 <= 11.0] <- 1.0
  data$S6267709 <- factor(data$S6267709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S6267710[1.0 <= data$S6267710 & data$S6267710 <= 12.0] <- 1.0
  data$S6267710 <- factor(data$S6267710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S6267711[1.0 <= data$S6267711 & data$S6267711 <= 999.0] <- 1.0
  data$S6267711 <- factor(data$S6267711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODABLE"))
  data$S6267800 <- factor(data$S6267800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S6267801[1.0 <= data$S6267801 & data$S6267801 <= 2.0] <- 1.0
  data$S6267801 <- factor(data$S6267801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S6267802[1.0 <= data$S6267802 & data$S6267802 <= 3.0] <- 1.0
  data$S6267802 <- factor(data$S6267802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S6267803[1.0 <= data$S6267803 & data$S6267803 <= 4.0] <- 1.0
  data$S6267803 <- factor(data$S6267803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S6267804[1.0 <= data$S6267804 & data$S6267804 <= 5.0] <- 1.0
  data$S6267804 <- factor(data$S6267804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S6267805[1.0 <= data$S6267805 & data$S6267805 <= 6.0] <- 1.0
  data$S6267805 <- factor(data$S6267805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S6267806[1.0 <= data$S6267806 & data$S6267806 <= 7.0] <- 1.0
  data$S6267806 <- factor(data$S6267806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S6267807[1.0 <= data$S6267807 & data$S6267807 <= 8.0] <- 1.0
  data$S6267807 <- factor(data$S6267807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S6267808[1.0 <= data$S6267808 & data$S6267808 <= 9.0] <- 1.0
  data$S6267808 <- factor(data$S6267808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S6267809[1.0 <= data$S6267809 & data$S6267809 <= 11.0] <- 1.0
  data$S6267809 <- factor(data$S6267809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S6267810[1.0 <= data$S6267810 & data$S6267810 <= 12.0] <- 1.0
  data$S6267810 <- factor(data$S6267810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S6267900 <- factor(data$S6267900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S6267901[1.0 <= data$S6267901 & data$S6267901 <= 2.0] <- 1.0
  data$S6267901 <- factor(data$S6267901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S6267902[1.0 <= data$S6267902 & data$S6267902 <= 3.0] <- 1.0
  data$S6267902 <- factor(data$S6267902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S6267903[1.0 <= data$S6267903 & data$S6267903 <= 4.0] <- 1.0
  data$S6267903 <- factor(data$S6267903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S6267904[1.0 <= data$S6267904 & data$S6267904 <= 5.0] <- 1.0
  data$S6267904 <- factor(data$S6267904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S6267905[1.0 <= data$S6267905 & data$S6267905 <= 6.0] <- 1.0
  data$S6267905 <- factor(data$S6267905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S6267906[1.0 <= data$S6267906 & data$S6267906 <= 7.0] <- 1.0
  data$S6267906 <- factor(data$S6267906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S6267907[1.0 <= data$S6267907 & data$S6267907 <= 8.0] <- 1.0
  data$S6267907 <- factor(data$S6267907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S6267908[1.0 <= data$S6267908 & data$S6267908 <= 9.0] <- 1.0
  data$S6267908 <- factor(data$S6267908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S6267909[1.0 <= data$S6267909 & data$S6267909 <= 11.0] <- 1.0
  data$S6267909 <- factor(data$S6267909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S6267910[1.0 <= data$S6267910 & data$S6267910 <= 12.0] <- 1.0
  data$S6267910 <- factor(data$S6267910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S6268000 <- factor(data$S6268000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S6268001[1.0 <= data$S6268001 & data$S6268001 <= 2.0] <- 1.0
  data$S6268001 <- factor(data$S6268001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S6268002[1.0 <= data$S6268002 & data$S6268002 <= 3.0] <- 1.0
  data$S6268002 <- factor(data$S6268002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S6268003[1.0 <= data$S6268003 & data$S6268003 <= 4.0] <- 1.0
  data$S6268003 <- factor(data$S6268003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S6268004[1.0 <= data$S6268004 & data$S6268004 <= 5.0] <- 1.0
  data$S6268004 <- factor(data$S6268004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S6268005[1.0 <= data$S6268005 & data$S6268005 <= 6.0] <- 1.0
  data$S6268005 <- factor(data$S6268005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S6268006[1.0 <= data$S6268006 & data$S6268006 <= 7.0] <- 1.0
  data$S6268006 <- factor(data$S6268006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S6268007[1.0 <= data$S6268007 & data$S6268007 <= 8.0] <- 1.0
  data$S6268007 <- factor(data$S6268007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S6268008[1.0 <= data$S6268008 & data$S6268008 <= 9.0] <- 1.0
  data$S6268008 <- factor(data$S6268008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S6268009[1.0 <= data$S6268009 & data$S6268009 <= 11.0] <- 1.0
  data$S6268009 <- factor(data$S6268009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S6268010[1.0 <= data$S6268010 & data$S6268010 <= 12.0] <- 1.0
  data$S6268010 <- factor(data$S6268010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S6268100 <- factor(data$S6268100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S6268101[1.0 <= data$S6268101 & data$S6268101 <= 2.0] <- 1.0
  data$S6268101 <- factor(data$S6268101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S6268102[1.0 <= data$S6268102 & data$S6268102 <= 3.0] <- 1.0
  data$S6268102 <- factor(data$S6268102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S6268103[1.0 <= data$S6268103 & data$S6268103 <= 4.0] <- 1.0
  data$S6268103 <- factor(data$S6268103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S6268104[1.0 <= data$S6268104 & data$S6268104 <= 5.0] <- 1.0
  data$S6268104 <- factor(data$S6268104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S6268105[1.0 <= data$S6268105 & data$S6268105 <= 6.0] <- 1.0
  data$S6268105 <- factor(data$S6268105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S6268106[1.0 <= data$S6268106 & data$S6268106 <= 7.0] <- 1.0
  data$S6268106 <- factor(data$S6268106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S6268107[1.0 <= data$S6268107 & data$S6268107 <= 8.0] <- 1.0
  data$S6268107 <- factor(data$S6268107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S6268108[1.0 <= data$S6268108 & data$S6268108 <= 9.0] <- 1.0
  data$S6268108 <- factor(data$S6268108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S6268109[1.0 <= data$S6268109 & data$S6268109 <= 11.0] <- 1.0
  data$S6268109 <- factor(data$S6268109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S6268110[1.0 <= data$S6268110 & data$S6268110 <= 12.0] <- 1.0
  data$S6268110 <- factor(data$S6268110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S8298900 <- factor(data$S8298900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S8298901[1.0 <= data$S8298901 & data$S8298901 <= 2.0] <- 1.0
  data$S8298901 <- factor(data$S8298901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S8298902[1.0 <= data$S8298902 & data$S8298902 <= 3.0] <- 1.0
  data$S8298902 <- factor(data$S8298902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S8298903[1.0 <= data$S8298903 & data$S8298903 <= 4.0] <- 1.0
  data$S8298903 <- factor(data$S8298903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S8298904[1.0 <= data$S8298904 & data$S8298904 <= 5.0] <- 1.0
  data$S8298904 <- factor(data$S8298904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S8298905[1.0 <= data$S8298905 & data$S8298905 <= 6.0] <- 1.0
  data$S8298905 <- factor(data$S8298905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S8298906[1.0 <= data$S8298906 & data$S8298906 <= 7.0] <- 1.0
  data$S8298906 <- factor(data$S8298906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S8298907[1.0 <= data$S8298907 & data$S8298907 <= 8.0] <- 1.0
  data$S8298907 <- factor(data$S8298907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S8298908[1.0 <= data$S8298908 & data$S8298908 <= 9.0] <- 1.0
  data$S8298908 <- factor(data$S8298908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S8298909[1.0 <= data$S8298909 & data$S8298909 <= 11.0] <- 1.0
  data$S8298909 <- factor(data$S8298909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S8298910[1.0 <= data$S8298910 & data$S8298910 <= 12.0] <- 1.0
  data$S8298910 <- factor(data$S8298910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S8298911[1.0 <= data$S8298911 & data$S8298911 <= 999.0] <- 1.0
  data$S8298911 <- factor(data$S8298911, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODEABLE"))
  data$S8299000 <- factor(data$S8299000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S8299001[1.0 <= data$S8299001 & data$S8299001 <= 2.0] <- 1.0
  data$S8299001 <- factor(data$S8299001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S8299002[1.0 <= data$S8299002 & data$S8299002 <= 3.0] <- 1.0
  data$S8299002 <- factor(data$S8299002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S8299003[1.0 <= data$S8299003 & data$S8299003 <= 4.0] <- 1.0
  data$S8299003 <- factor(data$S8299003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S8299004[1.0 <= data$S8299004 & data$S8299004 <= 5.0] <- 1.0
  data$S8299004 <- factor(data$S8299004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S8299005[1.0 <= data$S8299005 & data$S8299005 <= 6.0] <- 1.0
  data$S8299005 <- factor(data$S8299005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S8299006[1.0 <= data$S8299006 & data$S8299006 <= 7.0] <- 1.0
  data$S8299006 <- factor(data$S8299006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S8299007[1.0 <= data$S8299007 & data$S8299007 <= 8.0] <- 1.0
  data$S8299007 <- factor(data$S8299007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S8299008[1.0 <= data$S8299008 & data$S8299008 <= 9.0] <- 1.0
  data$S8299008 <- factor(data$S8299008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S8299009[1.0 <= data$S8299009 & data$S8299009 <= 11.0] <- 1.0
  data$S8299009 <- factor(data$S8299009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S8299010[1.0 <= data$S8299010 & data$S8299010 <= 12.0] <- 1.0
  data$S8299010 <- factor(data$S8299010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S8299100 <- factor(data$S8299100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S8299101[1.0 <= data$S8299101 & data$S8299101 <= 2.0] <- 1.0
  data$S8299101 <- factor(data$S8299101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S8299102[1.0 <= data$S8299102 & data$S8299102 <= 3.0] <- 1.0
  data$S8299102 <- factor(data$S8299102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S8299103[1.0 <= data$S8299103 & data$S8299103 <= 4.0] <- 1.0
  data$S8299103 <- factor(data$S8299103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S8299104[1.0 <= data$S8299104 & data$S8299104 <= 5.0] <- 1.0
  data$S8299104 <- factor(data$S8299104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S8299105[1.0 <= data$S8299105 & data$S8299105 <= 6.0] <- 1.0
  data$S8299105 <- factor(data$S8299105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S8299106[1.0 <= data$S8299106 & data$S8299106 <= 7.0] <- 1.0
  data$S8299106 <- factor(data$S8299106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S8299107[1.0 <= data$S8299107 & data$S8299107 <= 8.0] <- 1.0
  data$S8299107 <- factor(data$S8299107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S8299108[1.0 <= data$S8299108 & data$S8299108 <= 9.0] <- 1.0
  data$S8299108 <- factor(data$S8299108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S8299109[1.0 <= data$S8299109 & data$S8299109 <= 11.0] <- 1.0
  data$S8299109 <- factor(data$S8299109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S8299110[1.0 <= data$S8299110 & data$S8299110 <= 12.0] <- 1.0
  data$S8299110 <- factor(data$S8299110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S8299200 <- factor(data$S8299200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S8299201[1.0 <= data$S8299201 & data$S8299201 <= 2.0] <- 1.0
  data$S8299201 <- factor(data$S8299201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S8299202[1.0 <= data$S8299202 & data$S8299202 <= 3.0] <- 1.0
  data$S8299202 <- factor(data$S8299202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S8299203[1.0 <= data$S8299203 & data$S8299203 <= 4.0] <- 1.0
  data$S8299203 <- factor(data$S8299203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S8299204[1.0 <= data$S8299204 & data$S8299204 <= 5.0] <- 1.0
  data$S8299204 <- factor(data$S8299204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S8299205[1.0 <= data$S8299205 & data$S8299205 <= 6.0] <- 1.0
  data$S8299205 <- factor(data$S8299205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S8299206[1.0 <= data$S8299206 & data$S8299206 <= 7.0] <- 1.0
  data$S8299206 <- factor(data$S8299206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S8299207[1.0 <= data$S8299207 & data$S8299207 <= 8.0] <- 1.0
  data$S8299207 <- factor(data$S8299207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S8299208[1.0 <= data$S8299208 & data$S8299208 <= 9.0] <- 1.0
  data$S8299208 <- factor(data$S8299208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S8299209[1.0 <= data$S8299209 & data$S8299209 <= 11.0] <- 1.0
  data$S8299209 <- factor(data$S8299209, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S8299210[1.0 <= data$S8299210 & data$S8299210 <= 12.0] <- 1.0
  data$S8299210 <- factor(data$S8299210, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S8299300 <- factor(data$S8299300, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S8299301[1.0 <= data$S8299301 & data$S8299301 <= 2.0] <- 1.0
  data$S8299301 <- factor(data$S8299301, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S8299302[1.0 <= data$S8299302 & data$S8299302 <= 3.0] <- 1.0
  data$S8299302 <- factor(data$S8299302, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S8299303[1.0 <= data$S8299303 & data$S8299303 <= 4.0] <- 1.0
  data$S8299303 <- factor(data$S8299303, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S8299304[1.0 <= data$S8299304 & data$S8299304 <= 5.0] <- 1.0
  data$S8299304 <- factor(data$S8299304, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S8299305[1.0 <= data$S8299305 & data$S8299305 <= 6.0] <- 1.0
  data$S8299305 <- factor(data$S8299305, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S8299306[1.0 <= data$S8299306 & data$S8299306 <= 7.0] <- 1.0
  data$S8299306 <- factor(data$S8299306, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S8299307[1.0 <= data$S8299307 & data$S8299307 <= 8.0] <- 1.0
  data$S8299307 <- factor(data$S8299307, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S8299308[1.0 <= data$S8299308 & data$S8299308 <= 9.0] <- 1.0
  data$S8299308 <- factor(data$S8299308, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S8299309[1.0 <= data$S8299309 & data$S8299309 <= 11.0] <- 1.0
  data$S8299309 <- factor(data$S8299309, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S8299310[1.0 <= data$S8299310 & data$S8299310 <= 12.0] <- 1.0
  data$S8299310 <- factor(data$S8299310, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$S8299400 <- factor(data$S8299400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$S8299401[1.0 <= data$S8299401 & data$S8299401 <= 2.0] <- 1.0
  data$S8299401 <- factor(data$S8299401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$S8299402[1.0 <= data$S8299402 & data$S8299402 <= 3.0] <- 1.0
  data$S8299402 <- factor(data$S8299402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$S8299403[1.0 <= data$S8299403 & data$S8299403 <= 4.0] <- 1.0
  data$S8299403 <- factor(data$S8299403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$S8299404[1.0 <= data$S8299404 & data$S8299404 <= 5.0] <- 1.0
  data$S8299404 <- factor(data$S8299404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$S8299405[1.0 <= data$S8299405 & data$S8299405 <= 6.0] <- 1.0
  data$S8299405 <- factor(data$S8299405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$S8299406[1.0 <= data$S8299406 & data$S8299406 <= 7.0] <- 1.0
  data$S8299406 <- factor(data$S8299406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$S8299407[1.0 <= data$S8299407 & data$S8299407 <= 8.0] <- 1.0
  data$S8299407 <- factor(data$S8299407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$S8299408[1.0 <= data$S8299408 & data$S8299408 <= 9.0] <- 1.0
  data$S8299408 <- factor(data$S8299408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$S8299409[1.0 <= data$S8299409 & data$S8299409 <= 11.0] <- 1.0
  data$S8299409 <- factor(data$S8299409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$S8299410[1.0 <= data$S8299410 & data$S8299410 <= 12.0] <- 1.0
  data$S8299410 <- factor(data$S8299410, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T0698800 <- factor(data$T0698800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$T0698801[1.0 <= data$T0698801 & data$T0698801 <= 2.0] <- 1.0
  data$T0698801 <- factor(data$T0698801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$T0698802[1.0 <= data$T0698802 & data$T0698802 <= 3.0] <- 1.0
  data$T0698802 <- factor(data$T0698802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$T0698803[1.0 <= data$T0698803 & data$T0698803 <= 4.0] <- 1.0
  data$T0698803 <- factor(data$T0698803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$T0698804[1.0 <= data$T0698804 & data$T0698804 <= 5.0] <- 1.0
  data$T0698804 <- factor(data$T0698804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$T0698805[1.0 <= data$T0698805 & data$T0698805 <= 6.0] <- 1.0
  data$T0698805 <- factor(data$T0698805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$T0698806[1.0 <= data$T0698806 & data$T0698806 <= 7.0] <- 1.0
  data$T0698806 <- factor(data$T0698806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$T0698807[1.0 <= data$T0698807 & data$T0698807 <= 8.0] <- 1.0
  data$T0698807 <- factor(data$T0698807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$T0698808[1.0 <= data$T0698808 & data$T0698808 <= 9.0] <- 1.0
  data$T0698808 <- factor(data$T0698808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$T0698809[1.0 <= data$T0698809 & data$T0698809 <= 11.0] <- 1.0
  data$T0698809 <- factor(data$T0698809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$T0698810[1.0 <= data$T0698810 & data$T0698810 <= 12.0] <- 1.0
  data$T0698810 <- factor(data$T0698810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T0698811[1.0 <= data$T0698811 & data$T0698811 <= 999.0] <- 1.0
  data$T0698811 <- factor(data$T0698811, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "UNCODEABLE"))
  data$T0698900 <- factor(data$T0698900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$T0698901[1.0 <= data$T0698901 & data$T0698901 <= 2.0] <- 1.0
  data$T0698901 <- factor(data$T0698901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$T0698902[1.0 <= data$T0698902 & data$T0698902 <= 3.0] <- 1.0
  data$T0698902 <- factor(data$T0698902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$T0698903[1.0 <= data$T0698903 & data$T0698903 <= 4.0] <- 1.0
  data$T0698903 <- factor(data$T0698903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$T0698904[1.0 <= data$T0698904 & data$T0698904 <= 5.0] <- 1.0
  data$T0698904 <- factor(data$T0698904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$T0698905[1.0 <= data$T0698905 & data$T0698905 <= 6.0] <- 1.0
  data$T0698905 <- factor(data$T0698905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$T0698906[1.0 <= data$T0698906 & data$T0698906 <= 7.0] <- 1.0
  data$T0698906 <- factor(data$T0698906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$T0698907[1.0 <= data$T0698907 & data$T0698907 <= 8.0] <- 1.0
  data$T0698907 <- factor(data$T0698907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$T0698908[1.0 <= data$T0698908 & data$T0698908 <= 9.0] <- 1.0
  data$T0698908 <- factor(data$T0698908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$T0698909[1.0 <= data$T0698909 & data$T0698909 <= 11.0] <- 1.0
  data$T0698909 <- factor(data$T0698909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$T0698910[1.0 <= data$T0698910 & data$T0698910 <= 12.0] <- 1.0
  data$T0698910 <- factor(data$T0698910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T0699000 <- factor(data$T0699000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$T0699001[1.0 <= data$T0699001 & data$T0699001 <= 2.0] <- 1.0
  data$T0699001 <- factor(data$T0699001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$T0699002[1.0 <= data$T0699002 & data$T0699002 <= 3.0] <- 1.0
  data$T0699002 <- factor(data$T0699002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$T0699003[1.0 <= data$T0699003 & data$T0699003 <= 4.0] <- 1.0
  data$T0699003 <- factor(data$T0699003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$T0699004[1.0 <= data$T0699004 & data$T0699004 <= 5.0] <- 1.0
  data$T0699004 <- factor(data$T0699004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$T0699005[1.0 <= data$T0699005 & data$T0699005 <= 6.0] <- 1.0
  data$T0699005 <- factor(data$T0699005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$T0699006[1.0 <= data$T0699006 & data$T0699006 <= 7.0] <- 1.0
  data$T0699006 <- factor(data$T0699006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$T0699007[1.0 <= data$T0699007 & data$T0699007 <= 8.0] <- 1.0
  data$T0699007 <- factor(data$T0699007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$T0699008[1.0 <= data$T0699008 & data$T0699008 <= 9.0] <- 1.0
  data$T0699008 <- factor(data$T0699008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$T0699009[1.0 <= data$T0699009 & data$T0699009 <= 11.0] <- 1.0
  data$T0699009 <- factor(data$T0699009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$T0699010[1.0 <= data$T0699010 & data$T0699010 <= 12.0] <- 1.0
  data$T0699010 <- factor(data$T0699010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T0699100 <- factor(data$T0699100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$T0699101[1.0 <= data$T0699101 & data$T0699101 <= 2.0] <- 1.0
  data$T0699101 <- factor(data$T0699101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$T0699102[1.0 <= data$T0699102 & data$T0699102 <= 3.0] <- 1.0
  data$T0699102 <- factor(data$T0699102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$T0699103[1.0 <= data$T0699103 & data$T0699103 <= 4.0] <- 1.0
  data$T0699103 <- factor(data$T0699103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$T0699104[1.0 <= data$T0699104 & data$T0699104 <= 5.0] <- 1.0
  data$T0699104 <- factor(data$T0699104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$T0699105[1.0 <= data$T0699105 & data$T0699105 <= 6.0] <- 1.0
  data$T0699105 <- factor(data$T0699105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$T0699106[1.0 <= data$T0699106 & data$T0699106 <= 7.0] <- 1.0
  data$T0699106 <- factor(data$T0699106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$T0699107[1.0 <= data$T0699107 & data$T0699107 <= 8.0] <- 1.0
  data$T0699107 <- factor(data$T0699107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$T0699108[1.0 <= data$T0699108 & data$T0699108 <= 9.0] <- 1.0
  data$T0699108 <- factor(data$T0699108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$T0699109[1.0 <= data$T0699109 & data$T0699109 <= 11.0] <- 1.0
  data$T0699109 <- factor(data$T0699109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$T0699110[1.0 <= data$T0699110 & data$T0699110 <= 12.0] <- 1.0
  data$T0699110 <- factor(data$T0699110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T0699200 <- factor(data$T0699200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$T0699201[1.0 <= data$T0699201 & data$T0699201 <= 2.0] <- 1.0
  data$T0699201 <- factor(data$T0699201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$T0699202[1.0 <= data$T0699202 & data$T0699202 <= 3.0] <- 1.0
  data$T0699202 <- factor(data$T0699202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$T0699203[1.0 <= data$T0699203 & data$T0699203 <= 4.0] <- 1.0
  data$T0699203 <- factor(data$T0699203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$T0699204[1.0 <= data$T0699204 & data$T0699204 <= 5.0] <- 1.0
  data$T0699204 <- factor(data$T0699204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$T0699205[1.0 <= data$T0699205 & data$T0699205 <= 6.0] <- 1.0
  data$T0699205 <- factor(data$T0699205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$T0699206[1.0 <= data$T0699206 & data$T0699206 <= 7.0] <- 1.0
  data$T0699206 <- factor(data$T0699206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$T0699207[1.0 <= data$T0699207 & data$T0699207 <= 8.0] <- 1.0
  data$T0699207 <- factor(data$T0699207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$T0699208[1.0 <= data$T0699208 & data$T0699208 <= 9.0] <- 1.0
  data$T0699208 <- factor(data$T0699208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$T0699209[1.0 <= data$T0699209 & data$T0699209 <= 11.0] <- 1.0
  data$T0699209 <- factor(data$T0699209, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$T0699210[1.0 <= data$T0699210 & data$T0699210 <= 12.0] <- 1.0
  data$T0699210 <- factor(data$T0699210, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T0699300 <- factor(data$T0699300, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$T0699301[1.0 <= data$T0699301 & data$T0699301 <= 2.0] <- 1.0
  data$T0699301 <- factor(data$T0699301, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$T0699302[1.0 <= data$T0699302 & data$T0699302 <= 3.0] <- 1.0
  data$T0699302 <- factor(data$T0699302, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$T0699303[1.0 <= data$T0699303 & data$T0699303 <= 4.0] <- 1.0
  data$T0699303 <- factor(data$T0699303, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$T0699304[1.0 <= data$T0699304 & data$T0699304 <= 5.0] <- 1.0
  data$T0699304 <- factor(data$T0699304, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$T0699305[1.0 <= data$T0699305 & data$T0699305 <= 6.0] <- 1.0
  data$T0699305 <- factor(data$T0699305, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$T0699306[1.0 <= data$T0699306 & data$T0699306 <= 7.0] <- 1.0
  data$T0699306 <- factor(data$T0699306, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$T0699307[1.0 <= data$T0699307 & data$T0699307 <= 8.0] <- 1.0
  data$T0699307 <- factor(data$T0699307, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$T0699308[1.0 <= data$T0699308 & data$T0699308 <= 9.0] <- 1.0
  data$T0699308 <- factor(data$T0699308, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$T0699309[1.0 <= data$T0699309 & data$T0699309 <= 11.0] <- 1.0
  data$T0699309 <- factor(data$T0699309, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$T0699310[1.0 <= data$T0699310 & data$T0699310 <= 12.0] <- 1.0
  data$T0699310 <- factor(data$T0699310, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T0699400 <- factor(data$T0699400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$T0699401[1.0 <= data$T0699401 & data$T0699401 <= 2.0] <- 1.0
  data$T0699401 <- factor(data$T0699401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$T0699402[1.0 <= data$T0699402 & data$T0699402 <= 3.0] <- 1.0
  data$T0699402 <- factor(data$T0699402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$T0699403[1.0 <= data$T0699403 & data$T0699403 <= 4.0] <- 1.0
  data$T0699403 <- factor(data$T0699403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$T0699404[1.0 <= data$T0699404 & data$T0699404 <= 5.0] <- 1.0
  data$T0699404 <- factor(data$T0699404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$T0699405[1.0 <= data$T0699405 & data$T0699405 <= 6.0] <- 1.0
  data$T0699405 <- factor(data$T0699405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$T0699406[1.0 <= data$T0699406 & data$T0699406 <= 7.0] <- 1.0
  data$T0699406 <- factor(data$T0699406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$T0699407[1.0 <= data$T0699407 & data$T0699407 <= 8.0] <- 1.0
  data$T0699407 <- factor(data$T0699407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$T0699408[1.0 <= data$T0699408 & data$T0699408 <= 9.0] <- 1.0
  data$T0699408 <- factor(data$T0699408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$T0699409[1.0 <= data$T0699409 & data$T0699409 <= 11.0] <- 1.0
  data$T0699409 <- factor(data$T0699409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$T0699410[1.0 <= data$T0699410 & data$T0699410 <= 12.0] <- 1.0
  data$T0699410 <- factor(data$T0699410, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T0699500 <- factor(data$T0699500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "1. Contacted employer directly"))
  data$T0699501[1.0 <= data$T0699501 & data$T0699501 <= 2.0] <- 1.0
  data$T0699501 <- factor(data$T0699501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "2. Contacted employment agency"))
  data$T0699502[1.0 <= data$T0699502 & data$T0699502 <= 3.0] <- 1.0
  data$T0699502 <- factor(data$T0699502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "3. Through friends or relatives"))
  data$T0699503[1.0 <= data$T0699503 & data$T0699503 <= 4.0] <- 1.0
  data$T0699503 <- factor(data$T0699503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "4. Contacted a school placement center"))
  data$T0699504[1.0 <= data$T0699504 & data$T0699504 <= 5.0] <- 1.0
  data$T0699504 <- factor(data$T0699504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "5. Sent out resumes or filled out applications"))
  data$T0699505[1.0 <= data$T0699505 & data$T0699505 <= 6.0] <- 1.0
  data$T0699505 <- factor(data$T0699505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "6. Placed an ad"))
  data$T0699506[1.0 <= data$T0699506 & data$T0699506 <= 7.0] <- 1.0
  data$T0699506 <- factor(data$T0699506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "7. Checked union or professional registers"))
  data$T0699507[1.0 <= data$T0699507 & data$T0699507 <= 8.0] <- 1.0
  data$T0699507 <- factor(data$T0699507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "8. Looked at ads"))
  data$T0699508[1.0 <= data$T0699508 & data$T0699508 <= 9.0] <- 1.0
  data$T0699508 <- factor(data$T0699508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "9. OTHER (SPECIFY)"))
  data$T0699509[1.0 <= data$T0699509 & data$T0699509 <= 11.0] <- 1.0
  data$T0699509 <- factor(data$T0699509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "11. Attended Job Fair"))
  data$T0699510[1.0 <= data$T0699510 & data$T0699510 <= 12.0] <- 1.0
  data$T0699510 <- factor(data$T0699510, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "12. Searched internet/On-line"))
  data$T2748400 <- factor(data$T2748400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T2748401[1.0 <= data$T2748401 & data$T2748401 <= 2.0] <- 1.0
  data$T2748401 <- factor(data$T2748401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T2748402[1.0 <= data$T2748402 & data$T2748402 <= 3.0] <- 1.0
  data$T2748402 <- factor(data$T2748402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T2748403[1.0 <= data$T2748403 & data$T2748403 <= 4.0] <- 1.0
  data$T2748403 <- factor(data$T2748403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T2748404[1.0 <= data$T2748404 & data$T2748404 <= 5.0] <- 1.0
  data$T2748404 <- factor(data$T2748404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T2748405[1.0 <= data$T2748405 & data$T2748405 <= 6.0] <- 1.0
  data$T2748405 <- factor(data$T2748405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T2748406[1.0 <= data$T2748406 & data$T2748406 <= 7.0] <- 1.0
  data$T2748406 <- factor(data$T2748406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T2748407[1.0 <= data$T2748407 & data$T2748407 <= 8.0] <- 1.0
  data$T2748407 <- factor(data$T2748407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T2748408[1.0 <= data$T2748408 & data$T2748408 <= 9.0] <- 1.0
  data$T2748408 <- factor(data$T2748408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T2748409[1.0 <= data$T2748409 & data$T2748409 <= 10.0] <- 1.0
  data$T2748409 <- factor(data$T2748409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T2748410[1.0 <= data$T2748410 & data$T2748410 <= 11.0] <- 1.0
  data$T2748410 <- factor(data$T2748410, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T2748411[1.0 <= data$T2748411 & data$T2748411 <= 12.0] <- 1.0
  data$T2748411 <- factor(data$T2748411, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T2748412[1.0 <= data$T2748412 & data$T2748412 <= 13.0] <- 1.0
  data$T2748412 <- factor(data$T2748412, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T2748413[1.0 <= data$T2748413 & data$T2748413 <= 999.0] <- 1.0
  data$T2748413 <- factor(data$T2748413, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$T2748500 <- factor(data$T2748500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T2748501[1.0 <= data$T2748501 & data$T2748501 <= 2.0] <- 1.0
  data$T2748501 <- factor(data$T2748501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T2748502[1.0 <= data$T2748502 & data$T2748502 <= 3.0] <- 1.0
  data$T2748502 <- factor(data$T2748502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T2748503[1.0 <= data$T2748503 & data$T2748503 <= 4.0] <- 1.0
  data$T2748503 <- factor(data$T2748503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T2748504[1.0 <= data$T2748504 & data$T2748504 <= 5.0] <- 1.0
  data$T2748504 <- factor(data$T2748504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T2748505[1.0 <= data$T2748505 & data$T2748505 <= 6.0] <- 1.0
  data$T2748505 <- factor(data$T2748505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T2748506[1.0 <= data$T2748506 & data$T2748506 <= 7.0] <- 1.0
  data$T2748506 <- factor(data$T2748506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T2748507[1.0 <= data$T2748507 & data$T2748507 <= 8.0] <- 1.0
  data$T2748507 <- factor(data$T2748507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T2748508[1.0 <= data$T2748508 & data$T2748508 <= 9.0] <- 1.0
  data$T2748508 <- factor(data$T2748508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T2748509[1.0 <= data$T2748509 & data$T2748509 <= 10.0] <- 1.0
  data$T2748509 <- factor(data$T2748509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T2748510[1.0 <= data$T2748510 & data$T2748510 <= 11.0] <- 1.0
  data$T2748510 <- factor(data$T2748510, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T2748511[1.0 <= data$T2748511 & data$T2748511 <= 12.0] <- 1.0
  data$T2748511 <- factor(data$T2748511, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T2748512[1.0 <= data$T2748512 & data$T2748512 <= 13.0] <- 1.0
  data$T2748512 <- factor(data$T2748512, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T2748513[1.0 <= data$T2748513 & data$T2748513 <= 999.0] <- 1.0
  data$T2748513 <- factor(data$T2748513, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SUPERVISOR REVIEW"))
  data$T2748600 <- factor(data$T2748600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T2748601[1.0 <= data$T2748601 & data$T2748601 <= 2.0] <- 1.0
  data$T2748601 <- factor(data$T2748601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T2748602[1.0 <= data$T2748602 & data$T2748602 <= 3.0] <- 1.0
  data$T2748602 <- factor(data$T2748602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T2748603[1.0 <= data$T2748603 & data$T2748603 <= 4.0] <- 1.0
  data$T2748603 <- factor(data$T2748603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T2748604[1.0 <= data$T2748604 & data$T2748604 <= 5.0] <- 1.0
  data$T2748604 <- factor(data$T2748604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T2748605[1.0 <= data$T2748605 & data$T2748605 <= 6.0] <- 1.0
  data$T2748605 <- factor(data$T2748605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T2748606[1.0 <= data$T2748606 & data$T2748606 <= 7.0] <- 1.0
  data$T2748606 <- factor(data$T2748606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T2748607[1.0 <= data$T2748607 & data$T2748607 <= 8.0] <- 1.0
  data$T2748607 <- factor(data$T2748607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T2748608[1.0 <= data$T2748608 & data$T2748608 <= 9.0] <- 1.0
  data$T2748608 <- factor(data$T2748608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T2748609[1.0 <= data$T2748609 & data$T2748609 <= 10.0] <- 1.0
  data$T2748609 <- factor(data$T2748609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T2748610[1.0 <= data$T2748610 & data$T2748610 <= 11.0] <- 1.0
  data$T2748610 <- factor(data$T2748610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T2748611[1.0 <= data$T2748611 & data$T2748611 <= 12.0] <- 1.0
  data$T2748611 <- factor(data$T2748611, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T2748612[1.0 <= data$T2748612 & data$T2748612 <= 13.0] <- 1.0
  data$T2748612 <- factor(data$T2748612, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T2748700 <- factor(data$T2748700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T2748701[1.0 <= data$T2748701 & data$T2748701 <= 2.0] <- 1.0
  data$T2748701 <- factor(data$T2748701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T2748702[1.0 <= data$T2748702 & data$T2748702 <= 3.0] <- 1.0
  data$T2748702 <- factor(data$T2748702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T2748703[1.0 <= data$T2748703 & data$T2748703 <= 4.0] <- 1.0
  data$T2748703 <- factor(data$T2748703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T2748704[1.0 <= data$T2748704 & data$T2748704 <= 5.0] <- 1.0
  data$T2748704 <- factor(data$T2748704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T2748705[1.0 <= data$T2748705 & data$T2748705 <= 6.0] <- 1.0
  data$T2748705 <- factor(data$T2748705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T2748706[1.0 <= data$T2748706 & data$T2748706 <= 7.0] <- 1.0
  data$T2748706 <- factor(data$T2748706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T2748707[1.0 <= data$T2748707 & data$T2748707 <= 8.0] <- 1.0
  data$T2748707 <- factor(data$T2748707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T2748708[1.0 <= data$T2748708 & data$T2748708 <= 9.0] <- 1.0
  data$T2748708 <- factor(data$T2748708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T2748709[1.0 <= data$T2748709 & data$T2748709 <= 10.0] <- 1.0
  data$T2748709 <- factor(data$T2748709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T2748710[1.0 <= data$T2748710 & data$T2748710 <= 11.0] <- 1.0
  data$T2748710 <- factor(data$T2748710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T2748711[1.0 <= data$T2748711 & data$T2748711 <= 12.0] <- 1.0
  data$T2748711 <- factor(data$T2748711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T2748712[1.0 <= data$T2748712 & data$T2748712 <= 13.0] <- 1.0
  data$T2748712 <- factor(data$T2748712, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T2748800 <- factor(data$T2748800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T2748801[1.0 <= data$T2748801 & data$T2748801 <= 2.0] <- 1.0
  data$T2748801 <- factor(data$T2748801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T2748802[1.0 <= data$T2748802 & data$T2748802 <= 3.0] <- 1.0
  data$T2748802 <- factor(data$T2748802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T2748803[1.0 <= data$T2748803 & data$T2748803 <= 4.0] <- 1.0
  data$T2748803 <- factor(data$T2748803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T2748804[1.0 <= data$T2748804 & data$T2748804 <= 5.0] <- 1.0
  data$T2748804 <- factor(data$T2748804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T2748805[1.0 <= data$T2748805 & data$T2748805 <= 6.0] <- 1.0
  data$T2748805 <- factor(data$T2748805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T2748806[1.0 <= data$T2748806 & data$T2748806 <= 7.0] <- 1.0
  data$T2748806 <- factor(data$T2748806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T2748807[1.0 <= data$T2748807 & data$T2748807 <= 8.0] <- 1.0
  data$T2748807 <- factor(data$T2748807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T2748808[1.0 <= data$T2748808 & data$T2748808 <= 9.0] <- 1.0
  data$T2748808 <- factor(data$T2748808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T2748809[1.0 <= data$T2748809 & data$T2748809 <= 10.0] <- 1.0
  data$T2748809 <- factor(data$T2748809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T2748810[1.0 <= data$T2748810 & data$T2748810 <= 11.0] <- 1.0
  data$T2748810 <- factor(data$T2748810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T2748811[1.0 <= data$T2748811 & data$T2748811 <= 12.0] <- 1.0
  data$T2748811 <- factor(data$T2748811, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T2748812[1.0 <= data$T2748812 & data$T2748812 <= 13.0] <- 1.0
  data$T2748812 <- factor(data$T2748812, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T2748900 <- factor(data$T2748900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T2748901[1.0 <= data$T2748901 & data$T2748901 <= 2.0] <- 1.0
  data$T2748901 <- factor(data$T2748901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T2748902[1.0 <= data$T2748902 & data$T2748902 <= 3.0] <- 1.0
  data$T2748902 <- factor(data$T2748902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T2748903[1.0 <= data$T2748903 & data$T2748903 <= 4.0] <- 1.0
  data$T2748903 <- factor(data$T2748903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T2748904[1.0 <= data$T2748904 & data$T2748904 <= 5.0] <- 1.0
  data$T2748904 <- factor(data$T2748904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T2748905[1.0 <= data$T2748905 & data$T2748905 <= 6.0] <- 1.0
  data$T2748905 <- factor(data$T2748905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T2748906[1.0 <= data$T2748906 & data$T2748906 <= 7.0] <- 1.0
  data$T2748906 <- factor(data$T2748906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T2748907[1.0 <= data$T2748907 & data$T2748907 <= 8.0] <- 1.0
  data$T2748907 <- factor(data$T2748907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T2748908[1.0 <= data$T2748908 & data$T2748908 <= 9.0] <- 1.0
  data$T2748908 <- factor(data$T2748908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T2748909[1.0 <= data$T2748909 & data$T2748909 <= 10.0] <- 1.0
  data$T2748909 <- factor(data$T2748909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T2748910[1.0 <= data$T2748910 & data$T2748910 <= 11.0] <- 1.0
  data$T2748910 <- factor(data$T2748910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T2748911[1.0 <= data$T2748911 & data$T2748911 <= 12.0] <- 1.0
  data$T2748911 <- factor(data$T2748911, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T2748912[1.0 <= data$T2748912 & data$T2748912 <= 13.0] <- 1.0
  data$T2748912 <- factor(data$T2748912, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T2749000 <- factor(data$T2749000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T2749001[1.0 <= data$T2749001 & data$T2749001 <= 2.0] <- 1.0
  data$T2749001 <- factor(data$T2749001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T2749002[1.0 <= data$T2749002 & data$T2749002 <= 3.0] <- 1.0
  data$T2749002 <- factor(data$T2749002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T2749003[1.0 <= data$T2749003 & data$T2749003 <= 4.0] <- 1.0
  data$T2749003 <- factor(data$T2749003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T2749004[1.0 <= data$T2749004 & data$T2749004 <= 5.0] <- 1.0
  data$T2749004 <- factor(data$T2749004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T2749005[1.0 <= data$T2749005 & data$T2749005 <= 6.0] <- 1.0
  data$T2749005 <- factor(data$T2749005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T2749006[1.0 <= data$T2749006 & data$T2749006 <= 7.0] <- 1.0
  data$T2749006 <- factor(data$T2749006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T2749007[1.0 <= data$T2749007 & data$T2749007 <= 8.0] <- 1.0
  data$T2749007 <- factor(data$T2749007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T2749008[1.0 <= data$T2749008 & data$T2749008 <= 9.0] <- 1.0
  data$T2749008 <- factor(data$T2749008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T2749009[1.0 <= data$T2749009 & data$T2749009 <= 10.0] <- 1.0
  data$T2749009 <- factor(data$T2749009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T2749010[1.0 <= data$T2749010 & data$T2749010 <= 11.0] <- 1.0
  data$T2749010 <- factor(data$T2749010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T2749011[1.0 <= data$T2749011 & data$T2749011 <= 12.0] <- 1.0
  data$T2749011 <- factor(data$T2749011, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T2749012[1.0 <= data$T2749012 & data$T2749012 <= 13.0] <- 1.0
  data$T2749012 <- factor(data$T2749012, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T4234400 <- factor(data$T4234400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T4234401[1.0 <= data$T4234401 & data$T4234401 <= 2.0] <- 1.0
  data$T4234401 <- factor(data$T4234401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T4234402[1.0 <= data$T4234402 & data$T4234402 <= 3.0] <- 1.0
  data$T4234402 <- factor(data$T4234402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T4234403[1.0 <= data$T4234403 & data$T4234403 <= 4.0] <- 1.0
  data$T4234403 <- factor(data$T4234403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T4234404[1.0 <= data$T4234404 & data$T4234404 <= 5.0] <- 1.0
  data$T4234404 <- factor(data$T4234404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T4234405[1.0 <= data$T4234405 & data$T4234405 <= 6.0] <- 1.0
  data$T4234405 <- factor(data$T4234405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T4234406[1.0 <= data$T4234406 & data$T4234406 <= 7.0] <- 1.0
  data$T4234406 <- factor(data$T4234406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T4234407[1.0 <= data$T4234407 & data$T4234407 <= 8.0] <- 1.0
  data$T4234407 <- factor(data$T4234407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T4234408[1.0 <= data$T4234408 & data$T4234408 <= 9.0] <- 1.0
  data$T4234408 <- factor(data$T4234408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T4234409[1.0 <= data$T4234409 & data$T4234409 <= 10.0] <- 1.0
  data$T4234409 <- factor(data$T4234409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T4234410[1.0 <= data$T4234410 & data$T4234410 <= 11.0] <- 1.0
  data$T4234410 <- factor(data$T4234410, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T4234411[1.0 <= data$T4234411 & data$T4234411 <= 12.0] <- 1.0
  data$T4234411 <- factor(data$T4234411, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T4234412[1.0 <= data$T4234412 & data$T4234412 <= 13.0] <- 1.0
  data$T4234412 <- factor(data$T4234412, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T4234500 <- factor(data$T4234500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T4234501[1.0 <= data$T4234501 & data$T4234501 <= 2.0] <- 1.0
  data$T4234501 <- factor(data$T4234501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T4234502[1.0 <= data$T4234502 & data$T4234502 <= 3.0] <- 1.0
  data$T4234502 <- factor(data$T4234502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T4234503[1.0 <= data$T4234503 & data$T4234503 <= 4.0] <- 1.0
  data$T4234503 <- factor(data$T4234503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T4234504[1.0 <= data$T4234504 & data$T4234504 <= 5.0] <- 1.0
  data$T4234504 <- factor(data$T4234504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T4234505[1.0 <= data$T4234505 & data$T4234505 <= 6.0] <- 1.0
  data$T4234505 <- factor(data$T4234505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T4234506[1.0 <= data$T4234506 & data$T4234506 <= 7.0] <- 1.0
  data$T4234506 <- factor(data$T4234506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T4234507[1.0 <= data$T4234507 & data$T4234507 <= 8.0] <- 1.0
  data$T4234507 <- factor(data$T4234507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T4234508[1.0 <= data$T4234508 & data$T4234508 <= 9.0] <- 1.0
  data$T4234508 <- factor(data$T4234508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T4234509[1.0 <= data$T4234509 & data$T4234509 <= 10.0] <- 1.0
  data$T4234509 <- factor(data$T4234509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T4234510[1.0 <= data$T4234510 & data$T4234510 <= 11.0] <- 1.0
  data$T4234510 <- factor(data$T4234510, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T4234511[1.0 <= data$T4234511 & data$T4234511 <= 12.0] <- 1.0
  data$T4234511 <- factor(data$T4234511, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T4234512[1.0 <= data$T4234512 & data$T4234512 <= 13.0] <- 1.0
  data$T4234512 <- factor(data$T4234512, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T4234600 <- factor(data$T4234600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T4234601[1.0 <= data$T4234601 & data$T4234601 <= 2.0] <- 1.0
  data$T4234601 <- factor(data$T4234601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T4234602[1.0 <= data$T4234602 & data$T4234602 <= 3.0] <- 1.0
  data$T4234602 <- factor(data$T4234602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T4234603[1.0 <= data$T4234603 & data$T4234603 <= 4.0] <- 1.0
  data$T4234603 <- factor(data$T4234603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T4234604[1.0 <= data$T4234604 & data$T4234604 <= 5.0] <- 1.0
  data$T4234604 <- factor(data$T4234604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T4234605[1.0 <= data$T4234605 & data$T4234605 <= 6.0] <- 1.0
  data$T4234605 <- factor(data$T4234605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T4234606[1.0 <= data$T4234606 & data$T4234606 <= 7.0] <- 1.0
  data$T4234606 <- factor(data$T4234606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T4234607[1.0 <= data$T4234607 & data$T4234607 <= 8.0] <- 1.0
  data$T4234607 <- factor(data$T4234607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T4234608[1.0 <= data$T4234608 & data$T4234608 <= 9.0] <- 1.0
  data$T4234608 <- factor(data$T4234608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T4234609[1.0 <= data$T4234609 & data$T4234609 <= 10.0] <- 1.0
  data$T4234609 <- factor(data$T4234609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T4234610[1.0 <= data$T4234610 & data$T4234610 <= 11.0] <- 1.0
  data$T4234610 <- factor(data$T4234610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T4234611[1.0 <= data$T4234611 & data$T4234611 <= 12.0] <- 1.0
  data$T4234611 <- factor(data$T4234611, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T4234612[1.0 <= data$T4234612 & data$T4234612 <= 13.0] <- 1.0
  data$T4234612 <- factor(data$T4234612, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T4234700 <- factor(data$T4234700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T4234701[1.0 <= data$T4234701 & data$T4234701 <= 2.0] <- 1.0
  data$T4234701 <- factor(data$T4234701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T4234702[1.0 <= data$T4234702 & data$T4234702 <= 3.0] <- 1.0
  data$T4234702 <- factor(data$T4234702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T4234703[1.0 <= data$T4234703 & data$T4234703 <= 4.0] <- 1.0
  data$T4234703 <- factor(data$T4234703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T4234704[1.0 <= data$T4234704 & data$T4234704 <= 5.0] <- 1.0
  data$T4234704 <- factor(data$T4234704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T4234705[1.0 <= data$T4234705 & data$T4234705 <= 6.0] <- 1.0
  data$T4234705 <- factor(data$T4234705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T4234706[1.0 <= data$T4234706 & data$T4234706 <= 7.0] <- 1.0
  data$T4234706 <- factor(data$T4234706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T4234707[1.0 <= data$T4234707 & data$T4234707 <= 8.0] <- 1.0
  data$T4234707 <- factor(data$T4234707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T4234708[1.0 <= data$T4234708 & data$T4234708 <= 9.0] <- 1.0
  data$T4234708 <- factor(data$T4234708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T4234709[1.0 <= data$T4234709 & data$T4234709 <= 10.0] <- 1.0
  data$T4234709 <- factor(data$T4234709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T4234710[1.0 <= data$T4234710 & data$T4234710 <= 11.0] <- 1.0
  data$T4234710 <- factor(data$T4234710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T4234711[1.0 <= data$T4234711 & data$T4234711 <= 12.0] <- 1.0
  data$T4234711 <- factor(data$T4234711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T4234712[1.0 <= data$T4234712 & data$T4234712 <= 13.0] <- 1.0
  data$T4234712 <- factor(data$T4234712, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T4234800 <- factor(data$T4234800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T4234801[1.0 <= data$T4234801 & data$T4234801 <= 2.0] <- 1.0
  data$T4234801 <- factor(data$T4234801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T4234802[1.0 <= data$T4234802 & data$T4234802 <= 3.0] <- 1.0
  data$T4234802 <- factor(data$T4234802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T4234803[1.0 <= data$T4234803 & data$T4234803 <= 4.0] <- 1.0
  data$T4234803 <- factor(data$T4234803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T4234804[1.0 <= data$T4234804 & data$T4234804 <= 5.0] <- 1.0
  data$T4234804 <- factor(data$T4234804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T4234805[1.0 <= data$T4234805 & data$T4234805 <= 6.0] <- 1.0
  data$T4234805 <- factor(data$T4234805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T4234806[1.0 <= data$T4234806 & data$T4234806 <= 7.0] <- 1.0
  data$T4234806 <- factor(data$T4234806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T4234807[1.0 <= data$T4234807 & data$T4234807 <= 8.0] <- 1.0
  data$T4234807 <- factor(data$T4234807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T4234808[1.0 <= data$T4234808 & data$T4234808 <= 9.0] <- 1.0
  data$T4234808 <- factor(data$T4234808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T4234809[1.0 <= data$T4234809 & data$T4234809 <= 10.0] <- 1.0
  data$T4234809 <- factor(data$T4234809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T4234810[1.0 <= data$T4234810 & data$T4234810 <= 11.0] <- 1.0
  data$T4234810 <- factor(data$T4234810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T4234811[1.0 <= data$T4234811 & data$T4234811 <= 12.0] <- 1.0
  data$T4234811 <- factor(data$T4234811, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T4234812[1.0 <= data$T4234812 & data$T4234812 <= 13.0] <- 1.0
  data$T4234812 <- factor(data$T4234812, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T5872900 <- factor(data$T5872900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T5872901[1.0 <= data$T5872901 & data$T5872901 <= 2.0] <- 1.0
  data$T5872901 <- factor(data$T5872901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T5872902[1.0 <= data$T5872902 & data$T5872902 <= 3.0] <- 1.0
  data$T5872902 <- factor(data$T5872902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T5872903[1.0 <= data$T5872903 & data$T5872903 <= 4.0] <- 1.0
  data$T5872903 <- factor(data$T5872903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T5872904[1.0 <= data$T5872904 & data$T5872904 <= 5.0] <- 1.0
  data$T5872904 <- factor(data$T5872904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T5872905[1.0 <= data$T5872905 & data$T5872905 <= 6.0] <- 1.0
  data$T5872905 <- factor(data$T5872905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T5872906[1.0 <= data$T5872906 & data$T5872906 <= 7.0] <- 1.0
  data$T5872906 <- factor(data$T5872906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T5872907[1.0 <= data$T5872907 & data$T5872907 <= 8.0] <- 1.0
  data$T5872907 <- factor(data$T5872907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T5872908[1.0 <= data$T5872908 & data$T5872908 <= 9.0] <- 1.0
  data$T5872908 <- factor(data$T5872908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T5872909[1.0 <= data$T5872909 & data$T5872909 <= 10.0] <- 1.0
  data$T5872909 <- factor(data$T5872909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T5872910[1.0 <= data$T5872910 & data$T5872910 <= 11.0] <- 1.0
  data$T5872910 <- factor(data$T5872910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T5872911[1.0 <= data$T5872911 & data$T5872911 <= 12.0] <- 1.0
  data$T5872911 <- factor(data$T5872911, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T5872912[1.0 <= data$T5872912 & data$T5872912 <= 13.0] <- 1.0
  data$T5872912 <- factor(data$T5872912, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T5873000 <- factor(data$T5873000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T5873001[1.0 <= data$T5873001 & data$T5873001 <= 2.0] <- 1.0
  data$T5873001 <- factor(data$T5873001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T5873002[1.0 <= data$T5873002 & data$T5873002 <= 3.0] <- 1.0
  data$T5873002 <- factor(data$T5873002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T5873003[1.0 <= data$T5873003 & data$T5873003 <= 4.0] <- 1.0
  data$T5873003 <- factor(data$T5873003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T5873004[1.0 <= data$T5873004 & data$T5873004 <= 5.0] <- 1.0
  data$T5873004 <- factor(data$T5873004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T5873005[1.0 <= data$T5873005 & data$T5873005 <= 6.0] <- 1.0
  data$T5873005 <- factor(data$T5873005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T5873006[1.0 <= data$T5873006 & data$T5873006 <= 7.0] <- 1.0
  data$T5873006 <- factor(data$T5873006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T5873007[1.0 <= data$T5873007 & data$T5873007 <= 8.0] <- 1.0
  data$T5873007 <- factor(data$T5873007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T5873008[1.0 <= data$T5873008 & data$T5873008 <= 9.0] <- 1.0
  data$T5873008 <- factor(data$T5873008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T5873009[1.0 <= data$T5873009 & data$T5873009 <= 10.0] <- 1.0
  data$T5873009 <- factor(data$T5873009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T5873010[1.0 <= data$T5873010 & data$T5873010 <= 11.0] <- 1.0
  data$T5873010 <- factor(data$T5873010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T5873011[1.0 <= data$T5873011 & data$T5873011 <= 12.0] <- 1.0
  data$T5873011 <- factor(data$T5873011, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T5873012[1.0 <= data$T5873012 & data$T5873012 <= 13.0] <- 1.0
  data$T5873012 <- factor(data$T5873012, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T5873100 <- factor(data$T5873100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T5873101[1.0 <= data$T5873101 & data$T5873101 <= 2.0] <- 1.0
  data$T5873101 <- factor(data$T5873101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T5873102[1.0 <= data$T5873102 & data$T5873102 <= 3.0] <- 1.0
  data$T5873102 <- factor(data$T5873102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T5873103[1.0 <= data$T5873103 & data$T5873103 <= 4.0] <- 1.0
  data$T5873103 <- factor(data$T5873103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T5873104[1.0 <= data$T5873104 & data$T5873104 <= 5.0] <- 1.0
  data$T5873104 <- factor(data$T5873104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T5873105[1.0 <= data$T5873105 & data$T5873105 <= 6.0] <- 1.0
  data$T5873105 <- factor(data$T5873105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T5873106[1.0 <= data$T5873106 & data$T5873106 <= 7.0] <- 1.0
  data$T5873106 <- factor(data$T5873106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T5873107[1.0 <= data$T5873107 & data$T5873107 <= 8.0] <- 1.0
  data$T5873107 <- factor(data$T5873107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T5873108[1.0 <= data$T5873108 & data$T5873108 <= 9.0] <- 1.0
  data$T5873108 <- factor(data$T5873108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T5873109[1.0 <= data$T5873109 & data$T5873109 <= 10.0] <- 1.0
  data$T5873109 <- factor(data$T5873109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T5873110[1.0 <= data$T5873110 & data$T5873110 <= 11.0] <- 1.0
  data$T5873110 <- factor(data$T5873110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T5873111[1.0 <= data$T5873111 & data$T5873111 <= 12.0] <- 1.0
  data$T5873111 <- factor(data$T5873111, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T5873112[1.0 <= data$T5873112 & data$T5873112 <= 13.0] <- 1.0
  data$T5873112 <- factor(data$T5873112, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T5873200 <- factor(data$T5873200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T5873201[1.0 <= data$T5873201 & data$T5873201 <= 2.0] <- 1.0
  data$T5873201 <- factor(data$T5873201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T5873202[1.0 <= data$T5873202 & data$T5873202 <= 3.0] <- 1.0
  data$T5873202 <- factor(data$T5873202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T5873203[1.0 <= data$T5873203 & data$T5873203 <= 4.0] <- 1.0
  data$T5873203 <- factor(data$T5873203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T5873204[1.0 <= data$T5873204 & data$T5873204 <= 5.0] <- 1.0
  data$T5873204 <- factor(data$T5873204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T5873205[1.0 <= data$T5873205 & data$T5873205 <= 6.0] <- 1.0
  data$T5873205 <- factor(data$T5873205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T5873206[1.0 <= data$T5873206 & data$T5873206 <= 7.0] <- 1.0
  data$T5873206 <- factor(data$T5873206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T5873207[1.0 <= data$T5873207 & data$T5873207 <= 8.0] <- 1.0
  data$T5873207 <- factor(data$T5873207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T5873208[1.0 <= data$T5873208 & data$T5873208 <= 9.0] <- 1.0
  data$T5873208 <- factor(data$T5873208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T5873209[1.0 <= data$T5873209 & data$T5873209 <= 10.0] <- 1.0
  data$T5873209 <- factor(data$T5873209, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T5873210[1.0 <= data$T5873210 & data$T5873210 <= 11.0] <- 1.0
  data$T5873210 <- factor(data$T5873210, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T5873211[1.0 <= data$T5873211 & data$T5873211 <= 12.0] <- 1.0
  data$T5873211 <- factor(data$T5873211, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T5873212[1.0 <= data$T5873212 & data$T5873212 <= 13.0] <- 1.0
  data$T5873212 <- factor(data$T5873212, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T7297400 <- factor(data$T7297400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T7297401[1.0 <= data$T7297401 & data$T7297401 <= 2.0] <- 1.0
  data$T7297401 <- factor(data$T7297401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T7297402[1.0 <= data$T7297402 & data$T7297402 <= 3.0] <- 1.0
  data$T7297402 <- factor(data$T7297402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T7297403[1.0 <= data$T7297403 & data$T7297403 <= 4.0] <- 1.0
  data$T7297403 <- factor(data$T7297403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T7297404[1.0 <= data$T7297404 & data$T7297404 <= 5.0] <- 1.0
  data$T7297404 <- factor(data$T7297404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T7297405[1.0 <= data$T7297405 & data$T7297405 <= 6.0] <- 1.0
  data$T7297405 <- factor(data$T7297405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T7297406[1.0 <= data$T7297406 & data$T7297406 <= 7.0] <- 1.0
  data$T7297406 <- factor(data$T7297406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T7297407[1.0 <= data$T7297407 & data$T7297407 <= 8.0] <- 1.0
  data$T7297407 <- factor(data$T7297407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T7297408[1.0 <= data$T7297408 & data$T7297408 <= 9.0] <- 1.0
  data$T7297408 <- factor(data$T7297408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T7297409[1.0 <= data$T7297409 & data$T7297409 <= 10.0] <- 1.0
  data$T7297409 <- factor(data$T7297409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T7297410[1.0 <= data$T7297410 & data$T7297410 <= 11.0] <- 1.0
  data$T7297410 <- factor(data$T7297410, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T7297411[1.0 <= data$T7297411 & data$T7297411 <= 12.0] <- 1.0
  data$T7297411 <- factor(data$T7297411, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T7297412[1.0 <= data$T7297412 & data$T7297412 <= 13.0] <- 1.0
  data$T7297412 <- factor(data$T7297412, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T7297500 <- factor(data$T7297500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T7297501[1.0 <= data$T7297501 & data$T7297501 <= 2.0] <- 1.0
  data$T7297501 <- factor(data$T7297501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T7297502[1.0 <= data$T7297502 & data$T7297502 <= 3.0] <- 1.0
  data$T7297502 <- factor(data$T7297502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T7297503[1.0 <= data$T7297503 & data$T7297503 <= 4.0] <- 1.0
  data$T7297503 <- factor(data$T7297503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T7297504[1.0 <= data$T7297504 & data$T7297504 <= 5.0] <- 1.0
  data$T7297504 <- factor(data$T7297504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T7297505[1.0 <= data$T7297505 & data$T7297505 <= 6.0] <- 1.0
  data$T7297505 <- factor(data$T7297505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T7297506[1.0 <= data$T7297506 & data$T7297506 <= 7.0] <- 1.0
  data$T7297506 <- factor(data$T7297506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T7297507[1.0 <= data$T7297507 & data$T7297507 <= 8.0] <- 1.0
  data$T7297507 <- factor(data$T7297507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T7297508[1.0 <= data$T7297508 & data$T7297508 <= 9.0] <- 1.0
  data$T7297508 <- factor(data$T7297508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T7297509[1.0 <= data$T7297509 & data$T7297509 <= 10.0] <- 1.0
  data$T7297509 <- factor(data$T7297509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T7297510[1.0 <= data$T7297510 & data$T7297510 <= 11.0] <- 1.0
  data$T7297510 <- factor(data$T7297510, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T7297511[1.0 <= data$T7297511 & data$T7297511 <= 12.0] <- 1.0
  data$T7297511 <- factor(data$T7297511, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T7297512[1.0 <= data$T7297512 & data$T7297512 <= 13.0] <- 1.0
  data$T7297512 <- factor(data$T7297512, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T7297600 <- factor(data$T7297600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T7297601[1.0 <= data$T7297601 & data$T7297601 <= 2.0] <- 1.0
  data$T7297601 <- factor(data$T7297601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T7297602[1.0 <= data$T7297602 & data$T7297602 <= 3.0] <- 1.0
  data$T7297602 <- factor(data$T7297602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T7297603[1.0 <= data$T7297603 & data$T7297603 <= 4.0] <- 1.0
  data$T7297603 <- factor(data$T7297603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T7297604[1.0 <= data$T7297604 & data$T7297604 <= 5.0] <- 1.0
  data$T7297604 <- factor(data$T7297604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T7297605[1.0 <= data$T7297605 & data$T7297605 <= 6.0] <- 1.0
  data$T7297605 <- factor(data$T7297605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T7297606[1.0 <= data$T7297606 & data$T7297606 <= 7.0] <- 1.0
  data$T7297606 <- factor(data$T7297606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T7297607[1.0 <= data$T7297607 & data$T7297607 <= 8.0] <- 1.0
  data$T7297607 <- factor(data$T7297607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T7297608[1.0 <= data$T7297608 & data$T7297608 <= 9.0] <- 1.0
  data$T7297608 <- factor(data$T7297608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T7297609[1.0 <= data$T7297609 & data$T7297609 <= 10.0] <- 1.0
  data$T7297609 <- factor(data$T7297609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T7297610[1.0 <= data$T7297610 & data$T7297610 <= 11.0] <- 1.0
  data$T7297610 <- factor(data$T7297610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T7297611[1.0 <= data$T7297611 & data$T7297611 <= 12.0] <- 1.0
  data$T7297611 <- factor(data$T7297611, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T7297612[1.0 <= data$T7297612 & data$T7297612 <= 13.0] <- 1.0
  data$T7297612 <- factor(data$T7297612, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T7297700 <- factor(data$T7297700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T7297701[1.0 <= data$T7297701 & data$T7297701 <= 2.0] <- 1.0
  data$T7297701 <- factor(data$T7297701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T7297702[1.0 <= data$T7297702 & data$T7297702 <= 3.0] <- 1.0
  data$T7297702 <- factor(data$T7297702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T7297703[1.0 <= data$T7297703 & data$T7297703 <= 4.0] <- 1.0
  data$T7297703 <- factor(data$T7297703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T7297704[1.0 <= data$T7297704 & data$T7297704 <= 5.0] <- 1.0
  data$T7297704 <- factor(data$T7297704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T7297705[1.0 <= data$T7297705 & data$T7297705 <= 6.0] <- 1.0
  data$T7297705 <- factor(data$T7297705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T7297706[1.0 <= data$T7297706 & data$T7297706 <= 7.0] <- 1.0
  data$T7297706 <- factor(data$T7297706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T7297707[1.0 <= data$T7297707 & data$T7297707 <= 8.0] <- 1.0
  data$T7297707 <- factor(data$T7297707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T7297708[1.0 <= data$T7297708 & data$T7297708 <= 9.0] <- 1.0
  data$T7297708 <- factor(data$T7297708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T7297709[1.0 <= data$T7297709 & data$T7297709 <= 10.0] <- 1.0
  data$T7297709 <- factor(data$T7297709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T7297710[1.0 <= data$T7297710 & data$T7297710 <= 11.0] <- 1.0
  data$T7297710 <- factor(data$T7297710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T7297711[1.0 <= data$T7297711 & data$T7297711 <= 12.0] <- 1.0
  data$T7297711 <- factor(data$T7297711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T7297712[1.0 <= data$T7297712 & data$T7297712 <= 13.0] <- 1.0
  data$T7297712 <- factor(data$T7297712, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T8802400 <- factor(data$T8802400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T8802401[1.0 <= data$T8802401 & data$T8802401 <= 2.0] <- 1.0
  data$T8802401 <- factor(data$T8802401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T8802402[1.0 <= data$T8802402 & data$T8802402 <= 3.0] <- 1.0
  data$T8802402 <- factor(data$T8802402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T8802403[1.0 <= data$T8802403 & data$T8802403 <= 4.0] <- 1.0
  data$T8802403 <- factor(data$T8802403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T8802404[1.0 <= data$T8802404 & data$T8802404 <= 5.0] <- 1.0
  data$T8802404 <- factor(data$T8802404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T8802405[1.0 <= data$T8802405 & data$T8802405 <= 6.0] <- 1.0
  data$T8802405 <- factor(data$T8802405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T8802406[1.0 <= data$T8802406 & data$T8802406 <= 7.0] <- 1.0
  data$T8802406 <- factor(data$T8802406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T8802407[1.0 <= data$T8802407 & data$T8802407 <= 8.0] <- 1.0
  data$T8802407 <- factor(data$T8802407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T8802408[1.0 <= data$T8802408 & data$T8802408 <= 9.0] <- 1.0
  data$T8802408 <- factor(data$T8802408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T8802409[1.0 <= data$T8802409 & data$T8802409 <= 10.0] <- 1.0
  data$T8802409 <- factor(data$T8802409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T8802410[1.0 <= data$T8802410 & data$T8802410 <= 11.0] <- 1.0
  data$T8802410 <- factor(data$T8802410, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T8802411[1.0 <= data$T8802411 & data$T8802411 <= 12.0] <- 1.0
  data$T8802411 <- factor(data$T8802411, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T8802412[1.0 <= data$T8802412 & data$T8802412 <= 13.0] <- 1.0
  data$T8802412 <- factor(data$T8802412, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T8802500 <- factor(data$T8802500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T8802501[1.0 <= data$T8802501 & data$T8802501 <= 2.0] <- 1.0
  data$T8802501 <- factor(data$T8802501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T8802502[1.0 <= data$T8802502 & data$T8802502 <= 3.0] <- 1.0
  data$T8802502 <- factor(data$T8802502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T8802503[1.0 <= data$T8802503 & data$T8802503 <= 4.0] <- 1.0
  data$T8802503 <- factor(data$T8802503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T8802504[1.0 <= data$T8802504 & data$T8802504 <= 5.0] <- 1.0
  data$T8802504 <- factor(data$T8802504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T8802505[1.0 <= data$T8802505 & data$T8802505 <= 6.0] <- 1.0
  data$T8802505 <- factor(data$T8802505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T8802506[1.0 <= data$T8802506 & data$T8802506 <= 7.0] <- 1.0
  data$T8802506 <- factor(data$T8802506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T8802507[1.0 <= data$T8802507 & data$T8802507 <= 8.0] <- 1.0
  data$T8802507 <- factor(data$T8802507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T8802508[1.0 <= data$T8802508 & data$T8802508 <= 9.0] <- 1.0
  data$T8802508 <- factor(data$T8802508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T8802509[1.0 <= data$T8802509 & data$T8802509 <= 10.0] <- 1.0
  data$T8802509 <- factor(data$T8802509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T8802510[1.0 <= data$T8802510 & data$T8802510 <= 11.0] <- 1.0
  data$T8802510 <- factor(data$T8802510, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T8802511[1.0 <= data$T8802511 & data$T8802511 <= 12.0] <- 1.0
  data$T8802511 <- factor(data$T8802511, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T8802512[1.0 <= data$T8802512 & data$T8802512 <= 13.0] <- 1.0
  data$T8802512 <- factor(data$T8802512, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T8802600 <- factor(data$T8802600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T8802601[1.0 <= data$T8802601 & data$T8802601 <= 2.0] <- 1.0
  data$T8802601 <- factor(data$T8802601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T8802602[1.0 <= data$T8802602 & data$T8802602 <= 3.0] <- 1.0
  data$T8802602 <- factor(data$T8802602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T8802603[1.0 <= data$T8802603 & data$T8802603 <= 4.0] <- 1.0
  data$T8802603 <- factor(data$T8802603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T8802604[1.0 <= data$T8802604 & data$T8802604 <= 5.0] <- 1.0
  data$T8802604 <- factor(data$T8802604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T8802605[1.0 <= data$T8802605 & data$T8802605 <= 6.0] <- 1.0
  data$T8802605 <- factor(data$T8802605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T8802606[1.0 <= data$T8802606 & data$T8802606 <= 7.0] <- 1.0
  data$T8802606 <- factor(data$T8802606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T8802607[1.0 <= data$T8802607 & data$T8802607 <= 8.0] <- 1.0
  data$T8802607 <- factor(data$T8802607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T8802608[1.0 <= data$T8802608 & data$T8802608 <= 9.0] <- 1.0
  data$T8802608 <- factor(data$T8802608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T8802609[1.0 <= data$T8802609 & data$T8802609 <= 10.0] <- 1.0
  data$T8802609 <- factor(data$T8802609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T8802610[1.0 <= data$T8802610 & data$T8802610 <= 11.0] <- 1.0
  data$T8802610 <- factor(data$T8802610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T8802611[1.0 <= data$T8802611 & data$T8802611 <= 12.0] <- 1.0
  data$T8802611 <- factor(data$T8802611, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T8802612[1.0 <= data$T8802612 & data$T8802612 <= 13.0] <- 1.0
  data$T8802612 <- factor(data$T8802612, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T8802700 <- factor(data$T8802700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T8802701[1.0 <= data$T8802701 & data$T8802701 <= 2.0] <- 1.0
  data$T8802701 <- factor(data$T8802701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T8802702[1.0 <= data$T8802702 & data$T8802702 <= 3.0] <- 1.0
  data$T8802702 <- factor(data$T8802702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T8802703[1.0 <= data$T8802703 & data$T8802703 <= 4.0] <- 1.0
  data$T8802703 <- factor(data$T8802703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T8802704[1.0 <= data$T8802704 & data$T8802704 <= 5.0] <- 1.0
  data$T8802704 <- factor(data$T8802704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T8802705[1.0 <= data$T8802705 & data$T8802705 <= 6.0] <- 1.0
  data$T8802705 <- factor(data$T8802705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T8802706[1.0 <= data$T8802706 & data$T8802706 <= 7.0] <- 1.0
  data$T8802706 <- factor(data$T8802706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T8802707[1.0 <= data$T8802707 & data$T8802707 <= 8.0] <- 1.0
  data$T8802707 <- factor(data$T8802707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T8802708[1.0 <= data$T8802708 & data$T8802708 <= 9.0] <- 1.0
  data$T8802708 <- factor(data$T8802708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T8802709[1.0 <= data$T8802709 & data$T8802709 <= 10.0] <- 1.0
  data$T8802709 <- factor(data$T8802709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T8802710[1.0 <= data$T8802710 & data$T8802710 <= 11.0] <- 1.0
  data$T8802710 <- factor(data$T8802710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T8802711[1.0 <= data$T8802711 & data$T8802711 <= 12.0] <- 1.0
  data$T8802711 <- factor(data$T8802711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T8802712[1.0 <= data$T8802712 & data$T8802712 <= 13.0] <- 1.0
  data$T8802712 <- factor(data$T8802712, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T8802800 <- factor(data$T8802800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T8802801[1.0 <= data$T8802801 & data$T8802801 <= 2.0] <- 1.0
  data$T8802801 <- factor(data$T8802801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T8802802[1.0 <= data$T8802802 & data$T8802802 <= 3.0] <- 1.0
  data$T8802802 <- factor(data$T8802802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T8802803[1.0 <= data$T8802803 & data$T8802803 <= 4.0] <- 1.0
  data$T8802803 <- factor(data$T8802803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T8802804[1.0 <= data$T8802804 & data$T8802804 <= 5.0] <- 1.0
  data$T8802804 <- factor(data$T8802804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T8802805[1.0 <= data$T8802805 & data$T8802805 <= 6.0] <- 1.0
  data$T8802805 <- factor(data$T8802805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T8802806[1.0 <= data$T8802806 & data$T8802806 <= 7.0] <- 1.0
  data$T8802806 <- factor(data$T8802806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T8802807[1.0 <= data$T8802807 & data$T8802807 <= 8.0] <- 1.0
  data$T8802807 <- factor(data$T8802807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T8802808[1.0 <= data$T8802808 & data$T8802808 <= 9.0] <- 1.0
  data$T8802808 <- factor(data$T8802808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T8802809[1.0 <= data$T8802809 & data$T8802809 <= 10.0] <- 1.0
  data$T8802809 <- factor(data$T8802809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T8802810[1.0 <= data$T8802810 & data$T8802810 <= 11.0] <- 1.0
  data$T8802810 <- factor(data$T8802810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T8802811[1.0 <= data$T8802811 & data$T8802811 <= 12.0] <- 1.0
  data$T8802811 <- factor(data$T8802811, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T8802812[1.0 <= data$T8802812 & data$T8802812 <= 13.0] <- 1.0
  data$T8802812 <- factor(data$T8802812, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T8802900 <- factor(data$T8802900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T8802901[1.0 <= data$T8802901 & data$T8802901 <= 2.0] <- 1.0
  data$T8802901 <- factor(data$T8802901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T8802902[1.0 <= data$T8802902 & data$T8802902 <= 3.0] <- 1.0
  data$T8802902 <- factor(data$T8802902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T8802903[1.0 <= data$T8802903 & data$T8802903 <= 4.0] <- 1.0
  data$T8802903 <- factor(data$T8802903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T8802904[1.0 <= data$T8802904 & data$T8802904 <= 5.0] <- 1.0
  data$T8802904 <- factor(data$T8802904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T8802905[1.0 <= data$T8802905 & data$T8802905 <= 6.0] <- 1.0
  data$T8802905 <- factor(data$T8802905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T8802906[1.0 <= data$T8802906 & data$T8802906 <= 7.0] <- 1.0
  data$T8802906 <- factor(data$T8802906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T8802907[1.0 <= data$T8802907 & data$T8802907 <= 8.0] <- 1.0
  data$T8802907 <- factor(data$T8802907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T8802908[1.0 <= data$T8802908 & data$T8802908 <= 9.0] <- 1.0
  data$T8802908 <- factor(data$T8802908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T8802909[1.0 <= data$T8802909 & data$T8802909 <= 10.0] <- 1.0
  data$T8802909 <- factor(data$T8802909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T8802910[1.0 <= data$T8802910 & data$T8802910 <= 11.0] <- 1.0
  data$T8802910 <- factor(data$T8802910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T8802911[1.0 <= data$T8802911 & data$T8802911 <= 12.0] <- 1.0
  data$T8802911 <- factor(data$T8802911, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T8802912[1.0 <= data$T8802912 & data$T8802912 <= 13.0] <- 1.0
  data$T8802912 <- factor(data$T8802912, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$T8803000 <- factor(data$T8803000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$T8803001[1.0 <= data$T8803001 & data$T8803001 <= 2.0] <- 1.0
  data$T8803001 <- factor(data$T8803001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$T8803002[1.0 <= data$T8803002 & data$T8803002 <= 3.0] <- 1.0
  data$T8803002 <- factor(data$T8803002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$T8803003[1.0 <= data$T8803003 & data$T8803003 <= 4.0] <- 1.0
  data$T8803003 <- factor(data$T8803003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$T8803004[1.0 <= data$T8803004 & data$T8803004 <= 5.0] <- 1.0
  data$T8803004 <- factor(data$T8803004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$T8803005[1.0 <= data$T8803005 & data$T8803005 <= 6.0] <- 1.0
  data$T8803005 <- factor(data$T8803005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$T8803006[1.0 <= data$T8803006 & data$T8803006 <= 7.0] <- 1.0
  data$T8803006 <- factor(data$T8803006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$T8803007[1.0 <= data$T8803007 & data$T8803007 <= 8.0] <- 1.0
  data$T8803007 <- factor(data$T8803007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$T8803008[1.0 <= data$T8803008 & data$T8803008 <= 9.0] <- 1.0
  data$T8803008 <- factor(data$T8803008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$T8803009[1.0 <= data$T8803009 & data$T8803009 <= 10.0] <- 1.0
  data$T8803009 <- factor(data$T8803009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$T8803010[1.0 <= data$T8803010 & data$T8803010 <= 11.0] <- 1.0
  data$T8803010 <- factor(data$T8803010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$T8803011[1.0 <= data$T8803011 & data$T8803011 <= 12.0] <- 1.0
  data$T8803011 <- factor(data$T8803011, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$T8803012[1.0 <= data$T8803012 & data$T8803012 <= 13.0] <- 1.0
  data$T8803012 <- factor(data$T8803012, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U0724700 <- factor(data$U0724700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U0724701[1.0 <= data$U0724701 & data$U0724701 <= 2.0] <- 1.0
  data$U0724701 <- factor(data$U0724701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U0724702[1.0 <= data$U0724702 & data$U0724702 <= 3.0] <- 1.0
  data$U0724702 <- factor(data$U0724702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U0724703[1.0 <= data$U0724703 & data$U0724703 <= 4.0] <- 1.0
  data$U0724703 <- factor(data$U0724703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U0724704[1.0 <= data$U0724704 & data$U0724704 <= 5.0] <- 1.0
  data$U0724704 <- factor(data$U0724704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U0724705[1.0 <= data$U0724705 & data$U0724705 <= 6.0] <- 1.0
  data$U0724705 <- factor(data$U0724705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U0724706[1.0 <= data$U0724706 & data$U0724706 <= 7.0] <- 1.0
  data$U0724706 <- factor(data$U0724706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U0724707[1.0 <= data$U0724707 & data$U0724707 <= 8.0] <- 1.0
  data$U0724707 <- factor(data$U0724707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U0724708[1.0 <= data$U0724708 & data$U0724708 <= 9.0] <- 1.0
  data$U0724708 <- factor(data$U0724708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U0724709[1.0 <= data$U0724709 & data$U0724709 <= 10.0] <- 1.0
  data$U0724709 <- factor(data$U0724709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U0724710[1.0 <= data$U0724710 & data$U0724710 <= 11.0] <- 1.0
  data$U0724710 <- factor(data$U0724710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U0724711[1.0 <= data$U0724711 & data$U0724711 <= 12.0] <- 1.0
  data$U0724711 <- factor(data$U0724711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U0724712[1.0 <= data$U0724712 & data$U0724712 <= 13.0] <- 1.0
  data$U0724712 <- factor(data$U0724712, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U0724800 <- factor(data$U0724800, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U0724801[1.0 <= data$U0724801 & data$U0724801 <= 2.0] <- 1.0
  data$U0724801 <- factor(data$U0724801, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U0724802[1.0 <= data$U0724802 & data$U0724802 <= 3.0] <- 1.0
  data$U0724802 <- factor(data$U0724802, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U0724803[1.0 <= data$U0724803 & data$U0724803 <= 4.0] <- 1.0
  data$U0724803 <- factor(data$U0724803, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U0724804[1.0 <= data$U0724804 & data$U0724804 <= 5.0] <- 1.0
  data$U0724804 <- factor(data$U0724804, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U0724805[1.0 <= data$U0724805 & data$U0724805 <= 6.0] <- 1.0
  data$U0724805 <- factor(data$U0724805, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U0724806[1.0 <= data$U0724806 & data$U0724806 <= 7.0] <- 1.0
  data$U0724806 <- factor(data$U0724806, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U0724807[1.0 <= data$U0724807 & data$U0724807 <= 8.0] <- 1.0
  data$U0724807 <- factor(data$U0724807, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U0724808[1.0 <= data$U0724808 & data$U0724808 <= 9.0] <- 1.0
  data$U0724808 <- factor(data$U0724808, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U0724809[1.0 <= data$U0724809 & data$U0724809 <= 10.0] <- 1.0
  data$U0724809 <- factor(data$U0724809, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U0724810[1.0 <= data$U0724810 & data$U0724810 <= 11.0] <- 1.0
  data$U0724810 <- factor(data$U0724810, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U0724811[1.0 <= data$U0724811 & data$U0724811 <= 12.0] <- 1.0
  data$U0724811 <- factor(data$U0724811, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U0724812[1.0 <= data$U0724812 & data$U0724812 <= 13.0] <- 1.0
  data$U0724812 <- factor(data$U0724812, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U0724900 <- factor(data$U0724900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U0724901[1.0 <= data$U0724901 & data$U0724901 <= 2.0] <- 1.0
  data$U0724901 <- factor(data$U0724901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U0724902[1.0 <= data$U0724902 & data$U0724902 <= 3.0] <- 1.0
  data$U0724902 <- factor(data$U0724902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U0724903[1.0 <= data$U0724903 & data$U0724903 <= 4.0] <- 1.0
  data$U0724903 <- factor(data$U0724903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U0724904[1.0 <= data$U0724904 & data$U0724904 <= 5.0] <- 1.0
  data$U0724904 <- factor(data$U0724904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U0724905[1.0 <= data$U0724905 & data$U0724905 <= 6.0] <- 1.0
  data$U0724905 <- factor(data$U0724905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U0724906[1.0 <= data$U0724906 & data$U0724906 <= 7.0] <- 1.0
  data$U0724906 <- factor(data$U0724906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U0724907[1.0 <= data$U0724907 & data$U0724907 <= 8.0] <- 1.0
  data$U0724907 <- factor(data$U0724907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U0724908[1.0 <= data$U0724908 & data$U0724908 <= 9.0] <- 1.0
  data$U0724908 <- factor(data$U0724908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U0724909[1.0 <= data$U0724909 & data$U0724909 <= 10.0] <- 1.0
  data$U0724909 <- factor(data$U0724909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U0724910[1.0 <= data$U0724910 & data$U0724910 <= 11.0] <- 1.0
  data$U0724910 <- factor(data$U0724910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U0724911[1.0 <= data$U0724911 & data$U0724911 <= 12.0] <- 1.0
  data$U0724911 <- factor(data$U0724911, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U0724912[1.0 <= data$U0724912 & data$U0724912 <= 13.0] <- 1.0
  data$U0724912 <- factor(data$U0724912, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U0725000 <- factor(data$U0725000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U0725001[1.0 <= data$U0725001 & data$U0725001 <= 2.0] <- 1.0
  data$U0725001 <- factor(data$U0725001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U0725002[1.0 <= data$U0725002 & data$U0725002 <= 3.0] <- 1.0
  data$U0725002 <- factor(data$U0725002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U0725003[1.0 <= data$U0725003 & data$U0725003 <= 4.0] <- 1.0
  data$U0725003 <- factor(data$U0725003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U0725004[1.0 <= data$U0725004 & data$U0725004 <= 5.0] <- 1.0
  data$U0725004 <- factor(data$U0725004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U0725005[1.0 <= data$U0725005 & data$U0725005 <= 6.0] <- 1.0
  data$U0725005 <- factor(data$U0725005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U0725006[1.0 <= data$U0725006 & data$U0725006 <= 7.0] <- 1.0
  data$U0725006 <- factor(data$U0725006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U0725007[1.0 <= data$U0725007 & data$U0725007 <= 8.0] <- 1.0
  data$U0725007 <- factor(data$U0725007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U0725008[1.0 <= data$U0725008 & data$U0725008 <= 9.0] <- 1.0
  data$U0725008 <- factor(data$U0725008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U0725009[1.0 <= data$U0725009 & data$U0725009 <= 10.0] <- 1.0
  data$U0725009 <- factor(data$U0725009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U0725010[1.0 <= data$U0725010 & data$U0725010 <= 11.0] <- 1.0
  data$U0725010 <- factor(data$U0725010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U0725011[1.0 <= data$U0725011 & data$U0725011 <= 12.0] <- 1.0
  data$U0725011 <- factor(data$U0725011, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U0725012[1.0 <= data$U0725012 & data$U0725012 <= 13.0] <- 1.0
  data$U0725012 <- factor(data$U0725012, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U0725100 <- factor(data$U0725100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U0725101[1.0 <= data$U0725101 & data$U0725101 <= 2.0] <- 1.0
  data$U0725101 <- factor(data$U0725101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U0725102[1.0 <= data$U0725102 & data$U0725102 <= 3.0] <- 1.0
  data$U0725102 <- factor(data$U0725102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U0725103[1.0 <= data$U0725103 & data$U0725103 <= 4.0] <- 1.0
  data$U0725103 <- factor(data$U0725103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U0725104[1.0 <= data$U0725104 & data$U0725104 <= 5.0] <- 1.0
  data$U0725104 <- factor(data$U0725104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U0725105[1.0 <= data$U0725105 & data$U0725105 <= 6.0] <- 1.0
  data$U0725105 <- factor(data$U0725105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U0725106[1.0 <= data$U0725106 & data$U0725106 <= 7.0] <- 1.0
  data$U0725106 <- factor(data$U0725106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U0725107[1.0 <= data$U0725107 & data$U0725107 <= 8.0] <- 1.0
  data$U0725107 <- factor(data$U0725107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U0725108[1.0 <= data$U0725108 & data$U0725108 <= 9.0] <- 1.0
  data$U0725108 <- factor(data$U0725108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U0725109[1.0 <= data$U0725109 & data$U0725109 <= 10.0] <- 1.0
  data$U0725109 <- factor(data$U0725109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U0725110[1.0 <= data$U0725110 & data$U0725110 <= 11.0] <- 1.0
  data$U0725110 <- factor(data$U0725110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U0725111[1.0 <= data$U0725111 & data$U0725111 <= 12.0] <- 1.0
  data$U0725111 <- factor(data$U0725111, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U0725112[1.0 <= data$U0725112 & data$U0725112 <= 13.0] <- 1.0
  data$U0725112 <- factor(data$U0725112, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U0725200 <- factor(data$U0725200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U0725201[1.0 <= data$U0725201 & data$U0725201 <= 2.0] <- 1.0
  data$U0725201 <- factor(data$U0725201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U0725202[1.0 <= data$U0725202 & data$U0725202 <= 3.0] <- 1.0
  data$U0725202 <- factor(data$U0725202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U0725203[1.0 <= data$U0725203 & data$U0725203 <= 4.0] <- 1.0
  data$U0725203 <- factor(data$U0725203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U0725204[1.0 <= data$U0725204 & data$U0725204 <= 5.0] <- 1.0
  data$U0725204 <- factor(data$U0725204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U0725205[1.0 <= data$U0725205 & data$U0725205 <= 6.0] <- 1.0
  data$U0725205 <- factor(data$U0725205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U0725206[1.0 <= data$U0725206 & data$U0725206 <= 7.0] <- 1.0
  data$U0725206 <- factor(data$U0725206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U0725207[1.0 <= data$U0725207 & data$U0725207 <= 8.0] <- 1.0
  data$U0725207 <- factor(data$U0725207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U0725208[1.0 <= data$U0725208 & data$U0725208 <= 9.0] <- 1.0
  data$U0725208 <- factor(data$U0725208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U0725209[1.0 <= data$U0725209 & data$U0725209 <= 10.0] <- 1.0
  data$U0725209 <- factor(data$U0725209, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U0725210[1.0 <= data$U0725210 & data$U0725210 <= 11.0] <- 1.0
  data$U0725210 <- factor(data$U0725210, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U0725211[1.0 <= data$U0725211 & data$U0725211 <= 12.0] <- 1.0
  data$U0725211 <- factor(data$U0725211, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U0725212[1.0 <= data$U0725212 & data$U0725212 <= 13.0] <- 1.0
  data$U0725212 <- factor(data$U0725212, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U0725300 <- factor(data$U0725300, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U0725301[1.0 <= data$U0725301 & data$U0725301 <= 2.0] <- 1.0
  data$U0725301 <- factor(data$U0725301, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U0725302[1.0 <= data$U0725302 & data$U0725302 <= 3.0] <- 1.0
  data$U0725302 <- factor(data$U0725302, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U0725303[1.0 <= data$U0725303 & data$U0725303 <= 4.0] <- 1.0
  data$U0725303 <- factor(data$U0725303, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U0725304[1.0 <= data$U0725304 & data$U0725304 <= 5.0] <- 1.0
  data$U0725304 <- factor(data$U0725304, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U0725305[1.0 <= data$U0725305 & data$U0725305 <= 6.0] <- 1.0
  data$U0725305 <- factor(data$U0725305, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U0725306[1.0 <= data$U0725306 & data$U0725306 <= 7.0] <- 1.0
  data$U0725306 <- factor(data$U0725306, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U0725307[1.0 <= data$U0725307 & data$U0725307 <= 8.0] <- 1.0
  data$U0725307 <- factor(data$U0725307, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U0725308[1.0 <= data$U0725308 & data$U0725308 <= 9.0] <- 1.0
  data$U0725308 <- factor(data$U0725308, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U0725309[1.0 <= data$U0725309 & data$U0725309 <= 10.0] <- 1.0
  data$U0725309 <- factor(data$U0725309, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U0725310[1.0 <= data$U0725310 & data$U0725310 <= 11.0] <- 1.0
  data$U0725310 <- factor(data$U0725310, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U0725311[1.0 <= data$U0725311 & data$U0725311 <= 12.0] <- 1.0
  data$U0725311 <- factor(data$U0725311, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U0725312[1.0 <= data$U0725312 & data$U0725312 <= 13.0] <- 1.0
  data$U0725312 <- factor(data$U0725312, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2664900 <- factor(data$U2664900, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2664901[1.0 <= data$U2664901 & data$U2664901 <= 2.0] <- 1.0
  data$U2664901 <- factor(data$U2664901, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2664902[1.0 <= data$U2664902 & data$U2664902 <= 3.0] <- 1.0
  data$U2664902 <- factor(data$U2664902, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2664903[1.0 <= data$U2664903 & data$U2664903 <= 4.0] <- 1.0
  data$U2664903 <- factor(data$U2664903, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2664904[1.0 <= data$U2664904 & data$U2664904 <= 5.0] <- 1.0
  data$U2664904 <- factor(data$U2664904, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2664905[1.0 <= data$U2664905 & data$U2664905 <= 6.0] <- 1.0
  data$U2664905 <- factor(data$U2664905, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2664906[1.0 <= data$U2664906 & data$U2664906 <= 7.0] <- 1.0
  data$U2664906 <- factor(data$U2664906, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2664907[1.0 <= data$U2664907 & data$U2664907 <= 8.0] <- 1.0
  data$U2664907 <- factor(data$U2664907, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2664908[1.0 <= data$U2664908 & data$U2664908 <= 9.0] <- 1.0
  data$U2664908 <- factor(data$U2664908, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2664909[1.0 <= data$U2664909 & data$U2664909 <= 10.0] <- 1.0
  data$U2664909 <- factor(data$U2664909, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2664910[1.0 <= data$U2664910 & data$U2664910 <= 11.0] <- 1.0
  data$U2664910 <- factor(data$U2664910, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2664911[1.0 <= data$U2664911 & data$U2664911 <= 12.0] <- 1.0
  data$U2664911 <- factor(data$U2664911, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2664912[1.0 <= data$U2664912 & data$U2664912 <= 13.0] <- 1.0
  data$U2664912 <- factor(data$U2664912, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2665000 <- factor(data$U2665000, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2665001[1.0 <= data$U2665001 & data$U2665001 <= 2.0] <- 1.0
  data$U2665001 <- factor(data$U2665001, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2665002[1.0 <= data$U2665002 & data$U2665002 <= 3.0] <- 1.0
  data$U2665002 <- factor(data$U2665002, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2665003[1.0 <= data$U2665003 & data$U2665003 <= 4.0] <- 1.0
  data$U2665003 <- factor(data$U2665003, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2665004[1.0 <= data$U2665004 & data$U2665004 <= 5.0] <- 1.0
  data$U2665004 <- factor(data$U2665004, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2665005[1.0 <= data$U2665005 & data$U2665005 <= 6.0] <- 1.0
  data$U2665005 <- factor(data$U2665005, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2665006[1.0 <= data$U2665006 & data$U2665006 <= 7.0] <- 1.0
  data$U2665006 <- factor(data$U2665006, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2665007[1.0 <= data$U2665007 & data$U2665007 <= 8.0] <- 1.0
  data$U2665007 <- factor(data$U2665007, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2665008[1.0 <= data$U2665008 & data$U2665008 <= 9.0] <- 1.0
  data$U2665008 <- factor(data$U2665008, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2665009[1.0 <= data$U2665009 & data$U2665009 <= 10.0] <- 1.0
  data$U2665009 <- factor(data$U2665009, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2665010[1.0 <= data$U2665010 & data$U2665010 <= 11.0] <- 1.0
  data$U2665010 <- factor(data$U2665010, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2665011[1.0 <= data$U2665011 & data$U2665011 <= 12.0] <- 1.0
  data$U2665011 <- factor(data$U2665011, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2665012[1.0 <= data$U2665012 & data$U2665012 <= 13.0] <- 1.0
  data$U2665012 <- factor(data$U2665012, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2665100 <- factor(data$U2665100, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2665101[1.0 <= data$U2665101 & data$U2665101 <= 2.0] <- 1.0
  data$U2665101 <- factor(data$U2665101, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2665102[1.0 <= data$U2665102 & data$U2665102 <= 3.0] <- 1.0
  data$U2665102 <- factor(data$U2665102, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2665103[1.0 <= data$U2665103 & data$U2665103 <= 4.0] <- 1.0
  data$U2665103 <- factor(data$U2665103, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2665104[1.0 <= data$U2665104 & data$U2665104 <= 5.0] <- 1.0
  data$U2665104 <- factor(data$U2665104, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2665105[1.0 <= data$U2665105 & data$U2665105 <= 6.0] <- 1.0
  data$U2665105 <- factor(data$U2665105, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2665106[1.0 <= data$U2665106 & data$U2665106 <= 7.0] <- 1.0
  data$U2665106 <- factor(data$U2665106, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2665107[1.0 <= data$U2665107 & data$U2665107 <= 8.0] <- 1.0
  data$U2665107 <- factor(data$U2665107, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2665108[1.0 <= data$U2665108 & data$U2665108 <= 9.0] <- 1.0
  data$U2665108 <- factor(data$U2665108, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2665109[1.0 <= data$U2665109 & data$U2665109 <= 10.0] <- 1.0
  data$U2665109 <- factor(data$U2665109, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2665110[1.0 <= data$U2665110 & data$U2665110 <= 11.0] <- 1.0
  data$U2665110 <- factor(data$U2665110, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2665111[1.0 <= data$U2665111 & data$U2665111 <= 12.0] <- 1.0
  data$U2665111 <- factor(data$U2665111, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2665112[1.0 <= data$U2665112 & data$U2665112 <= 13.0] <- 1.0
  data$U2665112 <- factor(data$U2665112, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2665200 <- factor(data$U2665200, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2665201[1.0 <= data$U2665201 & data$U2665201 <= 2.0] <- 1.0
  data$U2665201 <- factor(data$U2665201, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2665202[1.0 <= data$U2665202 & data$U2665202 <= 3.0] <- 1.0
  data$U2665202 <- factor(data$U2665202, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2665203[1.0 <= data$U2665203 & data$U2665203 <= 4.0] <- 1.0
  data$U2665203 <- factor(data$U2665203, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2665204[1.0 <= data$U2665204 & data$U2665204 <= 5.0] <- 1.0
  data$U2665204 <- factor(data$U2665204, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2665205[1.0 <= data$U2665205 & data$U2665205 <= 6.0] <- 1.0
  data$U2665205 <- factor(data$U2665205, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2665206[1.0 <= data$U2665206 & data$U2665206 <= 7.0] <- 1.0
  data$U2665206 <- factor(data$U2665206, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2665207[1.0 <= data$U2665207 & data$U2665207 <= 8.0] <- 1.0
  data$U2665207 <- factor(data$U2665207, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2665208[1.0 <= data$U2665208 & data$U2665208 <= 9.0] <- 1.0
  data$U2665208 <- factor(data$U2665208, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2665209[1.0 <= data$U2665209 & data$U2665209 <= 10.0] <- 1.0
  data$U2665209 <- factor(data$U2665209, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2665210[1.0 <= data$U2665210 & data$U2665210 <= 11.0] <- 1.0
  data$U2665210 <- factor(data$U2665210, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2665211[1.0 <= data$U2665211 & data$U2665211 <= 12.0] <- 1.0
  data$U2665211 <- factor(data$U2665211, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2665212[1.0 <= data$U2665212 & data$U2665212 <= 13.0] <- 1.0
  data$U2665212 <- factor(data$U2665212, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2665300 <- factor(data$U2665300, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2665301[1.0 <= data$U2665301 & data$U2665301 <= 2.0] <- 1.0
  data$U2665301 <- factor(data$U2665301, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2665302[1.0 <= data$U2665302 & data$U2665302 <= 3.0] <- 1.0
  data$U2665302 <- factor(data$U2665302, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2665303[1.0 <= data$U2665303 & data$U2665303 <= 4.0] <- 1.0
  data$U2665303 <- factor(data$U2665303, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2665304[1.0 <= data$U2665304 & data$U2665304 <= 5.0] <- 1.0
  data$U2665304 <- factor(data$U2665304, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2665305[1.0 <= data$U2665305 & data$U2665305 <= 6.0] <- 1.0
  data$U2665305 <- factor(data$U2665305, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2665306[1.0 <= data$U2665306 & data$U2665306 <= 7.0] <- 1.0
  data$U2665306 <- factor(data$U2665306, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2665307[1.0 <= data$U2665307 & data$U2665307 <= 8.0] <- 1.0
  data$U2665307 <- factor(data$U2665307, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2665308[1.0 <= data$U2665308 & data$U2665308 <= 9.0] <- 1.0
  data$U2665308 <- factor(data$U2665308, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2665309[1.0 <= data$U2665309 & data$U2665309 <= 10.0] <- 1.0
  data$U2665309 <- factor(data$U2665309, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2665310[1.0 <= data$U2665310 & data$U2665310 <= 11.0] <- 1.0
  data$U2665310 <- factor(data$U2665310, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2665311[1.0 <= data$U2665311 & data$U2665311 <= 12.0] <- 1.0
  data$U2665311 <- factor(data$U2665311, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2665312[1.0 <= data$U2665312 & data$U2665312 <= 13.0] <- 1.0
  data$U2665312 <- factor(data$U2665312, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2665400 <- factor(data$U2665400, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2665401[1.0 <= data$U2665401 & data$U2665401 <= 2.0] <- 1.0
  data$U2665401 <- factor(data$U2665401, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2665402[1.0 <= data$U2665402 & data$U2665402 <= 3.0] <- 1.0
  data$U2665402 <- factor(data$U2665402, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2665403[1.0 <= data$U2665403 & data$U2665403 <= 4.0] <- 1.0
  data$U2665403 <- factor(data$U2665403, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2665404[1.0 <= data$U2665404 & data$U2665404 <= 5.0] <- 1.0
  data$U2665404 <- factor(data$U2665404, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2665405[1.0 <= data$U2665405 & data$U2665405 <= 6.0] <- 1.0
  data$U2665405 <- factor(data$U2665405, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2665406[1.0 <= data$U2665406 & data$U2665406 <= 7.0] <- 1.0
  data$U2665406 <- factor(data$U2665406, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2665407[1.0 <= data$U2665407 & data$U2665407 <= 8.0] <- 1.0
  data$U2665407 <- factor(data$U2665407, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2665408[1.0 <= data$U2665408 & data$U2665408 <= 9.0] <- 1.0
  data$U2665408 <- factor(data$U2665408, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2665409[1.0 <= data$U2665409 & data$U2665409 <= 10.0] <- 1.0
  data$U2665409 <- factor(data$U2665409, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2665410[1.0 <= data$U2665410 & data$U2665410 <= 11.0] <- 1.0
  data$U2665410 <- factor(data$U2665410, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2665411[1.0 <= data$U2665411 & data$U2665411 <= 12.0] <- 1.0
  data$U2665411 <- factor(data$U2665411, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2665412[1.0 <= data$U2665412 & data$U2665412 <= 13.0] <- 1.0
  data$U2665412 <- factor(data$U2665412, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2665500 <- factor(data$U2665500, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2665501[1.0 <= data$U2665501 & data$U2665501 <= 2.0] <- 1.0
  data$U2665501 <- factor(data$U2665501, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2665502[1.0 <= data$U2665502 & data$U2665502 <= 3.0] <- 1.0
  data$U2665502 <- factor(data$U2665502, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2665503[1.0 <= data$U2665503 & data$U2665503 <= 4.0] <- 1.0
  data$U2665503 <- factor(data$U2665503, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2665504[1.0 <= data$U2665504 & data$U2665504 <= 5.0] <- 1.0
  data$U2665504 <- factor(data$U2665504, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2665505[1.0 <= data$U2665505 & data$U2665505 <= 6.0] <- 1.0
  data$U2665505 <- factor(data$U2665505, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2665506[1.0 <= data$U2665506 & data$U2665506 <= 7.0] <- 1.0
  data$U2665506 <- factor(data$U2665506, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2665507[1.0 <= data$U2665507 & data$U2665507 <= 8.0] <- 1.0
  data$U2665507 <- factor(data$U2665507, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2665508[1.0 <= data$U2665508 & data$U2665508 <= 9.0] <- 1.0
  data$U2665508 <- factor(data$U2665508, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2665509[1.0 <= data$U2665509 & data$U2665509 <= 10.0] <- 1.0
  data$U2665509 <- factor(data$U2665509, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2665510[1.0 <= data$U2665510 & data$U2665510 <= 11.0] <- 1.0
  data$U2665510 <- factor(data$U2665510, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2665511[1.0 <= data$U2665511 & data$U2665511 <= 12.0] <- 1.0
  data$U2665511 <- factor(data$U2665511, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2665512[1.0 <= data$U2665512 & data$U2665512 <= 13.0] <- 1.0
  data$U2665512 <- factor(data$U2665512, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2665600 <- factor(data$U2665600, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2665601[1.0 <= data$U2665601 & data$U2665601 <= 2.0] <- 1.0
  data$U2665601 <- factor(data$U2665601, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2665602[1.0 <= data$U2665602 & data$U2665602 <= 3.0] <- 1.0
  data$U2665602 <- factor(data$U2665602, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2665603[1.0 <= data$U2665603 & data$U2665603 <= 4.0] <- 1.0
  data$U2665603 <- factor(data$U2665603, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2665604[1.0 <= data$U2665604 & data$U2665604 <= 5.0] <- 1.0
  data$U2665604 <- factor(data$U2665604, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2665605[1.0 <= data$U2665605 & data$U2665605 <= 6.0] <- 1.0
  data$U2665605 <- factor(data$U2665605, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2665606[1.0 <= data$U2665606 & data$U2665606 <= 7.0] <- 1.0
  data$U2665606 <- factor(data$U2665606, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2665607[1.0 <= data$U2665607 & data$U2665607 <= 8.0] <- 1.0
  data$U2665607 <- factor(data$U2665607, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2665608[1.0 <= data$U2665608 & data$U2665608 <= 9.0] <- 1.0
  data$U2665608 <- factor(data$U2665608, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2665609[1.0 <= data$U2665609 & data$U2665609 <= 10.0] <- 1.0
  data$U2665609 <- factor(data$U2665609, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2665610[1.0 <= data$U2665610 & data$U2665610 <= 11.0] <- 1.0
  data$U2665610 <- factor(data$U2665610, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2665611[1.0 <= data$U2665611 & data$U2665611 <= 12.0] <- 1.0
  data$U2665611 <- factor(data$U2665611, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2665612[1.0 <= data$U2665612 & data$U2665612 <= 13.0] <- 1.0
  data$U2665612 <- factor(data$U2665612, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  data$U2665700 <- factor(data$U2665700, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED EMPLOYER DIRECTLY OR INTERVIEWED"))
  data$U2665701[1.0 <= data$U2665701 & data$U2665701 <= 2.0] <- 1.0
  data$U2665701 <- factor(data$U2665701, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PUBLIC EMPLOYMENT AGENCY"))
  data$U2665702[1.0 <= data$U2665702 & data$U2665702 <= 3.0] <- 1.0
  data$U2665702 <- factor(data$U2665702, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED PRIVATE EMPLOYMENT AGENCY"))
  data$U2665703[1.0 <= data$U2665703 & data$U2665703 <= 4.0] <- 1.0
  data$U2665703 <- factor(data$U2665703, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED FRIENDS OR RELATIVES"))
  data$U2665704[1.0 <= data$U2665704 & data$U2665704 <= 5.0] <- 1.0
  data$U2665704 <- factor(data$U2665704, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CONTACTED A SCHOOL OR UNIVERSITY EMPLOYMENT CENTER"))
  data$U2665705[1.0 <= data$U2665705 & data$U2665705 <= 6.0] <- 1.0
  data$U2665705 <- factor(data$U2665705, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "SENT OUT RESUMES OR FILLED OUT APPLICATIONS"))
  data$U2665706[1.0 <= data$U2665706 & data$U2665706 <= 7.0] <- 1.0
  data$U2665706 <- factor(data$U2665706, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "CHECKED UNION OR PROFESSIONAL REGISTERS"))
  data$U2665707[1.0 <= data$U2665707 & data$U2665707 <= 8.0] <- 1.0
  data$U2665707 <- factor(data$U2665707, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "PLACED OR ANSWERED ADS"))
  data$U2665708[1.0 <= data$U2665708 & data$U2665708 <= 9.0] <- 1.0
  data$U2665708 <- factor(data$U2665708, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER ACTIVE METHODS (such as bidding on a contract or auditioning for a part in a play)"))
  data$U2665709[1.0 <= data$U2665709 & data$U2665709 <= 10.0] <- 1.0
  data$U2665709 <- factor(data$U2665709, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "LOOKED AT ADS"))
  data$U2665710[1.0 <= data$U2665710 & data$U2665710 <= 11.0] <- 1.0
  data$U2665710 <- factor(data$U2665710, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "ATTENDED JOB TRAINING PROGRAMS OR COURSES"))
  data$U2665711[1.0 <= data$U2665711 & data$U2665711 <= 12.0] <- 1.0
  data$U2665711 <- factor(data$U2665711, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "NOTHING"))
  data$U2665712[1.0 <= data$U2665712 & data$U2665712 <= 13.0] <- 1.0
  data$U2665712 <- factor(data$U2665712, 
    levels=c(0.0,1.0), 
    labels=c("NOT SELECTED",
      "OTHER PASSIVE METHODS (such as studying for a real estate license or picking up a job app)"))
  return(data)
}

varlabels <- c("PUBID - YTH ID CODE 1997",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L1 1997",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L1 1997",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L1 1997",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L1 1997",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L1 1997",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L1 1997",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L1 1997",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L1 1997",
  "LST RSRCS FIND JOB FRDS (BJGAP) L1 1997",
  "LST RSRCS FIND JOB NOTHING (BJGAP) L1 1997",
  "LIST RESOURCES FIND JOB OTH (BJGAP) L1 1997",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L2 1997",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L2 1997",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L2 1997",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L2 1997",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L2 1997",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L2 1997",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L2 1997",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L2 1997",
  "LST RSRCS FIND JOB FRDS (BJGAP) L2 1997",
  "LST RSRCS FIND JOB NOTHING (BJGAP) L2 1997",
  "LIST RESOURCES FIND JOB OTH (BJGAP) L2 1997",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L3 1997",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L3 1997",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L3 1997",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L3 1997",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L3 1997",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L3 1997",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L3 1997",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L3 1997",
  "LST RSRCS FIND JOB FRDS (BJGAP) L3 1997",
  "LST RSRCS FIND JOB NOTHING (BJGAP) L3 1997",
  "LIST RESOURCES FIND JOB OTH (BJGAP) L3 1997",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L4 1997",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L4 1997",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L4 1997",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L4 1997",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L4 1997",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L4 1997",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L4 1997",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L4 1997",
  "LST RSRCS FIND JOB FRDS (BJGAP) L4 1997",
  "LST RSRCS FIND JOB NOTHING (BJGAP) L4 1997",
  "LIST RESOURCES FIND JOB OTH (BJGAP) L4 1997",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L5 1997",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L5 1997",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L5 1997",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L5 1997",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L5 1997",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L5 1997",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L5 1997",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L5 1997",
  "LST RSRCS FIND JOB FRDS (BJGAP) L5 1997",
  "LST RSRCS FIND JOB NOTHING (BJGAP) L5 1997",
  "LIST RESOURCES FIND JOB OTH (BJGAP) L5 1997",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L6 1997",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L6 1997",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L6 1997",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L6 1997",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L6 1997",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L6 1997",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L6 1997",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L6 1997",
  "LST RSRCS FIND JOB FRDS (BJGAP) L6 1997",
  "LST RSRCS FIND JOB NOTHING (BJGAP) L6 1997",
  "LIST RESOURCES FIND JOB OTH (BJGAP) L6 1997",
  "KEY!SEX (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "CV_SAMPLE_TYPE 1997",
  "KEY!RACE_ETHNICITY (SYMBOL) 1997",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L1 1998",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L1 1998",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L1 1998",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L1 1998",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L1 1998",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L1 1998",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L1 1998",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L1 1998",
  "LST RSRCS FIND JOB OTH (BJGAP) L1 1998",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L2 1998",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L2 1998",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L2 1998",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L2 1998",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L2 1998",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L2 1998",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L2 1998",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L2 1998",
  "LST RSRCS FIND JOB OTH (BJGAP) L2 1998",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L3 1998",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L3 1998",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L3 1998",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L3 1998",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L3 1998",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L3 1998",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L3 1998",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L3 1998",
  "LST RSRCS FIND JOB OTH (BJGAP) L3 1998",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L4 1998",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L4 1998",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L4 1998",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L4 1998",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L4 1998",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L4 1998",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L4 1998",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L4 1998",
  "LST RSRCS FIND JOB OTH (BJGAP) L4 1998",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L5 1998",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L5 1998",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L5 1998",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L5 1998",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L5 1998",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L5 1998",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L5 1998",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L5 1998",
  "LST RSRCS FIND JOB OTH (BJGAP) L5 1998",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L6 1998",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L6 1998",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L6 1998",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L6 1998",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L6 1998",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L6 1998",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L6 1998",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L6 1998",
  "LST RSRCS FIND JOB OTH (BJGAP) L6 1998",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L1 1999",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L1 1999",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L1 1999",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L1 1999",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L1 1999",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L1 1999",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L1 1999",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L1 1999",
  "LST RSRCS FIND JOB OTH (BJGAP) L1 1999",
  "LST RSRCS FIND JOB INTERNET (BJGAP) L1 1999",
  "LST RSRCS FIND JOB EMP CONT DIR (BJGAP) L1 1999",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L2 1999",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L2 1999",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L2 1999",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L2 1999",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L2 1999",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L2 1999",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L2 1999",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L2 1999",
  "LST RSRCS FIND JOB OTH (BJGAP) L2 1999",
  "LST RSRCS FIND JOB INTERNET (BJGAP) L2 1999",
  "LST RSRCS FIND JOB EMP CONT DIR (BJGAP) L2 1999",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L3 1999",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L3 1999",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L3 1999",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L3 1999",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L3 1999",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L3 1999",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L3 1999",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L3 1999",
  "LST RSRCS FIND JOB OTH (BJGAP) L3 1999",
  "LST RSRCS FIND JOB INTERNET (BJGAP) L3 1999",
  "LST RSRCS FIND JOB EMP CONT DIR (BJGAP) L3 1999",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L4 1999",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L4 1999",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L4 1999",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L4 1999",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L4 1999",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L4 1999",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L4 1999",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L4 1999",
  "LST RSRCS FIND JOB OTH (BJGAP) L4 1999",
  "LST RSRCS FIND JOB INTERNET (BJGAP) L4 1999",
  "LST RSRCS FIND JOB EMP CONT DIR (BJGAP) L4 1999",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L5 1999",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L5 1999",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L5 1999",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L5 1999",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L5 1999",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L5 1999",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L5 1999",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L5 1999",
  "LST RSRCS FIND JOB OTH (BJGAP) L5 1999",
  "LST RSRCS FIND JOB INTERNET (BJGAP) L5 1999",
  "LST RSRCS FIND JOB EMP CONT DIR (BJGAP) L5 1999",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L1 2000",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L1 2000",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L1 2000",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L1 2000",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L1 2000",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L1 2000",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L1 2000",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L1 2000",
  "LST RSRCS FIND JOB OTH (BJGAP) L1 2000",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L1 2000",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L2 2000",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L2 2000",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L2 2000",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L2 2000",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L2 2000",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L2 2000",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L2 2000",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L2 2000",
  "LST RSRCS FIND JOB OTH (BJGAP) L2 2000",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L2 2000",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L3 2000",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L3 2000",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L3 2000",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L3 2000",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L3 2000",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L3 2000",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L3 2000",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L3 2000",
  "LST RSRCS FIND JOB OTH (BJGAP) L3 2000",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L3 2000",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L4 2000",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L4 2000",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L4 2000",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L4 2000",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L4 2000",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L4 2000",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L4 2000",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L4 2000",
  "LST RSRCS FIND JOB OTH (BJGAP) L4 2000",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L4 2000",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L5 2000",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L5 2000",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L5 2000",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L5 2000",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L5 2000",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L5 2000",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L5 2000",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L5 2000",
  "LST RSRCS FIND JOB OTH (BJGAP) L5 2000",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L5 2000",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L6 2000",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L6 2000",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L6 2000",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L6 2000",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L6 2000",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L6 2000",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L6 2000",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L6 2000",
  "LST RSRCS FIND JOB OTH (BJGAP) L6 2000",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L6 2000",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L7 2000",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L7 2000",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L7 2000",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L7 2000",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L7 2000",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L7 2000",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L7 2000",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L7 2000",
  "LST RSRCS FIND JOB OTH (BJGAP) L7 2000",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L7 2000",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L8 2000",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L8 2000",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L8 2000",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L8 2000",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L8 2000",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L8 2000",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L8 2000",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L8 2000",
  "LST RSRCS FIND JOB OTH (BJGAP) L8 2000",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L8 2000",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L1 2001",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L1 2001",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L1 2001",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L1 2001",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L1 2001",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L1 2001",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L1 2001",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L1 2001",
  "LIST RESOURCES FIND JOB ATTENDED JOB FAIR (BJGAP) L1 2001",
  "LST RSRCS FIND JOB INTERNET SRCH (BJGAP) L1 2001",
  "LIST RESOURCES FIND JOB OTHER (BJGAP) L1 2001",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L1 2001",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L2 2001",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L2 2001",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L2 2001",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L2 2001",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L2 2001",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L2 2001",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L2 2001",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L2 2001",
  "LIST RESOURCES FIND JOB ATTENDED JOB FAIR (BJGAP) L2 2001",
  "LST RSRCS FIND JOB INTERNET SRCH (BJGAP) L2 2001",
  "LIST RESOURCES FIND JOB OTHER (BJGAP) L2 2001",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L2 2001",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L3 2001",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L3 2001",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L3 2001",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L3 2001",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L3 2001",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L3 2001",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L3 2001",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L3 2001",
  "LIST RESOURCES FIND JOB ATTENDED JOB FAIR (BJGAP) L3 2001",
  "LST RSRCS FIND JOB INTERNET SRCH (BJGAP) L3 2001",
  "LIST RESOURCES FIND JOB OTHER (BJGAP) L3 2001",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L3 2001",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L4 2001",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L4 2001",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L4 2001",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L4 2001",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L4 2001",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L4 2001",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L4 2001",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L4 2001",
  "LIST RESOURCES FIND JOB ATTENDED JOB FAIR (BJGAP) L4 2001",
  "LST RSRCS FIND JOB INTERNET SRCH (BJGAP) L4 2001",
  "LIST RESOURCES FIND JOB OTHER (BJGAP) L4 2001",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L4 2001",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L5 2001",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L5 2001",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L5 2001",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L5 2001",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L5 2001",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L5 2001",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L5 2001",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L5 2001",
  "LIST RESOURCES FIND JOB ATTENDED JOB FAIR (BJGAP) L5 2001",
  "LST RSRCS FIND JOB INTERNET SRCH (BJGAP) L5 2001",
  "LIST RESOURCES FIND JOB OTHER (BJGAP) L5 2001",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L5 2001",
  "LST RSRCS FIND JOB CONT EMP DIR (BJGAP) L7 2001",
  "LST RSRCS FIND JOB CONT EMP AGCY (BJGAP) L7 2001",
  "LST RSRCS FIND JOB FRDS/REL (BJGAP) L7 2001",
  "LST RSRCS FIND JOB CONT SCH PLC CTR (BJGAP) L7 2001",
  "LST RSRCS FIND JOB RESUMES/APPS (BJGAP) L7 2001",
  "LST RSRCS FIND JOB PLCD ADS (BJGAP) L7 2001",
  "LST RSRCS FIND JOB CHKD PROF REG (BJGAP) L7 2001",
  "LST RSRCS FIND JOB LOOKED AT ADS (BJGAP) L7 2001",
  "LIST RESOURCES FIND JOB ATTENDED JOB FAIR (BJGAP) L7 2001",
  "LST RSRCS FIND JOB INTERNET SRCH (BJGAP) L7 2001",
  "LIST RESOURCES FIND JOB OTHER (BJGAP) L7 2001",
  "LST RSRCS FIND JOB UNCDBL (BJGAP) L7 2001",
  "JOB SEARCH ACT - CONT EMP DIR L1 2002",
  "JOB SEARCH ACT - CONT EMP AGCY L1 2002",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2002",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2002",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2002",
  "JOB SEARCH ACT - PLACED ADS L1 2002",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2002",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2002",
  "JOB SEARCH ACT - OTHER L1 2002",
  "JOB SEARCH ACT - ATTD JOB FAIR L1 2002",
  "JOB SEARCH ACT - ONLINE/INTERNET L1 2002",
  "JOB SEARCH ACT - SUPERVSR REV L1 2002",
  "JOB SEARCH ACT - UNCODABLE L1 2002",
  "JOB SEARCH ACT - CONT EMP DIR L2 2002",
  "JOB SEARCH ACT - CONT EMP AGCY L2 2002",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2002",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2002",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2002",
  "JOB SEARCH ACT - PLACED ADS L2 2002",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2002",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2002",
  "JOB SEARCH ACT - OTHER L2 2002",
  "JOB SEARCH ACT - ATTD JOB FAIR L2 2002",
  "JOB SEARCH ACT - ONLINE/INTERNET L2 2002",
  "JOB SEARCH ACT - SUPERVSR REV L2 2002",
  "JOB SEARCH ACT - UNCODABLE L2 2002",
  "JOB SEARCH ACT - CONT EMP DIR L3 2002",
  "JOB SEARCH ACT - CONT EMP AGCY L3 2002",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2002",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2002",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2002",
  "JOB SEARCH ACT - PLACED ADS L3 2002",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2002",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2002",
  "JOB SEARCH ACT - OTHER L3 2002",
  "JOB SEARCH ACT - ATTD JOB FAIR L3 2002",
  "JOB SEARCH ACT - ONLINE/INTERNET L3 2002",
  "JOB SEARCH ACT - SUPERVSR REV L3 2002",
  "JOB SEARCH ACT - UNCODABLE L3 2002",
  "JOB SEARCH ACT - CONT EMP DIR L4 2002",
  "JOB SEARCH ACT - CONT EMP AGCY L4 2002",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2002",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2002",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2002",
  "JOB SEARCH ACT - PLACED ADS L4 2002",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2002",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2002",
  "JOB SEARCH ACT - OTHER L4 2002",
  "JOB SEARCH ACT - ATTD JOB FAIR L4 2002",
  "JOB SEARCH ACT - ONLINE/INTERNET L4 2002",
  "JOB SEARCH ACT - SUPERVSR REV L4 2002",
  "JOB SEARCH ACT - UNCODABLE L4 2002",
  "JOB SEARCH ACT - CONT EMP DIR L5 2002",
  "JOB SEARCH ACT - CONT EMP AGCY L5 2002",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2002",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2002",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2002",
  "JOB SEARCH ACT - PLACED ADS L5 2002",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2002",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2002",
  "JOB SEARCH ACT - OTHER L5 2002",
  "JOB SEARCH ACT - ATTD JOB FAIR L5 2002",
  "JOB SEARCH ACT - ONLINE/INTERNET L5 2002",
  "JOB SEARCH ACT - SUPERVSR REV L5 2002",
  "JOB SEARCH ACT - UNCODABLE L5 2002",
  "JOB SEARCH ACT - CONT EMP DIR L6 2002",
  "JOB SEARCH ACT - CONT EMP AGCY L6 2002",
  "JOB SEARCH ACT - CONT FRDS OR RELS L6 2002",
  "JOB SEARCH ACT - CONT SCH EMP CTR L6 2002",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L6 2002",
  "JOB SEARCH ACT - PLACED ADS L6 2002",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L6 2002",
  "JOB SEARCH ACT - LOOKED AT ADS L6 2002",
  "JOB SEARCH ACT - OTHER L6 2002",
  "JOB SEARCH ACT - SUPERVSR REV L6 2002",
  "JOB SEARCH ACT - UNCODABLE L6 2002",
  "JOB SEARCH ACT - CONT EMP DIR L7 2002",
  "JOB SEARCH ACT - CONT EMP AGCY L7 2002",
  "JOB SEARCH ACT - CONT FRDS OR RELS L7 2002",
  "JOB SEARCH ACT - CONT SCH EMP CTR L7 2002",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L7 2002",
  "JOB SEARCH ACT - PLACED ADS L7 2002",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L7 2002",
  "JOB SEARCH ACT - LOOKED AT ADS L7 2002",
  "JOB SEARCH ACT - OTHER L7 2002",
  "JOB SEARCH ACT - SUPERVSR REV L7 2002",
  "JOB SEARCH ACT - UNCODABLE L7 2002",
  "JOB SEARCH ACT - CONT EMP DIR L8 2002",
  "JOB SEARCH ACT - CONT EMP AGCY L8 2002",
  "JOB SEARCH ACT - CONT FRDS OR RELS L8 2002",
  "JOB SEARCH ACT - CONT SCH EMP CTR L8 2002",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L8 2002",
  "JOB SEARCH ACT - PLACED ADS L8 2002",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L8 2002",
  "JOB SEARCH ACT - LOOKED AT ADS L8 2002",
  "JOB SEARCH ACT - OTHER L8 2002",
  "JOB SEARCH ACT - SUPERVSR REV L8 2002",
  "JOB SEARCH ACT - UNCODABLE L8 2002",
  "JOB SEARCH ACT - CONT EMP DIR L1 2003",
  "JOB SEARCH ACT - CONT EMP AGCY L1 2003",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2003",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2003",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2003",
  "JOB SEARCH ACT - PLACED ADS L1 2003",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2003",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2003",
  "JOB SEARCH ACT - ATTD JOB FAIR L1 2003",
  "JOB SEARCH ACT - ONLINE/INTERNET L1 2003",
  "JOB SEARCH ACT - OTHER L1 2003",
  "JOB SEARCH ACT - UNCODABLE L1 2003",
  "JOB SEARCH ACT - CONT EMP DIR L2 2003",
  "JOB SEARCH ACT - CONT EMP AGCY L2 2003",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2003",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2003",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2003",
  "JOB SEARCH ACT - PLACED ADS L2 2003",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2003",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2003",
  "JOB SEARCH ACT - ATTD JOB FAIR L2 2003",
  "JOB SEARCH ACT - ONLINE/INTERNET L2 2003",
  "JOB SEARCH ACT - OTHER L2 2003",
  "JOB SEARCH ACT - UNCODABLE L2 2003",
  "JOB SEARCH ACT - CONT EMP DIR L3 2003",
  "JOB SEARCH ACT - CONT EMP AGCY L3 2003",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2003",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2003",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2003",
  "JOB SEARCH ACT - PLACED ADS L3 2003",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2003",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2003",
  "JOB SEARCH ACT - ATTD JOB FAIR L3 2003",
  "JOB SEARCH ACT - ONLINE/INTERNET L3 2003",
  "JOB SEARCH ACT - OTHER L3 2003",
  "JOB SEARCH ACT - CONT EMP DIR L4 2003",
  "JOB SEARCH ACT - CONT EMP AGCY L4 2003",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2003",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2003",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2003",
  "JOB SEARCH ACT - PLACED ADS L4 2003",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2003",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2003",
  "JOB SEARCH ACT - ATTD JOB FAIR L4 2003",
  "JOB SEARCH ACT - ONLINE/INTERNET L4 2003",
  "JOB SEARCH ACT - OTHER L4 2003",
  "JOB SEARCH ACT - CONT EMP DIR L5 2003",
  "JOB SEARCH ACT - CONT EMP AGCY L5 2003",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2003",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2003",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2003",
  "JOB SEARCH ACT - PLACED ADS L5 2003",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2003",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2003",
  "JOB SEARCH ACT - ATTD JOB FAIR L5 2003",
  "JOB SEARCH ACT - ONLINE/INTERNET L5 2003",
  "JOB SEARCH ACT - OTHER L5 2003",
  "JOB SEARCH ACT - CONT EMP DIR L1 2004",
  "JOB SEARCH ACT - CONT EMP AGCY L1 2004",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2004",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2004",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2004",
  "JOB SEARCH ACT - PLACED ADS L1 2004",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2004",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2004",
  "JOB SEARCH ACT - OTHER L1 2004",
  "JOB SEARCH ACT - ATTD JOB FAIR L1 2004",
  "JOB SEARCH ACT - ONLINE/INTERNET L1 2004",
  "JOB SEARCH ACT - UNCODABLE L1 2004",
  "JOB SEARCH ACT - CONT EMP DIR L2 2004",
  "JOB SEARCH ACT - CONT EMP AGCY L2 2004",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2004",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2004",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2004",
  "JOB SEARCH ACT - PLACED ADS L2 2004",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2004",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2004",
  "JOB SEARCH ACT - OTHER L2 2004",
  "JOB SEARCH ACT - ATTD JOB FAIR L2 2004",
  "JOB SEARCH ACT - ONLINE/INTERNET L2 2004",
  "JOB SEARCH ACT - UNCODABLE L2 2004",
  "JOB SEARCH ACT - CONT EMP DIR L3 2004",
  "JOB SEARCH ACT - CONT EMP AGCY L3 2004",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2004",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2004",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2004",
  "JOB SEARCH ACT - PLACED ADS L3 2004",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2004",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2004",
  "JOB SEARCH ACT - OTHER L3 2004",
  "JOB SEARCH ACT - ATTD JOB FAIR L3 2004",
  "JOB SEARCH ACT - ONLINE/INTERNET L3 2004",
  "JOB SEARCH ACT - UNCODABLE L3 2004",
  "JOB SEARCH ACT - CONT EMP DIR L4 2004",
  "JOB SEARCH ACT - CONT EMP AGCY L4 2004",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2004",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2004",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2004",
  "JOB SEARCH ACT - PLACED ADS L4 2004",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2004",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2004",
  "JOB SEARCH ACT - OTHER L4 2004",
  "JOB SEARCH ACT - ATTD JOB FAIR L4 2004",
  "JOB SEARCH ACT - ONLINE/INTERNET L4 2004",
  "JOB SEARCH ACT - CONT EMP DIR L5 2004",
  "JOB SEARCH ACT - CONT EMP AGCY L5 2004",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2004",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2004",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2004",
  "JOB SEARCH ACT - PLACED ADS L5 2004",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2004",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2004",
  "JOB SEARCH ACT - OTHER L5 2004",
  "JOB SEARCH ACT - ATTD JOB FAIR L5 2004",
  "JOB SEARCH ACT - ONLINE/INTERNET L5 2004",
  "JOB SEARCH ACT - CONT EMP DIR L6 2004",
  "JOB SEARCH ACT - CONT EMP AGCY L6 2004",
  "JOB SEARCH ACT - CONT FRDS OR RELS L6 2004",
  "JOB SEARCH ACT - CONT SCH EMP CTR L6 2004",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L6 2004",
  "JOB SEARCH ACT - PLACED ADS L6 2004",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L6 2004",
  "JOB SEARCH ACT - LOOKED AT ADS L6 2004",
  "JOB SEARCH ACT - OTHER L6 2004",
  "JOB SEARCH ACT - ATTD JOB FAIR L6 2004",
  "JOB SEARCH ACT - ONLINE/INTERNET L6 2004",
  "JOB SEARCH ACT - CONT EMP DIR L1 2005",
  "JOB SEARCH ACT - CONT EMP AGCY L1 2005",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2005",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2005",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2005",
  "JOB SEARCH ACT - PLACED ADS L1 2005",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2005",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2005",
  "JOB SEARCH ACT - OTHER L1 2005",
  "JOB SEARCH ACT - ATTD JOB FAIR L1 2005",
  "JOB SEARCH ACT - ONLINE/INTERNET L1 2005",
  "JOB SEARCH ACT - UNCODABLE L1 2005",
  "JOB SEARCH ACT - CONT EMP DIR L2 2005",
  "JOB SEARCH ACT - CONT EMP AGCY L2 2005",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2005",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2005",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2005",
  "JOB SEARCH ACT - PLACED ADS L2 2005",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2005",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2005",
  "JOB SEARCH ACT - OTHER L2 2005",
  "JOB SEARCH ACT - ATTD JOB FAIR L2 2005",
  "JOB SEARCH ACT - ONLINE/INTERNET L2 2005",
  "JOB SEARCH ACT - CONT EMP DIR L3 2005",
  "JOB SEARCH ACT - CONT EMP AGCY L3 2005",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2005",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2005",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2005",
  "JOB SEARCH ACT - PLACED ADS L3 2005",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2005",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2005",
  "JOB SEARCH ACT - OTHER L3 2005",
  "JOB SEARCH ACT - ATTD JOB FAIR L3 2005",
  "JOB SEARCH ACT - ONLINE/INTERNET L3 2005",
  "JOB SEARCH ACT - CONT EMP DIR L4 2005",
  "JOB SEARCH ACT - CONT EMP AGCY L4 2005",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2005",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2005",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2005",
  "JOB SEARCH ACT - PLACED ADS L4 2005",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2005",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2005",
  "JOB SEARCH ACT - OTHER L4 2005",
  "JOB SEARCH ACT - ATTD JOB FAIR L4 2005",
  "JOB SEARCH ACT - ONLINE/INTERNET L4 2005",
  "JOB SEARCH ACT - CONT EMP DIR L5 2005",
  "JOB SEARCH ACT - CONT EMP AGCY L5 2005",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2005",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2005",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2005",
  "JOB SEARCH ACT - PLACED ADS L5 2005",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2005",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2005",
  "JOB SEARCH ACT - OTHER L5 2005",
  "JOB SEARCH ACT - ATTD JOB FAIR L5 2005",
  "JOB SEARCH ACT - ONLINE/INTERNET L5 2005",
  "JOB SEARCH ACT - CONT EMP DIR L1 2006",
  "JOB SEARCH ACT - CONT EMP AGCY L1 2006",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2006",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2006",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2006",
  "JOB SEARCH ACT - PLACED ADS L1 2006",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2006",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2006",
  "JOB SEARCH ACT - OTHER L1 2006",
  "JOB SEARCH ACT - ATTD JOB FAIR L1 2006",
  "JOB SEARCH ACT - ONLINE/INTERNET L1 2006",
  "JOB SEARCH ACT - UNCODABLE L1 2006",
  "JOB SEARCH ACT - CONT EMP DIR L2 2006",
  "JOB SEARCH ACT - CONT EMP AGCY L2 2006",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2006",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2006",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2006",
  "JOB SEARCH ACT - PLACED ADS L2 2006",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2006",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2006",
  "JOB SEARCH ACT - OTHER L2 2006",
  "JOB SEARCH ACT - ATTD JOB FAIR L2 2006",
  "JOB SEARCH ACT - ONLINE/INTERNET L2 2006",
  "JOB SEARCH ACT - CONT EMP DIR L3 2006",
  "JOB SEARCH ACT - CONT EMP AGCY L3 2006",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2006",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2006",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2006",
  "JOB SEARCH ACT - PLACED ADS L3 2006",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2006",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2006",
  "JOB SEARCH ACT - OTHER L3 2006",
  "JOB SEARCH ACT - ATTD JOB FAIR L3 2006",
  "JOB SEARCH ACT - ONLINE/INTERNET L3 2006",
  "JOB SEARCH ACT - CONT EMP DIR L4 2006",
  "JOB SEARCH ACT - CONT EMP AGCY L4 2006",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2006",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2006",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2006",
  "JOB SEARCH ACT - PLACED ADS L4 2006",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2006",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2006",
  "JOB SEARCH ACT - OTHER L4 2006",
  "JOB SEARCH ACT - ATTD JOB FAIR L4 2006",
  "JOB SEARCH ACT - ONLINE/INTERNET L4 2006",
  "JOB SEARCH ACT - CONT EMP DIR L5 2006",
  "JOB SEARCH ACT - CONT EMP AGCY L5 2006",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2006",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2006",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2006",
  "JOB SEARCH ACT - PLACED ADS L5 2006",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2006",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2006",
  "JOB SEARCH ACT - OTHER L5 2006",
  "JOB SEARCH ACT - ATTD JOB FAIR L5 2006",
  "JOB SEARCH ACT - ONLINE/INTERNET L5 2006",
  "JOB SEARCH ACT - CONT EMP DIR L6 2006",
  "JOB SEARCH ACT - CONT EMP AGCY L6 2006",
  "JOB SEARCH ACT - CONT FRDS OR RELS L6 2006",
  "JOB SEARCH ACT - CONT SCH EMP CTR L6 2006",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L6 2006",
  "JOB SEARCH ACT - PLACED ADS L6 2006",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L6 2006",
  "JOB SEARCH ACT - LOOKED AT ADS L6 2006",
  "JOB SEARCH ACT - OTHER L6 2006",
  "JOB SEARCH ACT - ATTD JOB FAIR L6 2006",
  "JOB SEARCH ACT - ONLINE/INTERNET L6 2006",
  "JOB SEARCH ACT - CONT EMP DIR L1 2007",
  "JOB SEARCH ACT - CONT EMP AGCY L1 2007",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2007",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2007",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2007",
  "JOB SEARCH ACT - PLACED ADS L1 2007",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2007",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2007",
  "JOB SEARCH ACT - OTHER L1 2007",
  "JOB SEARCH ACT - ATTD JOB FAIR L1 2007",
  "JOB SEARCH ACT - ONLINE/INTERNET L1 2007",
  "JOB SEARCH ACT - UNCODABLE L1 2007",
  "JOB SEARCH ACT - CONT EMP DIR L2 2007",
  "JOB SEARCH ACT - CONT EMP AGCY L2 2007",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2007",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2007",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2007",
  "JOB SEARCH ACT - PLACED ADS L2 2007",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2007",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2007",
  "JOB SEARCH ACT - OTHER L2 2007",
  "JOB SEARCH ACT - ATTD JOB FAIR L2 2007",
  "JOB SEARCH ACT - ONLINE/INTERNET L2 2007",
  "JOB SEARCH ACT - CONT EMP DIR L3 2007",
  "JOB SEARCH ACT - CONT EMP AGCY L3 2007",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2007",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2007",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2007",
  "JOB SEARCH ACT - PLACED ADS L3 2007",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2007",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2007",
  "JOB SEARCH ACT - OTHER L3 2007",
  "JOB SEARCH ACT - ATTD JOB FAIR L3 2007",
  "JOB SEARCH ACT - ONLINE/INTERNET L3 2007",
  "JOB SEARCH ACT - CONT EMP DIR L4 2007",
  "JOB SEARCH ACT - CONT EMP AGCY L4 2007",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2007",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2007",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2007",
  "JOB SEARCH ACT - PLACED ADS L4 2007",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2007",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2007",
  "JOB SEARCH ACT - OTHER L4 2007",
  "JOB SEARCH ACT - ATTD JOB FAIR L4 2007",
  "JOB SEARCH ACT - ONLINE/INTERNET L4 2007",
  "JOB SEARCH ACT - CONT EMP DIR L5 2007",
  "JOB SEARCH ACT - CONT EMP AGCY L5 2007",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2007",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2007",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2007",
  "JOB SEARCH ACT - PLACED ADS L5 2007",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2007",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2007",
  "JOB SEARCH ACT - OTHER L5 2007",
  "JOB SEARCH ACT - ATTD JOB FAIR L5 2007",
  "JOB SEARCH ACT - ONLINE/INTERNET L5 2007",
  "JOB SEARCH ACT - CONT EMP DIR L6 2007",
  "JOB SEARCH ACT - CONT EMP AGCY L6 2007",
  "JOB SEARCH ACT - CONT FRDS OR RELS L6 2007",
  "JOB SEARCH ACT - CONT SCH EMP CTR L6 2007",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L6 2007",
  "JOB SEARCH ACT - PLACED ADS L6 2007",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L6 2007",
  "JOB SEARCH ACT - LOOKED AT ADS L6 2007",
  "JOB SEARCH ACT - OTHER L6 2007",
  "JOB SEARCH ACT - ATTD JOB FAIR L6 2007",
  "JOB SEARCH ACT - ONLINE/INTERNET L6 2007",
  "JOB SEARCH ACT - CONT EMP DIR L7 2007",
  "JOB SEARCH ACT - CONT EMP AGCY L7 2007",
  "JOB SEARCH ACT - CONT FRDS OR RELS L7 2007",
  "JOB SEARCH ACT - CONT SCH EMP CTR L7 2007",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L7 2007",
  "JOB SEARCH ACT - PLACED ADS L7 2007",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L7 2007",
  "JOB SEARCH ACT - LOOKED AT ADS L7 2007",
  "JOB SEARCH ACT - OTHER L7 2007",
  "JOB SEARCH ACT - ATTD JOB FAIR L7 2007",
  "JOB SEARCH ACT - ONLINE/INTERNET L7 2007",
  "JOB SEARCH ACT - CONT EMP DIR L8 2007",
  "JOB SEARCH ACT - CONT EMP AGCY L8 2007",
  "JOB SEARCH ACT - CONT FRDS OR RELS L8 2007",
  "JOB SEARCH ACT - CONT SCH EMP CTR L8 2007",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L8 2007",
  "JOB SEARCH ACT - PLACED ADS L8 2007",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L8 2007",
  "JOB SEARCH ACT - LOOKED AT ADS L8 2007",
  "JOB SEARCH ACT - OTHER L8 2007",
  "JOB SEARCH ACT - ATTD JOB FAIR L8 2007",
  "JOB SEARCH ACT - ONLINE/INTERNET L8 2007",
  "JOB SEARCH ACT - CONT EMP DIR L1 2008",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L1 2008",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L1 2008",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2008",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2008",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2008",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2008",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L1 2008",
  "JOB SEARCH ACT - OTH ACT METHODS L1 2008",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2008",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L1 2008",
  "JOB SEARCH ACT - NOTHING L1 2008",
  "JOB SEARCH ACT - OTH PASS METHDS L1 2008",
  "JOB SEARCH ACT - SUPERVSR REV L1 2008",
  "JOB SEARCH ACT - CONT EMP DIR L2 2008",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L2 2008",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L2 2008",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2008",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2008",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2008",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2008",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L2 2008",
  "JOB SEARCH ACT - OTH ACT METHODS L2 2008",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2008",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L2 2008",
  "JOB SEARCH ACT - NOTHING L2 2008",
  "JOB SEARCH ACT - OTH PASS METHDS L2 2008",
  "JOB SEARCH ACT - SUPERVSR REV L2 2008",
  "JOB SEARCH ACT - CONT EMP DIR L3 2008",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L3 2008",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L3 2008",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2008",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2008",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2008",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2008",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L3 2008",
  "JOB SEARCH ACT - OTH ACT METHODS L3 2008",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2008",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L3 2008",
  "JOB SEARCH ACT - NOTHING L3 2008",
  "JOB SEARCH ACT - OTH PASS METHDS L3 2008",
  "JOB SEARCH ACT - CONT EMP DIR L4 2008",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L4 2008",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L4 2008",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2008",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2008",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2008",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2008",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L4 2008",
  "JOB SEARCH ACT - OTH ACT METHODS L4 2008",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2008",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L4 2008",
  "JOB SEARCH ACT - NOTHING L4 2008",
  "JOB SEARCH ACT - OTH PASS METHDS L4 2008",
  "JOB SEARCH ACT - CONT EMP DIR L5 2008",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L5 2008",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L5 2008",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2008",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2008",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2008",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2008",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L5 2008",
  "JOB SEARCH ACT - OTH ACT METHODS L5 2008",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2008",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L5 2008",
  "JOB SEARCH ACT - NOTHING L5 2008",
  "JOB SEARCH ACT - OTH PASS METHDS L5 2008",
  "JOB SEARCH ACT - CONT EMP DIR L6 2008",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L6 2008",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L6 2008",
  "JOB SEARCH ACT - CONT FRDS OR RELS L6 2008",
  "JOB SEARCH ACT - CONT SCH EMP CTR L6 2008",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L6 2008",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L6 2008",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L6 2008",
  "JOB SEARCH ACT - OTH ACT METHODS L6 2008",
  "JOB SEARCH ACT - LOOKED AT ADS L6 2008",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L6 2008",
  "JOB SEARCH ACT - NOTHING L6 2008",
  "JOB SEARCH ACT - OTH PASS METHDS L6 2008",
  "JOB SEARCH ACT - CONT EMP DIR L8 2008",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L8 2008",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L8 2008",
  "JOB SEARCH ACT - CONT FRDS OR RELS L8 2008",
  "JOB SEARCH ACT - CONT SCH EMP CTR L8 2008",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L8 2008",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L8 2008",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L8 2008",
  "JOB SEARCH ACT - OTH ACT METHODS L8 2008",
  "JOB SEARCH ACT - LOOKED AT ADS L8 2008",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L8 2008",
  "JOB SEARCH ACT - NOTHING L8 2008",
  "JOB SEARCH ACT - OTH PASS METHDS L8 2008",
  "JOB SEARCH ACT - CONT EMP DIR L1 2009",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L1 2009",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L1 2009",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2009",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2009",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2009",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2009",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L1 2009",
  "JOB SEARCH ACT - OTH ACT METHODS L1 2009",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2009",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L1 2009",
  "JOB SEARCH ACT - NOTHING L1 2009",
  "JOB SEARCH ACT - OTH PASS METHDS L1 2009",
  "JOB SEARCH ACT - CONT EMP DIR L2 2009",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L2 2009",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L2 2009",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2009",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2009",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2009",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2009",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L2 2009",
  "JOB SEARCH ACT - OTH ACT METHODS L2 2009",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2009",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L2 2009",
  "JOB SEARCH ACT - NOTHING L2 2009",
  "JOB SEARCH ACT - OTH PASS METHDS L2 2009",
  "JOB SEARCH ACT - CONT EMP DIR L3 2009",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L3 2009",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L3 2009",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2009",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2009",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2009",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2009",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L3 2009",
  "JOB SEARCH ACT - OTH ACT METHODS L3 2009",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2009",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L3 2009",
  "JOB SEARCH ACT - NOTHING L3 2009",
  "JOB SEARCH ACT - OTH PASS METHDS L3 2009",
  "JOB SEARCH ACT - CONT EMP DIR L4 2009",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L4 2009",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L4 2009",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2009",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2009",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2009",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2009",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L4 2009",
  "JOB SEARCH ACT - OTH ACT METHODS L4 2009",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2009",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L4 2009",
  "JOB SEARCH ACT - NOTHING L4 2009",
  "JOB SEARCH ACT - OTH PASS METHDS L4 2009",
  "JOB SEARCH ACT - CONT EMP DIR L5 2009",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L5 2009",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L5 2009",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2009",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2009",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2009",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2009",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L5 2009",
  "JOB SEARCH ACT - OTH ACT METHODS L5 2009",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2009",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L5 2009",
  "JOB SEARCH ACT - NOTHING L5 2009",
  "JOB SEARCH ACT - OTH PASS METHDS L5 2009",
  "JOB SEARCH ACT - CONT EMP DIR L1 2010",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L1 2010",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L1 2010",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2010",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2010",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2010",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2010",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L1 2010",
  "JOB SEARCH ACT - OTH ACT METHODS L1 2010",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2010",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L1 2010",
  "JOB SEARCH ACT - NOTHING L1 2010",
  "JOB SEARCH ACT - OTH PASS METHDS L1 2010",
  "JOB SEARCH ACT - CONT EMP DIR L2 2010",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L2 2010",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L2 2010",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2010",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2010",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2010",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2010",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L2 2010",
  "JOB SEARCH ACT - OTH ACT METHODS L2 2010",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2010",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L2 2010",
  "JOB SEARCH ACT - NOTHING L2 2010",
  "JOB SEARCH ACT - OTH PASS METHDS L2 2010",
  "JOB SEARCH ACT - CONT EMP DIR L3 2010",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L3 2010",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L3 2010",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2010",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2010",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2010",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2010",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L3 2010",
  "JOB SEARCH ACT - OTH ACT METHODS L3 2010",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2010",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L3 2010",
  "JOB SEARCH ACT - NOTHING L3 2010",
  "JOB SEARCH ACT - OTH PASS METHDS L3 2010",
  "JOB SEARCH ACT - CONT EMP DIR L4 2010",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L4 2010",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L4 2010",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2010",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2010",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2010",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2010",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L4 2010",
  "JOB SEARCH ACT - OTH ACT METHODS L4 2010",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2010",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L4 2010",
  "JOB SEARCH ACT - NOTHING L4 2010",
  "JOB SEARCH ACT - OTH PASS METHDS L4 2010",
  "JOB SEARCH ACT - CONT EMP DIR L1 2011",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L1 2011",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L1 2011",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2011",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2011",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2011",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2011",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L1 2011",
  "JOB SEARCH ACT - OTH ACT METHODS L1 2011",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2011",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L1 2011",
  "JOB SEARCH ACT - NOTHING L1 2011",
  "JOB SEARCH ACT - OTH PASS METHDS L1 2011",
  "JOB SEARCH ACT - CONT EMP DIR L2 2011",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L2 2011",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L2 2011",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2011",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2011",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2011",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2011",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L2 2011",
  "JOB SEARCH ACT - OTH ACT METHODS L2 2011",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2011",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L2 2011",
  "JOB SEARCH ACT - NOTHING L2 2011",
  "JOB SEARCH ACT - OTH PASS METHDS L2 2011",
  "JOB SEARCH ACT - CONT EMP DIR L3 2011",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L3 2011",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L3 2011",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2011",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2011",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2011",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2011",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L3 2011",
  "JOB SEARCH ACT - OTH ACT METHODS L3 2011",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2011",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L3 2011",
  "JOB SEARCH ACT - NOTHING L3 2011",
  "JOB SEARCH ACT - OTH PASS METHDS L3 2011",
  "JOB SEARCH ACT - CONT EMP DIR L4 2011",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L4 2011",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L4 2011",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2011",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2011",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2011",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2011",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L4 2011",
  "JOB SEARCH ACT - OTH ACT METHODS L4 2011",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2011",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L4 2011",
  "JOB SEARCH ACT - NOTHING L4 2011",
  "JOB SEARCH ACT - OTH PASS METHDS L4 2011",
  "JOB SEARCH ACT - CONT EMP DIR L1 2013",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L1 2013",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L1 2013",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2013",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2013",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2013",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2013",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L1 2013",
  "JOB SEARCH ACT - OTH ACT METHODS L1 2013",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2013",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L1 2013",
  "JOB SEARCH ACT - NOTHING L1 2013",
  "JOB SEARCH ACT - OTH PASS METHDS L1 2013",
  "JOB SEARCH ACT - CONT EMP DIR L2 2013",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L2 2013",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L2 2013",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2013",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2013",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2013",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2013",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L2 2013",
  "JOB SEARCH ACT - OTH ACT METHODS L2 2013",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2013",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L2 2013",
  "JOB SEARCH ACT - NOTHING L2 2013",
  "JOB SEARCH ACT - OTH PASS METHDS L2 2013",
  "JOB SEARCH ACT - CONT EMP DIR L3 2013",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L3 2013",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L3 2013",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2013",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2013",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2013",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2013",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L3 2013",
  "JOB SEARCH ACT - OTH ACT METHODS L3 2013",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2013",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L3 2013",
  "JOB SEARCH ACT - NOTHING L3 2013",
  "JOB SEARCH ACT - OTH PASS METHDS L3 2013",
  "JOB SEARCH ACT - CONT EMP DIR L4 2013",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L4 2013",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L4 2013",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2013",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2013",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2013",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2013",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L4 2013",
  "JOB SEARCH ACT - OTH ACT METHODS L4 2013",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2013",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L4 2013",
  "JOB SEARCH ACT - NOTHING L4 2013",
  "JOB SEARCH ACT - OTH PASS METHDS L4 2013",
  "JOB SEARCH ACT - CONT EMP DIR L5 2013",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L5 2013",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L5 2013",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2013",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2013",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2013",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2013",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L5 2013",
  "JOB SEARCH ACT - OTH ACT METHODS L5 2013",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2013",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L5 2013",
  "JOB SEARCH ACT - NOTHING L5 2013",
  "JOB SEARCH ACT - OTH PASS METHDS L5 2013",
  "JOB SEARCH ACT - CONT EMP DIR L6 2013",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L6 2013",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L6 2013",
  "JOB SEARCH ACT - CONT FRDS OR RELS L6 2013",
  "JOB SEARCH ACT - CONT SCH EMP CTR L6 2013",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L6 2013",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L6 2013",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L6 2013",
  "JOB SEARCH ACT - OTH ACT METHODS L6 2013",
  "JOB SEARCH ACT - LOOKED AT ADS L6 2013",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L6 2013",
  "JOB SEARCH ACT - NOTHING L6 2013",
  "JOB SEARCH ACT - OTH PASS METHDS L6 2013",
  "JOB SEARCH ACT - CONT EMP DIR L7 2013",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L7 2013",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L7 2013",
  "JOB SEARCH ACT - CONT FRDS OR RELS L7 2013",
  "JOB SEARCH ACT - CONT SCH EMP CTR L7 2013",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L7 2013",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L7 2013",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L7 2013",
  "JOB SEARCH ACT - OTH ACT METHODS L7 2013",
  "JOB SEARCH ACT - LOOKED AT ADS L7 2013",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L7 2013",
  "JOB SEARCH ACT - NOTHING L7 2013",
  "JOB SEARCH ACT - OTH PASS METHDS L7 2013",
  "JOB SEARCH ACT - CONT EMP DIR L1 2015",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L1 2015",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L1 2015",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2015",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2015",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2015",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2015",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L1 2015",
  "JOB SEARCH ACT - OTH ACT METHODS L1 2015",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2015",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L1 2015",
  "JOB SEARCH ACT - NOTHING L1 2015",
  "JOB SEARCH ACT - OTH PASS METHDS L1 2015",
  "JOB SEARCH ACT - CONT EMP DIR L2 2015",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L2 2015",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L2 2015",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2015",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2015",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2015",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2015",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L2 2015",
  "JOB SEARCH ACT - OTH ACT METHODS L2 2015",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2015",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L2 2015",
  "JOB SEARCH ACT - NOTHING L2 2015",
  "JOB SEARCH ACT - OTH PASS METHDS L2 2015",
  "JOB SEARCH ACT - CONT EMP DIR L3 2015",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L3 2015",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L3 2015",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2015",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2015",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2015",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2015",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L3 2015",
  "JOB SEARCH ACT - OTH ACT METHODS L3 2015",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2015",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L3 2015",
  "JOB SEARCH ACT - NOTHING L3 2015",
  "JOB SEARCH ACT - OTH PASS METHDS L3 2015",
  "JOB SEARCH ACT - CONT EMP DIR L4 2015",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L4 2015",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L4 2015",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2015",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2015",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2015",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2015",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L4 2015",
  "JOB SEARCH ACT - OTH ACT METHODS L4 2015",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2015",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L4 2015",
  "JOB SEARCH ACT - NOTHING L4 2015",
  "JOB SEARCH ACT - OTH PASS METHDS L4 2015",
  "JOB SEARCH ACT - CONT EMP DIR L5 2015",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L5 2015",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L5 2015",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2015",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2015",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2015",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2015",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L5 2015",
  "JOB SEARCH ACT - OTH ACT METHODS L5 2015",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2015",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L5 2015",
  "JOB SEARCH ACT - NOTHING L5 2015",
  "JOB SEARCH ACT - OTH PASS METHDS L5 2015",
  "JOB SEARCH ACT - CONT EMP DIR L6 2015",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L6 2015",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L6 2015",
  "JOB SEARCH ACT - CONT FRDS OR RELS L6 2015",
  "JOB SEARCH ACT - CONT SCH EMP CTR L6 2015",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L6 2015",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L6 2015",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L6 2015",
  "JOB SEARCH ACT - OTH ACT METHODS L6 2015",
  "JOB SEARCH ACT - LOOKED AT ADS L6 2015",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L6 2015",
  "JOB SEARCH ACT - NOTHING L6 2015",
  "JOB SEARCH ACT - OTH PASS METHDS L6 2015",
  "JOB SEARCH ACT - CONT EMP DIR L8 2015",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L8 2015",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L8 2015",
  "JOB SEARCH ACT - CONT FRDS OR RELS L8 2015",
  "JOB SEARCH ACT - CONT SCH EMP CTR L8 2015",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L8 2015",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L8 2015",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L8 2015",
  "JOB SEARCH ACT - OTH ACT METHODS L8 2015",
  "JOB SEARCH ACT - LOOKED AT ADS L8 2015",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L8 2015",
  "JOB SEARCH ACT - NOTHING L8 2015",
  "JOB SEARCH ACT - OTH PASS METHDS L8 2015",
  "JOB SEARCH ACT - CONT EMP DIR L1 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L1 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L1 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L1 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L1 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L1 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L1 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L1 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L1 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L1 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L1 2017",
  "JOB SEARCH ACT - NOTHING L1 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L1 2017",
  "JOB SEARCH ACT - CONT EMP DIR L2 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L2 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L2 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L2 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L2 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L2 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L2 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L2 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L2 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L2 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L2 2017",
  "JOB SEARCH ACT - NOTHING L2 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L2 2017",
  "JOB SEARCH ACT - CONT EMP DIR L3 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L3 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L3 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L3 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L3 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L3 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L3 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L3 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L3 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L3 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L3 2017",
  "JOB SEARCH ACT - NOTHING L3 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L3 2017",
  "JOB SEARCH ACT - CONT EMP DIR L4 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L4 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L4 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L4 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L4 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L4 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L4 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L4 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L4 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L4 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L4 2017",
  "JOB SEARCH ACT - NOTHING L4 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L4 2017",
  "JOB SEARCH ACT - CONT EMP DIR L5 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L5 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L5 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L5 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L5 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L5 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L5 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L5 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L5 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L5 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L5 2017",
  "JOB SEARCH ACT - NOTHING L5 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L5 2017",
  "JOB SEARCH ACT - CONT EMP DIR L6 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L6 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L6 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L6 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L6 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L6 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L6 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L6 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L6 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L6 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L6 2017",
  "JOB SEARCH ACT - NOTHING L6 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L6 2017",
  "JOB SEARCH ACT - CONT EMP DIR L7 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L7 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L7 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L7 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L7 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L7 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L7 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L7 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L7 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L7 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L7 2017",
  "JOB SEARCH ACT - NOTHING L7 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L7 2017",
  "JOB SEARCH ACT - CONT EMP DIR L8 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L8 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L8 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L8 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L8 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L8 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L8 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L8 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L8 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L8 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L8 2017",
  "JOB SEARCH ACT - NOTHING L8 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L8 2017",
  "JOB SEARCH ACT - CONT EMP DIR L9 2017",
  "JOB SEARCH ACT - CONT PUB EMP AGCY L9 2017",
  "JOB SEARCH ACT - CONT PRIV EMP AGCY L9 2017",
  "JOB SEARCH ACT - CONT FRDS OR RELS L9 2017",
  "JOB SEARCH ACT - CONT SCH EMP CTR L9 2017",
  "JOB SEARCH ACT - RESUMES OR APPLCNS L9 2017",
  "JOB SEARCH ACT - CHKD UNIONS/PROF REGS L9 2017",
  "JOB SEARCH ACT - PLCD/ANSWRD ADS L9 2017",
  "JOB SEARCH ACT - OTH ACT METHODS L9 2017",
  "JOB SEARCH ACT - LOOKED AT ADS L9 2017",
  "JOB SEARCH ACT - ATTD JOB TRN METHDS L9 2017",
  "JOB SEARCH ACT - NOTHING L9 2017",
  "JOB SEARCH ACT - OTH PASS METHDS L9 2017"
)


# Use qnames rather than rnums

qnames = function(data) {
  names(data) <- c("PUBID_1997",
    "YEMP-118000.01_000001_1997",
    "YEMP-118000.01_000002_1997",
    "YEMP-118000.01_000003_1997",
    "YEMP-118000.01_000004_1997",
    "YEMP-118000.01_000005_1997",
    "YEMP-118000.01_000006_1997",
    "YEMP-118000.01_000007_1997",
    "YEMP-118000.01_000008_1997",
    "YEMP-118000.01_000010_1997",
    "YEMP-118000.01_000011_1997",
    "YEMP-118000.01_000009_1997",
    "YEMP-118000.02_000001_1997",
    "YEMP-118000.02_000002_1997",
    "YEMP-118000.02_000003_1997",
    "YEMP-118000.02_000004_1997",
    "YEMP-118000.02_000005_1997",
    "YEMP-118000.02_000006_1997",
    "YEMP-118000.02_000007_1997",
    "YEMP-118000.02_000008_1997",
    "YEMP-118000.02_000010_1997",
    "YEMP-118000.02_000011_1997",
    "YEMP-118000.02_000009_1997",
    "YEMP-118000.03_000001_1997",
    "YEMP-118000.03_000002_1997",
    "YEMP-118000.03_000003_1997",
    "YEMP-118000.03_000004_1997",
    "YEMP-118000.03_000005_1997",
    "YEMP-118000.03_000006_1997",
    "YEMP-118000.03_000007_1997",
    "YEMP-118000.03_000008_1997",
    "YEMP-118000.03_000010_1997",
    "YEMP-118000.03_000011_1997",
    "YEMP-118000.03_000009_1997",
    "YEMP-118000.04_000001_1997",
    "YEMP-118000.04_000002_1997",
    "YEMP-118000.04_000003_1997",
    "YEMP-118000.04_000004_1997",
    "YEMP-118000.04_000005_1997",
    "YEMP-118000.04_000006_1997",
    "YEMP-118000.04_000007_1997",
    "YEMP-118000.04_000008_1997",
    "YEMP-118000.04_000010_1997",
    "YEMP-118000.04_000011_1997",
    "YEMP-118000.04_000009_1997",
    "YEMP-118000.05_000001_1997",
    "YEMP-118000.05_000002_1997",
    "YEMP-118000.05_000003_1997",
    "YEMP-118000.05_000004_1997",
    "YEMP-118000.05_000005_1997",
    "YEMP-118000.05_000006_1997",
    "YEMP-118000.05_000007_1997",
    "YEMP-118000.05_000008_1997",
    "YEMP-118000.05_000010_1997",
    "YEMP-118000.05_000011_1997",
    "YEMP-118000.05_000009_1997",
    "YEMP-118000.06_000001_1997",
    "YEMP-118000.06_000002_1997",
    "YEMP-118000.06_000003_1997",
    "YEMP-118000.06_000004_1997",
    "YEMP-118000.06_000005_1997",
    "YEMP-118000.06_000006_1997",
    "YEMP-118000.06_000007_1997",
    "YEMP-118000.06_000008_1997",
    "YEMP-118000.06_000010_1997",
    "YEMP-118000.06_000011_1997",
    "YEMP-118000.06_000009_1997",
    "KEY_SEX_1997",
    "KEY_BDATE_M_1997",
    "KEY_BDATE_Y_1997",
    "CV_SAMPLE_TYPE_1997",
    "KEY_RACE_ETHNICITY_1997",
    "YEMP-118000.01~000001_1998",
    "YEMP-118000.01~000002_1998",
    "YEMP-118000.01~000003_1998",
    "YEMP-118000.01~000004_1998",
    "YEMP-118000.01~000005_1998",
    "YEMP-118000.01~000006_1998",
    "YEMP-118000.01~000007_1998",
    "YEMP-118000.01~000008_1998",
    "YEMP-118000.01~000009_1998",
    "YEMP-118000.02~000001_1998",
    "YEMP-118000.02~000002_1998",
    "YEMP-118000.02~000003_1998",
    "YEMP-118000.02~000004_1998",
    "YEMP-118000.02~000005_1998",
    "YEMP-118000.02~000006_1998",
    "YEMP-118000.02~000007_1998",
    "YEMP-118000.02~000008_1998",
    "YEMP-118000.02~000009_1998",
    "YEMP-118000.03~000001_1998",
    "YEMP-118000.03~000002_1998",
    "YEMP-118000.03~000003_1998",
    "YEMP-118000.03~000004_1998",
    "YEMP-118000.03~000005_1998",
    "YEMP-118000.03~000006_1998",
    "YEMP-118000.03~000007_1998",
    "YEMP-118000.03~000008_1998",
    "YEMP-118000.03~000009_1998",
    "YEMP-118000.04~000001_1998",
    "YEMP-118000.04~000002_1998",
    "YEMP-118000.04~000003_1998",
    "YEMP-118000.04~000004_1998",
    "YEMP-118000.04~000005_1998",
    "YEMP-118000.04~000006_1998",
    "YEMP-118000.04~000007_1998",
    "YEMP-118000.04~000008_1998",
    "YEMP-118000.04~000009_1998",
    "YEMP-118000.05~000001_1998",
    "YEMP-118000.05~000002_1998",
    "YEMP-118000.05~000003_1998",
    "YEMP-118000.05~000004_1998",
    "YEMP-118000.05~000005_1998",
    "YEMP-118000.05~000006_1998",
    "YEMP-118000.05~000007_1998",
    "YEMP-118000.05~000008_1998",
    "YEMP-118000.05~000009_1998",
    "YEMP-118000.06~000001_1998",
    "YEMP-118000.06~000002_1998",
    "YEMP-118000.06~000003_1998",
    "YEMP-118000.06~000004_1998",
    "YEMP-118000.06~000005_1998",
    "YEMP-118000.06~000006_1998",
    "YEMP-118000.06~000007_1998",
    "YEMP-118000.06~000008_1998",
    "YEMP-118000.06~000009_1998",
    "YEMP-118000.01~000001_1999",
    "YEMP-118000.01~000002_1999",
    "YEMP-118000.01~000003_1999",
    "YEMP-118000.01~000004_1999",
    "YEMP-118000.01~000005_1999",
    "YEMP-118000.01~000006_1999",
    "YEMP-118000.01~000007_1999",
    "YEMP-118000.01~000008_1999",
    "YEMP-118000.01~000009_1999",
    "YEMP-118000.01~000011_1999",
    "YEMP-118000.01~000012_1999",
    "YEMP-118000.02~000001_1999",
    "YEMP-118000.02~000002_1999",
    "YEMP-118000.02~000003_1999",
    "YEMP-118000.02~000004_1999",
    "YEMP-118000.02~000005_1999",
    "YEMP-118000.02~000006_1999",
    "YEMP-118000.02~000007_1999",
    "YEMP-118000.02~000008_1999",
    "YEMP-118000.02~000009_1999",
    "YEMP-118000.02~000011_1999",
    "YEMP-118000.02~000012_1999",
    "YEMP-118000.03~000001_1999",
    "YEMP-118000.03~000002_1999",
    "YEMP-118000.03~000003_1999",
    "YEMP-118000.03~000004_1999",
    "YEMP-118000.03~000005_1999",
    "YEMP-118000.03~000006_1999",
    "YEMP-118000.03~000007_1999",
    "YEMP-118000.03~000008_1999",
    "YEMP-118000.03~000009_1999",
    "YEMP-118000.03~000011_1999",
    "YEMP-118000.03~000012_1999",
    "YEMP-118000.04~000001_1999",
    "YEMP-118000.04~000002_1999",
    "YEMP-118000.04~000003_1999",
    "YEMP-118000.04~000004_1999",
    "YEMP-118000.04~000005_1999",
    "YEMP-118000.04~000006_1999",
    "YEMP-118000.04~000007_1999",
    "YEMP-118000.04~000008_1999",
    "YEMP-118000.04~000009_1999",
    "YEMP-118000.04~000011_1999",
    "YEMP-118000.04~000012_1999",
    "YEMP-118000.05~000001_1999",
    "YEMP-118000.05~000002_1999",
    "YEMP-118000.05~000003_1999",
    "YEMP-118000.05~000004_1999",
    "YEMP-118000.05~000005_1999",
    "YEMP-118000.05~000006_1999",
    "YEMP-118000.05~000007_1999",
    "YEMP-118000.05~000008_1999",
    "YEMP-118000.05~000009_1999",
    "YEMP-118000.05~000011_1999",
    "YEMP-118000.05~000012_1999",
    "YEMP-118000.01~000001_2000",
    "YEMP-118000.01~000002_2000",
    "YEMP-118000.01~000003_2000",
    "YEMP-118000.01~000004_2000",
    "YEMP-118000.01~000005_2000",
    "YEMP-118000.01~000006_2000",
    "YEMP-118000.01~000007_2000",
    "YEMP-118000.01~000008_2000",
    "YEMP-118000.01~000009_2000",
    "YEMP-118000.01~000999_2000",
    "YEMP-118000.02~000001_2000",
    "YEMP-118000.02~000002_2000",
    "YEMP-118000.02~000003_2000",
    "YEMP-118000.02~000004_2000",
    "YEMP-118000.02~000005_2000",
    "YEMP-118000.02~000006_2000",
    "YEMP-118000.02~000007_2000",
    "YEMP-118000.02~000008_2000",
    "YEMP-118000.02~000009_2000",
    "YEMP-118000.02~000999_2000",
    "YEMP-118000.03~000001_2000",
    "YEMP-118000.03~000002_2000",
    "YEMP-118000.03~000003_2000",
    "YEMP-118000.03~000004_2000",
    "YEMP-118000.03~000005_2000",
    "YEMP-118000.03~000006_2000",
    "YEMP-118000.03~000007_2000",
    "YEMP-118000.03~000008_2000",
    "YEMP-118000.03~000009_2000",
    "YEMP-118000.03~000999_2000",
    "YEMP-118000.04~000001_2000",
    "YEMP-118000.04~000002_2000",
    "YEMP-118000.04~000003_2000",
    "YEMP-118000.04~000004_2000",
    "YEMP-118000.04~000005_2000",
    "YEMP-118000.04~000006_2000",
    "YEMP-118000.04~000007_2000",
    "YEMP-118000.04~000008_2000",
    "YEMP-118000.04~000009_2000",
    "YEMP-118000.04~000999_2000",
    "YEMP-118000.05~000001_2000",
    "YEMP-118000.05~000002_2000",
    "YEMP-118000.05~000003_2000",
    "YEMP-118000.05~000004_2000",
    "YEMP-118000.05~000005_2000",
    "YEMP-118000.05~000006_2000",
    "YEMP-118000.05~000007_2000",
    "YEMP-118000.05~000008_2000",
    "YEMP-118000.05~000009_2000",
    "YEMP-118000.05~000999_2000",
    "YEMP-118000.06~000001_2000",
    "YEMP-118000.06~000002_2000",
    "YEMP-118000.06~000003_2000",
    "YEMP-118000.06~000004_2000",
    "YEMP-118000.06~000005_2000",
    "YEMP-118000.06~000006_2000",
    "YEMP-118000.06~000007_2000",
    "YEMP-118000.06~000008_2000",
    "YEMP-118000.06~000009_2000",
    "YEMP-118000.06~000999_2000",
    "YEMP-118000.07~000001_2000",
    "YEMP-118000.07~000002_2000",
    "YEMP-118000.07~000003_2000",
    "YEMP-118000.07~000004_2000",
    "YEMP-118000.07~000005_2000",
    "YEMP-118000.07~000006_2000",
    "YEMP-118000.07~000007_2000",
    "YEMP-118000.07~000008_2000",
    "YEMP-118000.07~000009_2000",
    "YEMP-118000.07~000999_2000",
    "YEMP-118000.08~000001_2000",
    "YEMP-118000.08~000002_2000",
    "YEMP-118000.08~000003_2000",
    "YEMP-118000.08~000004_2000",
    "YEMP-118000.08~000005_2000",
    "YEMP-118000.08~000006_2000",
    "YEMP-118000.08~000007_2000",
    "YEMP-118000.08~000008_2000",
    "YEMP-118000.08~000009_2000",
    "YEMP-118000.08~000999_2000",
    "YEMP-118000.01~000001_2001",
    "YEMP-118000.01~000002_2001",
    "YEMP-118000.01~000003_2001",
    "YEMP-118000.01~000004_2001",
    "YEMP-118000.01~000005_2001",
    "YEMP-118000.01~000006_2001",
    "YEMP-118000.01~000007_2001",
    "YEMP-118000.01~000008_2001",
    "YEMP-118000.01~000011_2001",
    "YEMP-118000.01~000012_2001",
    "YEMP-118000.01~000009_2001",
    "YEMP-118000.01~000999_2001",
    "YEMP-118000.02~000001_2001",
    "YEMP-118000.02~000002_2001",
    "YEMP-118000.02~000003_2001",
    "YEMP-118000.02~000004_2001",
    "YEMP-118000.02~000005_2001",
    "YEMP-118000.02~000006_2001",
    "YEMP-118000.02~000007_2001",
    "YEMP-118000.02~000008_2001",
    "YEMP-118000.02~000011_2001",
    "YEMP-118000.02~000012_2001",
    "YEMP-118000.02~000009_2001",
    "YEMP-118000.02~000999_2001",
    "YEMP-118000.03~000001_2001",
    "YEMP-118000.03~000002_2001",
    "YEMP-118000.03~000003_2001",
    "YEMP-118000.03~000004_2001",
    "YEMP-118000.03~000005_2001",
    "YEMP-118000.03~000006_2001",
    "YEMP-118000.03~000007_2001",
    "YEMP-118000.03~000008_2001",
    "YEMP-118000.03~000011_2001",
    "YEMP-118000.03~000012_2001",
    "YEMP-118000.03~000009_2001",
    "YEMP-118000.03~000999_2001",
    "YEMP-118000.04~000001_2001",
    "YEMP-118000.04~000002_2001",
    "YEMP-118000.04~000003_2001",
    "YEMP-118000.04~000004_2001",
    "YEMP-118000.04~000005_2001",
    "YEMP-118000.04~000006_2001",
    "YEMP-118000.04~000007_2001",
    "YEMP-118000.04~000008_2001",
    "YEMP-118000.04~000011_2001",
    "YEMP-118000.04~000012_2001",
    "YEMP-118000.04~000009_2001",
    "YEMP-118000.04~000999_2001",
    "YEMP-118000.05~000001_2001",
    "YEMP-118000.05~000002_2001",
    "YEMP-118000.05~000003_2001",
    "YEMP-118000.05~000004_2001",
    "YEMP-118000.05~000005_2001",
    "YEMP-118000.05~000006_2001",
    "YEMP-118000.05~000007_2001",
    "YEMP-118000.05~000008_2001",
    "YEMP-118000.05~000011_2001",
    "YEMP-118000.05~000012_2001",
    "YEMP-118000.05~000009_2001",
    "YEMP-118000.05~000999_2001",
    "YEMP-118000.07~000001_2001",
    "YEMP-118000.07~000002_2001",
    "YEMP-118000.07~000003_2001",
    "YEMP-118000.07~000004_2001",
    "YEMP-118000.07~000005_2001",
    "YEMP-118000.07~000006_2001",
    "YEMP-118000.07~000007_2001",
    "YEMP-118000.07~000008_2001",
    "YEMP-118000.07~000011_2001",
    "YEMP-118000.07~000012_2001",
    "YEMP-118000.07~000009_2001",
    "YEMP-118000.07~000999_2001",
    "YEMP-119400.01~000001_2002",
    "YEMP-119400.01~000002_2002",
    "YEMP-119400.01~000003_2002",
    "YEMP-119400.01~000004_2002",
    "YEMP-119400.01~000005_2002",
    "YEMP-119400.01~000006_2002",
    "YEMP-119400.01~000007_2002",
    "YEMP-119400.01~000008_2002",
    "YEMP-119400.01~000009_2002",
    "YEMP-119400.01~000011_2002",
    "YEMP-119400.01~000012_2002",
    "YEMP-119400.01~000995_2002",
    "YEMP-119400.01~000999_2002",
    "YEMP-119400.02~000001_2002",
    "YEMP-119400.02~000002_2002",
    "YEMP-119400.02~000003_2002",
    "YEMP-119400.02~000004_2002",
    "YEMP-119400.02~000005_2002",
    "YEMP-119400.02~000006_2002",
    "YEMP-119400.02~000007_2002",
    "YEMP-119400.02~000008_2002",
    "YEMP-119400.02~000009_2002",
    "YEMP-119400.02~000011_2002",
    "YEMP-119400.02~000012_2002",
    "YEMP-119400.02~000995_2002",
    "YEMP-119400.02~000999_2002",
    "YEMP-119400.03~000001_2002",
    "YEMP-119400.03~000002_2002",
    "YEMP-119400.03~000003_2002",
    "YEMP-119400.03~000004_2002",
    "YEMP-119400.03~000005_2002",
    "YEMP-119400.03~000006_2002",
    "YEMP-119400.03~000007_2002",
    "YEMP-119400.03~000008_2002",
    "YEMP-119400.03~000009_2002",
    "YEMP-119400.03~000011_2002",
    "YEMP-119400.03~000012_2002",
    "YEMP-119400.03~000995_2002",
    "YEMP-119400.03~000999_2002",
    "YEMP-119400.04~000001_2002",
    "YEMP-119400.04~000002_2002",
    "YEMP-119400.04~000003_2002",
    "YEMP-119400.04~000004_2002",
    "YEMP-119400.04~000005_2002",
    "YEMP-119400.04~000006_2002",
    "YEMP-119400.04~000007_2002",
    "YEMP-119400.04~000008_2002",
    "YEMP-119400.04~000009_2002",
    "YEMP-119400.04~000011_2002",
    "YEMP-119400.04~000012_2002",
    "YEMP-119400.04~000995_2002",
    "YEMP-119400.04~000999_2002",
    "YEMP-119400.05~000001_2002",
    "YEMP-119400.05~000002_2002",
    "YEMP-119400.05~000003_2002",
    "YEMP-119400.05~000004_2002",
    "YEMP-119400.05~000005_2002",
    "YEMP-119400.05~000006_2002",
    "YEMP-119400.05~000007_2002",
    "YEMP-119400.05~000008_2002",
    "YEMP-119400.05~000009_2002",
    "YEMP-119400.05~000011_2002",
    "YEMP-119400.05~000012_2002",
    "YEMP-119400.05~000995_2002",
    "YEMP-119400.05~000999_2002",
    "YEMP-119400.06~000001_2002",
    "YEMP-119400.06~000002_2002",
    "YEMP-119400.06~000003_2002",
    "YEMP-119400.06~000004_2002",
    "YEMP-119400.06~000005_2002",
    "YEMP-119400.06~000006_2002",
    "YEMP-119400.06~000007_2002",
    "YEMP-119400.06~000008_2002",
    "YEMP-119400.06~000009_2002",
    "YEMP-119400.06~000995_2002",
    "YEMP-119400.06~000999_2002",
    "YEMP-119400.07~000001_2002",
    "YEMP-119400.07~000002_2002",
    "YEMP-119400.07~000003_2002",
    "YEMP-119400.07~000004_2002",
    "YEMP-119400.07~000005_2002",
    "YEMP-119400.07~000006_2002",
    "YEMP-119400.07~000007_2002",
    "YEMP-119400.07~000008_2002",
    "YEMP-119400.07~000009_2002",
    "YEMP-119400.07~000995_2002",
    "YEMP-119400.07~000999_2002",
    "YEMP-119400.08~000001_2002",
    "YEMP-119400.08~000002_2002",
    "YEMP-119400.08~000003_2002",
    "YEMP-119400.08~000004_2002",
    "YEMP-119400.08~000005_2002",
    "YEMP-119400.08~000006_2002",
    "YEMP-119400.08~000007_2002",
    "YEMP-119400.08~000008_2002",
    "YEMP-119400.08~000009_2002",
    "YEMP-119400.08~000995_2002",
    "YEMP-119400.08~000999_2002",
    "YEMP-119400.01~000001_2003",
    "YEMP-119400.01~000002_2003",
    "YEMP-119400.01~000003_2003",
    "YEMP-119400.01~000004_2003",
    "YEMP-119400.01~000005_2003",
    "YEMP-119400.01~000006_2003",
    "YEMP-119400.01~000007_2003",
    "YEMP-119400.01~000008_2003",
    "YEMP-119400.01~000011_2003",
    "YEMP-119400.01~000012_2003",
    "YEMP-119400.01~000009_2003",
    "YEMP-119400.01~000999_2003",
    "YEMP-119400.02~000001_2003",
    "YEMP-119400.02~000002_2003",
    "YEMP-119400.02~000003_2003",
    "YEMP-119400.02~000004_2003",
    "YEMP-119400.02~000005_2003",
    "YEMP-119400.02~000006_2003",
    "YEMP-119400.02~000007_2003",
    "YEMP-119400.02~000008_2003",
    "YEMP-119400.02~000011_2003",
    "YEMP-119400.02~000012_2003",
    "YEMP-119400.02~000009_2003",
    "YEMP-119400.02~000999_2003",
    "YEMP-119400.03~000001_2003",
    "YEMP-119400.03~000002_2003",
    "YEMP-119400.03~000003_2003",
    "YEMP-119400.03~000004_2003",
    "YEMP-119400.03~000005_2003",
    "YEMP-119400.03~000006_2003",
    "YEMP-119400.03~000007_2003",
    "YEMP-119400.03~000008_2003",
    "YEMP-119400.03~000011_2003",
    "YEMP-119400.03~000012_2003",
    "YEMP-119400.03~000009_2003",
    "YEMP-119400.04~000001_2003",
    "YEMP-119400.04~000002_2003",
    "YEMP-119400.04~000003_2003",
    "YEMP-119400.04~000004_2003",
    "YEMP-119400.04~000005_2003",
    "YEMP-119400.04~000006_2003",
    "YEMP-119400.04~000007_2003",
    "YEMP-119400.04~000008_2003",
    "YEMP-119400.04~000011_2003",
    "YEMP-119400.04~000012_2003",
    "YEMP-119400.04~000009_2003",
    "YEMP-119400.05~000001_2003",
    "YEMP-119400.05~000002_2003",
    "YEMP-119400.05~000003_2003",
    "YEMP-119400.05~000004_2003",
    "YEMP-119400.05~000005_2003",
    "YEMP-119400.05~000006_2003",
    "YEMP-119400.05~000007_2003",
    "YEMP-119400.05~000008_2003",
    "YEMP-119400.05~000011_2003",
    "YEMP-119400.05~000012_2003",
    "YEMP-119400.05~000009_2003",
    "YEMP-119400.01~000001_2004",
    "YEMP-119400.01~000002_2004",
    "YEMP-119400.01~000003_2004",
    "YEMP-119400.01~000004_2004",
    "YEMP-119400.01~000005_2004",
    "YEMP-119400.01~000006_2004",
    "YEMP-119400.01~000007_2004",
    "YEMP-119400.01~000008_2004",
    "YEMP-119400.01~000009_2004",
    "YEMP-119400.01~000011_2004",
    "YEMP-119400.01~000012_2004",
    "YEMP-119400.01~000999_2004",
    "YEMP-119400.02~000001_2004",
    "YEMP-119400.02~000002_2004",
    "YEMP-119400.02~000003_2004",
    "YEMP-119400.02~000004_2004",
    "YEMP-119400.02~000005_2004",
    "YEMP-119400.02~000006_2004",
    "YEMP-119400.02~000007_2004",
    "YEMP-119400.02~000008_2004",
    "YEMP-119400.02~000009_2004",
    "YEMP-119400.02~000011_2004",
    "YEMP-119400.02~000012_2004",
    "YEMP-119400.02~000999_2004",
    "YEMP-119400.03~000001_2004",
    "YEMP-119400.03~000002_2004",
    "YEMP-119400.03~000003_2004",
    "YEMP-119400.03~000004_2004",
    "YEMP-119400.03~000005_2004",
    "YEMP-119400.03~000006_2004",
    "YEMP-119400.03~000007_2004",
    "YEMP-119400.03~000008_2004",
    "YEMP-119400.03~000009_2004",
    "YEMP-119400.03~000011_2004",
    "YEMP-119400.03~000012_2004",
    "YEMP-119400.03~000999_2004",
    "YEMP-119400.04~000001_2004",
    "YEMP-119400.04~000002_2004",
    "YEMP-119400.04~000003_2004",
    "YEMP-119400.04~000004_2004",
    "YEMP-119400.04~000005_2004",
    "YEMP-119400.04~000006_2004",
    "YEMP-119400.04~000007_2004",
    "YEMP-119400.04~000008_2004",
    "YEMP-119400.04~000009_2004",
    "YEMP-119400.04~000011_2004",
    "YEMP-119400.04~000012_2004",
    "YEMP-119400.05~000001_2004",
    "YEMP-119400.05~000002_2004",
    "YEMP-119400.05~000003_2004",
    "YEMP-119400.05~000004_2004",
    "YEMP-119400.05~000005_2004",
    "YEMP-119400.05~000006_2004",
    "YEMP-119400.05~000007_2004",
    "YEMP-119400.05~000008_2004",
    "YEMP-119400.05~000009_2004",
    "YEMP-119400.05~000011_2004",
    "YEMP-119400.05~000012_2004",
    "YEMP-119400.06~000001_2004",
    "YEMP-119400.06~000002_2004",
    "YEMP-119400.06~000003_2004",
    "YEMP-119400.06~000004_2004",
    "YEMP-119400.06~000005_2004",
    "YEMP-119400.06~000006_2004",
    "YEMP-119400.06~000007_2004",
    "YEMP-119400.06~000008_2004",
    "YEMP-119400.06~000009_2004",
    "YEMP-119400.06~000011_2004",
    "YEMP-119400.06~000012_2004",
    "YEMP-119400.01~000001_2005",
    "YEMP-119400.01~000002_2005",
    "YEMP-119400.01~000003_2005",
    "YEMP-119400.01~000004_2005",
    "YEMP-119400.01~000005_2005",
    "YEMP-119400.01~000006_2005",
    "YEMP-119400.01~000007_2005",
    "YEMP-119400.01~000008_2005",
    "YEMP-119400.01~000009_2005",
    "YEMP-119400.01~000011_2005",
    "YEMP-119400.01~000012_2005",
    "YEMP-119400.01~000999_2005",
    "YEMP-119400.02~000001_2005",
    "YEMP-119400.02~000002_2005",
    "YEMP-119400.02~000003_2005",
    "YEMP-119400.02~000004_2005",
    "YEMP-119400.02~000005_2005",
    "YEMP-119400.02~000006_2005",
    "YEMP-119400.02~000007_2005",
    "YEMP-119400.02~000008_2005",
    "YEMP-119400.02~000009_2005",
    "YEMP-119400.02~000011_2005",
    "YEMP-119400.02~000012_2005",
    "YEMP-119400.03~000001_2005",
    "YEMP-119400.03~000002_2005",
    "YEMP-119400.03~000003_2005",
    "YEMP-119400.03~000004_2005",
    "YEMP-119400.03~000005_2005",
    "YEMP-119400.03~000006_2005",
    "YEMP-119400.03~000007_2005",
    "YEMP-119400.03~000008_2005",
    "YEMP-119400.03~000009_2005",
    "YEMP-119400.03~000011_2005",
    "YEMP-119400.03~000012_2005",
    "YEMP-119400.04~000001_2005",
    "YEMP-119400.04~000002_2005",
    "YEMP-119400.04~000003_2005",
    "YEMP-119400.04~000004_2005",
    "YEMP-119400.04~000005_2005",
    "YEMP-119400.04~000006_2005",
    "YEMP-119400.04~000007_2005",
    "YEMP-119400.04~000008_2005",
    "YEMP-119400.04~000009_2005",
    "YEMP-119400.04~000011_2005",
    "YEMP-119400.04~000012_2005",
    "YEMP-119400.05~000001_2005",
    "YEMP-119400.05~000002_2005",
    "YEMP-119400.05~000003_2005",
    "YEMP-119400.05~000004_2005",
    "YEMP-119400.05~000005_2005",
    "YEMP-119400.05~000006_2005",
    "YEMP-119400.05~000007_2005",
    "YEMP-119400.05~000008_2005",
    "YEMP-119400.05~000009_2005",
    "YEMP-119400.05~000011_2005",
    "YEMP-119400.05~000012_2005",
    "YEMP-119400.01~000001_2006",
    "YEMP-119400.01~000002_2006",
    "YEMP-119400.01~000003_2006",
    "YEMP-119400.01~000004_2006",
    "YEMP-119400.01~000005_2006",
    "YEMP-119400.01~000006_2006",
    "YEMP-119400.01~000007_2006",
    "YEMP-119400.01~000008_2006",
    "YEMP-119400.01~000009_2006",
    "YEMP-119400.01~000011_2006",
    "YEMP-119400.01~000012_2006",
    "YEMP-119400.01~000999_2006",
    "YEMP-119400.02~000001_2006",
    "YEMP-119400.02~000002_2006",
    "YEMP-119400.02~000003_2006",
    "YEMP-119400.02~000004_2006",
    "YEMP-119400.02~000005_2006",
    "YEMP-119400.02~000006_2006",
    "YEMP-119400.02~000007_2006",
    "YEMP-119400.02~000008_2006",
    "YEMP-119400.02~000009_2006",
    "YEMP-119400.02~000011_2006",
    "YEMP-119400.02~000012_2006",
    "YEMP-119400.03~000001_2006",
    "YEMP-119400.03~000002_2006",
    "YEMP-119400.03~000003_2006",
    "YEMP-119400.03~000004_2006",
    "YEMP-119400.03~000005_2006",
    "YEMP-119400.03~000006_2006",
    "YEMP-119400.03~000007_2006",
    "YEMP-119400.03~000008_2006",
    "YEMP-119400.03~000009_2006",
    "YEMP-119400.03~000011_2006",
    "YEMP-119400.03~000012_2006",
    "YEMP-119400.04~000001_2006",
    "YEMP-119400.04~000002_2006",
    "YEMP-119400.04~000003_2006",
    "YEMP-119400.04~000004_2006",
    "YEMP-119400.04~000005_2006",
    "YEMP-119400.04~000006_2006",
    "YEMP-119400.04~000007_2006",
    "YEMP-119400.04~000008_2006",
    "YEMP-119400.04~000009_2006",
    "YEMP-119400.04~000011_2006",
    "YEMP-119400.04~000012_2006",
    "YEMP-119400.05~000001_2006",
    "YEMP-119400.05~000002_2006",
    "YEMP-119400.05~000003_2006",
    "YEMP-119400.05~000004_2006",
    "YEMP-119400.05~000005_2006",
    "YEMP-119400.05~000006_2006",
    "YEMP-119400.05~000007_2006",
    "YEMP-119400.05~000008_2006",
    "YEMP-119400.05~000009_2006",
    "YEMP-119400.05~000011_2006",
    "YEMP-119400.05~000012_2006",
    "YEMP-119400.06~000001_2006",
    "YEMP-119400.06~000002_2006",
    "YEMP-119400.06~000003_2006",
    "YEMP-119400.06~000004_2006",
    "YEMP-119400.06~000005_2006",
    "YEMP-119400.06~000006_2006",
    "YEMP-119400.06~000007_2006",
    "YEMP-119400.06~000008_2006",
    "YEMP-119400.06~000009_2006",
    "YEMP-119400.06~000011_2006",
    "YEMP-119400.06~000012_2006",
    "YEMP-119400.01~000001_2007",
    "YEMP-119400.01~000002_2007",
    "YEMP-119400.01~000003_2007",
    "YEMP-119400.01~000004_2007",
    "YEMP-119400.01~000005_2007",
    "YEMP-119400.01~000006_2007",
    "YEMP-119400.01~000007_2007",
    "YEMP-119400.01~000008_2007",
    "YEMP-119400.01~000009_2007",
    "YEMP-119400.01~000011_2007",
    "YEMP-119400.01~000012_2007",
    "YEMP-119400.01~000999_2007",
    "YEMP-119400.02~000001_2007",
    "YEMP-119400.02~000002_2007",
    "YEMP-119400.02~000003_2007",
    "YEMP-119400.02~000004_2007",
    "YEMP-119400.02~000005_2007",
    "YEMP-119400.02~000006_2007",
    "YEMP-119400.02~000007_2007",
    "YEMP-119400.02~000008_2007",
    "YEMP-119400.02~000009_2007",
    "YEMP-119400.02~000011_2007",
    "YEMP-119400.02~000012_2007",
    "YEMP-119400.03~000001_2007",
    "YEMP-119400.03~000002_2007",
    "YEMP-119400.03~000003_2007",
    "YEMP-119400.03~000004_2007",
    "YEMP-119400.03~000005_2007",
    "YEMP-119400.03~000006_2007",
    "YEMP-119400.03~000007_2007",
    "YEMP-119400.03~000008_2007",
    "YEMP-119400.03~000009_2007",
    "YEMP-119400.03~000011_2007",
    "YEMP-119400.03~000012_2007",
    "YEMP-119400.04~000001_2007",
    "YEMP-119400.04~000002_2007",
    "YEMP-119400.04~000003_2007",
    "YEMP-119400.04~000004_2007",
    "YEMP-119400.04~000005_2007",
    "YEMP-119400.04~000006_2007",
    "YEMP-119400.04~000007_2007",
    "YEMP-119400.04~000008_2007",
    "YEMP-119400.04~000009_2007",
    "YEMP-119400.04~000011_2007",
    "YEMP-119400.04~000012_2007",
    "YEMP-119400.05~000001_2007",
    "YEMP-119400.05~000002_2007",
    "YEMP-119400.05~000003_2007",
    "YEMP-119400.05~000004_2007",
    "YEMP-119400.05~000005_2007",
    "YEMP-119400.05~000006_2007",
    "YEMP-119400.05~000007_2007",
    "YEMP-119400.05~000008_2007",
    "YEMP-119400.05~000009_2007",
    "YEMP-119400.05~000011_2007",
    "YEMP-119400.05~000012_2007",
    "YEMP-119400.06~000001_2007",
    "YEMP-119400.06~000002_2007",
    "YEMP-119400.06~000003_2007",
    "YEMP-119400.06~000004_2007",
    "YEMP-119400.06~000005_2007",
    "YEMP-119400.06~000006_2007",
    "YEMP-119400.06~000007_2007",
    "YEMP-119400.06~000008_2007",
    "YEMP-119400.06~000009_2007",
    "YEMP-119400.06~000011_2007",
    "YEMP-119400.06~000012_2007",
    "YEMP-119400.07~000001_2007",
    "YEMP-119400.07~000002_2007",
    "YEMP-119400.07~000003_2007",
    "YEMP-119400.07~000004_2007",
    "YEMP-119400.07~000005_2007",
    "YEMP-119400.07~000006_2007",
    "YEMP-119400.07~000007_2007",
    "YEMP-119400.07~000008_2007",
    "YEMP-119400.07~000009_2007",
    "YEMP-119400.07~000011_2007",
    "YEMP-119400.07~000012_2007",
    "YEMP-119400.08~000001_2007",
    "YEMP-119400.08~000002_2007",
    "YEMP-119400.08~000003_2007",
    "YEMP-119400.08~000004_2007",
    "YEMP-119400.08~000005_2007",
    "YEMP-119400.08~000006_2007",
    "YEMP-119400.08~000007_2007",
    "YEMP-119400.08~000008_2007",
    "YEMP-119400.08~000009_2007",
    "YEMP-119400.08~000011_2007",
    "YEMP-119400.08~000012_2007",
    "YEMP-119400.01~000001_2008",
    "YEMP-119400.01~000002_2008",
    "YEMP-119400.01~000003_2008",
    "YEMP-119400.01~000004_2008",
    "YEMP-119400.01~000005_2008",
    "YEMP-119400.01~000006_2008",
    "YEMP-119400.01~000007_2008",
    "YEMP-119400.01~000008_2008",
    "YEMP-119400.01~000009_2008",
    "YEMP-119400.01~000010_2008",
    "YEMP-119400.01~000011_2008",
    "YEMP-119400.01~000012_2008",
    "YEMP-119400.01~000013_2008",
    "YEMP-119400.01~000999_2008",
    "YEMP-119400.02~000001_2008",
    "YEMP-119400.02~000002_2008",
    "YEMP-119400.02~000003_2008",
    "YEMP-119400.02~000004_2008",
    "YEMP-119400.02~000005_2008",
    "YEMP-119400.02~000006_2008",
    "YEMP-119400.02~000007_2008",
    "YEMP-119400.02~000008_2008",
    "YEMP-119400.02~000009_2008",
    "YEMP-119400.02~000010_2008",
    "YEMP-119400.02~000011_2008",
    "YEMP-119400.02~000012_2008",
    "YEMP-119400.02~000013_2008",
    "YEMP-119400.02~000999_2008",
    "YEMP-119400.03~000001_2008",
    "YEMP-119400.03~000002_2008",
    "YEMP-119400.03~000003_2008",
    "YEMP-119400.03~000004_2008",
    "YEMP-119400.03~000005_2008",
    "YEMP-119400.03~000006_2008",
    "YEMP-119400.03~000007_2008",
    "YEMP-119400.03~000008_2008",
    "YEMP-119400.03~000009_2008",
    "YEMP-119400.03~000010_2008",
    "YEMP-119400.03~000011_2008",
    "YEMP-119400.03~000012_2008",
    "YEMP-119400.03~000013_2008",
    "YEMP-119400.04~000001_2008",
    "YEMP-119400.04~000002_2008",
    "YEMP-119400.04~000003_2008",
    "YEMP-119400.04~000004_2008",
    "YEMP-119400.04~000005_2008",
    "YEMP-119400.04~000006_2008",
    "YEMP-119400.04~000007_2008",
    "YEMP-119400.04~000008_2008",
    "YEMP-119400.04~000009_2008",
    "YEMP-119400.04~000010_2008",
    "YEMP-119400.04~000011_2008",
    "YEMP-119400.04~000012_2008",
    "YEMP-119400.04~000013_2008",
    "YEMP-119400.05~000001_2008",
    "YEMP-119400.05~000002_2008",
    "YEMP-119400.05~000003_2008",
    "YEMP-119400.05~000004_2008",
    "YEMP-119400.05~000005_2008",
    "YEMP-119400.05~000006_2008",
    "YEMP-119400.05~000007_2008",
    "YEMP-119400.05~000008_2008",
    "YEMP-119400.05~000009_2008",
    "YEMP-119400.05~000010_2008",
    "YEMP-119400.05~000011_2008",
    "YEMP-119400.05~000012_2008",
    "YEMP-119400.05~000013_2008",
    "YEMP-119400.06~000001_2008",
    "YEMP-119400.06~000002_2008",
    "YEMP-119400.06~000003_2008",
    "YEMP-119400.06~000004_2008",
    "YEMP-119400.06~000005_2008",
    "YEMP-119400.06~000006_2008",
    "YEMP-119400.06~000007_2008",
    "YEMP-119400.06~000008_2008",
    "YEMP-119400.06~000009_2008",
    "YEMP-119400.06~000010_2008",
    "YEMP-119400.06~000011_2008",
    "YEMP-119400.06~000012_2008",
    "YEMP-119400.06~000013_2008",
    "YEMP-119400.08~000001_2008",
    "YEMP-119400.08~000002_2008",
    "YEMP-119400.08~000003_2008",
    "YEMP-119400.08~000004_2008",
    "YEMP-119400.08~000005_2008",
    "YEMP-119400.08~000006_2008",
    "YEMP-119400.08~000007_2008",
    "YEMP-119400.08~000008_2008",
    "YEMP-119400.08~000009_2008",
    "YEMP-119400.08~000010_2008",
    "YEMP-119400.08~000011_2008",
    "YEMP-119400.08~000012_2008",
    "YEMP-119400.08~000013_2008",
    "YEMP-119400.01~000001_2009",
    "YEMP-119400.01~000002_2009",
    "YEMP-119400.01~000003_2009",
    "YEMP-119400.01~000004_2009",
    "YEMP-119400.01~000005_2009",
    "YEMP-119400.01~000006_2009",
    "YEMP-119400.01~000007_2009",
    "YEMP-119400.01~000008_2009",
    "YEMP-119400.01~000009_2009",
    "YEMP-119400.01~000010_2009",
    "YEMP-119400.01~000011_2009",
    "YEMP-119400.01~000012_2009",
    "YEMP-119400.01~000013_2009",
    "YEMP-119400.02~000001_2009",
    "YEMP-119400.02~000002_2009",
    "YEMP-119400.02~000003_2009",
    "YEMP-119400.02~000004_2009",
    "YEMP-119400.02~000005_2009",
    "YEMP-119400.02~000006_2009",
    "YEMP-119400.02~000007_2009",
    "YEMP-119400.02~000008_2009",
    "YEMP-119400.02~000009_2009",
    "YEMP-119400.02~000010_2009",
    "YEMP-119400.02~000011_2009",
    "YEMP-119400.02~000012_2009",
    "YEMP-119400.02~000013_2009",
    "YEMP-119400.03~000001_2009",
    "YEMP-119400.03~000002_2009",
    "YEMP-119400.03~000003_2009",
    "YEMP-119400.03~000004_2009",
    "YEMP-119400.03~000005_2009",
    "YEMP-119400.03~000006_2009",
    "YEMP-119400.03~000007_2009",
    "YEMP-119400.03~000008_2009",
    "YEMP-119400.03~000009_2009",
    "YEMP-119400.03~000010_2009",
    "YEMP-119400.03~000011_2009",
    "YEMP-119400.03~000012_2009",
    "YEMP-119400.03~000013_2009",
    "YEMP-119400.04~000001_2009",
    "YEMP-119400.04~000002_2009",
    "YEMP-119400.04~000003_2009",
    "YEMP-119400.04~000004_2009",
    "YEMP-119400.04~000005_2009",
    "YEMP-119400.04~000006_2009",
    "YEMP-119400.04~000007_2009",
    "YEMP-119400.04~000008_2009",
    "YEMP-119400.04~000009_2009",
    "YEMP-119400.04~000010_2009",
    "YEMP-119400.04~000011_2009",
    "YEMP-119400.04~000012_2009",
    "YEMP-119400.04~000013_2009",
    "YEMP-119400.05~000001_2009",
    "YEMP-119400.05~000002_2009",
    "YEMP-119400.05~000003_2009",
    "YEMP-119400.05~000004_2009",
    "YEMP-119400.05~000005_2009",
    "YEMP-119400.05~000006_2009",
    "YEMP-119400.05~000007_2009",
    "YEMP-119400.05~000008_2009",
    "YEMP-119400.05~000009_2009",
    "YEMP-119400.05~000010_2009",
    "YEMP-119400.05~000011_2009",
    "YEMP-119400.05~000012_2009",
    "YEMP-119400.05~000013_2009",
    "YEMP-119400.01~000001_2010",
    "YEMP-119400.01~000002_2010",
    "YEMP-119400.01~000003_2010",
    "YEMP-119400.01~000004_2010",
    "YEMP-119400.01~000005_2010",
    "YEMP-119400.01~000006_2010",
    "YEMP-119400.01~000007_2010",
    "YEMP-119400.01~000008_2010",
    "YEMP-119400.01~000009_2010",
    "YEMP-119400.01~000010_2010",
    "YEMP-119400.01~000011_2010",
    "YEMP-119400.01~000012_2010",
    "YEMP-119400.01~000013_2010",
    "YEMP-119400.02~000001_2010",
    "YEMP-119400.02~000002_2010",
    "YEMP-119400.02~000003_2010",
    "YEMP-119400.02~000004_2010",
    "YEMP-119400.02~000005_2010",
    "YEMP-119400.02~000006_2010",
    "YEMP-119400.02~000007_2010",
    "YEMP-119400.02~000008_2010",
    "YEMP-119400.02~000009_2010",
    "YEMP-119400.02~000010_2010",
    "YEMP-119400.02~000011_2010",
    "YEMP-119400.02~000012_2010",
    "YEMP-119400.02~000013_2010",
    "YEMP-119400.03~000001_2010",
    "YEMP-119400.03~000002_2010",
    "YEMP-119400.03~000003_2010",
    "YEMP-119400.03~000004_2010",
    "YEMP-119400.03~000005_2010",
    "YEMP-119400.03~000006_2010",
    "YEMP-119400.03~000007_2010",
    "YEMP-119400.03~000008_2010",
    "YEMP-119400.03~000009_2010",
    "YEMP-119400.03~000010_2010",
    "YEMP-119400.03~000011_2010",
    "YEMP-119400.03~000012_2010",
    "YEMP-119400.03~000013_2010",
    "YEMP-119400.04~000001_2010",
    "YEMP-119400.04~000002_2010",
    "YEMP-119400.04~000003_2010",
    "YEMP-119400.04~000004_2010",
    "YEMP-119400.04~000005_2010",
    "YEMP-119400.04~000006_2010",
    "YEMP-119400.04~000007_2010",
    "YEMP-119400.04~000008_2010",
    "YEMP-119400.04~000009_2010",
    "YEMP-119400.04~000010_2010",
    "YEMP-119400.04~000011_2010",
    "YEMP-119400.04~000012_2010",
    "YEMP-119400.04~000013_2010",
    "YEMP-119400.01~000001_2011",
    "YEMP-119400.01~000002_2011",
    "YEMP-119400.01~000003_2011",
    "YEMP-119400.01~000004_2011",
    "YEMP-119400.01~000005_2011",
    "YEMP-119400.01~000006_2011",
    "YEMP-119400.01~000007_2011",
    "YEMP-119400.01~000008_2011",
    "YEMP-119400.01~000009_2011",
    "YEMP-119400.01~000010_2011",
    "YEMP-119400.01~000011_2011",
    "YEMP-119400.01~000012_2011",
    "YEMP-119400.01~000013_2011",
    "YEMP-119400.02~000001_2011",
    "YEMP-119400.02~000002_2011",
    "YEMP-119400.02~000003_2011",
    "YEMP-119400.02~000004_2011",
    "YEMP-119400.02~000005_2011",
    "YEMP-119400.02~000006_2011",
    "YEMP-119400.02~000007_2011",
    "YEMP-119400.02~000008_2011",
    "YEMP-119400.02~000009_2011",
    "YEMP-119400.02~000010_2011",
    "YEMP-119400.02~000011_2011",
    "YEMP-119400.02~000012_2011",
    "YEMP-119400.02~000013_2011",
    "YEMP-119400.03~000001_2011",
    "YEMP-119400.03~000002_2011",
    "YEMP-119400.03~000003_2011",
    "YEMP-119400.03~000004_2011",
    "YEMP-119400.03~000005_2011",
    "YEMP-119400.03~000006_2011",
    "YEMP-119400.03~000007_2011",
    "YEMP-119400.03~000008_2011",
    "YEMP-119400.03~000009_2011",
    "YEMP-119400.03~000010_2011",
    "YEMP-119400.03~000011_2011",
    "YEMP-119400.03~000012_2011",
    "YEMP-119400.03~000013_2011",
    "YEMP-119400.04~000001_2011",
    "YEMP-119400.04~000002_2011",
    "YEMP-119400.04~000003_2011",
    "YEMP-119400.04~000004_2011",
    "YEMP-119400.04~000005_2011",
    "YEMP-119400.04~000006_2011",
    "YEMP-119400.04~000007_2011",
    "YEMP-119400.04~000008_2011",
    "YEMP-119400.04~000009_2011",
    "YEMP-119400.04~000010_2011",
    "YEMP-119400.04~000011_2011",
    "YEMP-119400.04~000012_2011",
    "YEMP-119400.04~000013_2011",
    "YEMP-119400.01~000001_2013",
    "YEMP-119400.01~000002_2013",
    "YEMP-119400.01~000003_2013",
    "YEMP-119400.01~000004_2013",
    "YEMP-119400.01~000005_2013",
    "YEMP-119400.01~000006_2013",
    "YEMP-119400.01~000007_2013",
    "YEMP-119400.01~000008_2013",
    "YEMP-119400.01~000009_2013",
    "YEMP-119400.01~000010_2013",
    "YEMP-119400.01~000011_2013",
    "YEMP-119400.01~000012_2013",
    "YEMP-119400.01~000013_2013",
    "YEMP-119400.02~000001_2013",
    "YEMP-119400.02~000002_2013",
    "YEMP-119400.02~000003_2013",
    "YEMP-119400.02~000004_2013",
    "YEMP-119400.02~000005_2013",
    "YEMP-119400.02~000006_2013",
    "YEMP-119400.02~000007_2013",
    "YEMP-119400.02~000008_2013",
    "YEMP-119400.02~000009_2013",
    "YEMP-119400.02~000010_2013",
    "YEMP-119400.02~000011_2013",
    "YEMP-119400.02~000012_2013",
    "YEMP-119400.02~000013_2013",
    "YEMP-119400.03~000001_2013",
    "YEMP-119400.03~000002_2013",
    "YEMP-119400.03~000003_2013",
    "YEMP-119400.03~000004_2013",
    "YEMP-119400.03~000005_2013",
    "YEMP-119400.03~000006_2013",
    "YEMP-119400.03~000007_2013",
    "YEMP-119400.03~000008_2013",
    "YEMP-119400.03~000009_2013",
    "YEMP-119400.03~000010_2013",
    "YEMP-119400.03~000011_2013",
    "YEMP-119400.03~000012_2013",
    "YEMP-119400.03~000013_2013",
    "YEMP-119400.04~000001_2013",
    "YEMP-119400.04~000002_2013",
    "YEMP-119400.04~000003_2013",
    "YEMP-119400.04~000004_2013",
    "YEMP-119400.04~000005_2013",
    "YEMP-119400.04~000006_2013",
    "YEMP-119400.04~000007_2013",
    "YEMP-119400.04~000008_2013",
    "YEMP-119400.04~000009_2013",
    "YEMP-119400.04~000010_2013",
    "YEMP-119400.04~000011_2013",
    "YEMP-119400.04~000012_2013",
    "YEMP-119400.04~000013_2013",
    "YEMP-119400.05~000001_2013",
    "YEMP-119400.05~000002_2013",
    "YEMP-119400.05~000003_2013",
    "YEMP-119400.05~000004_2013",
    "YEMP-119400.05~000005_2013",
    "YEMP-119400.05~000006_2013",
    "YEMP-119400.05~000007_2013",
    "YEMP-119400.05~000008_2013",
    "YEMP-119400.05~000009_2013",
    "YEMP-119400.05~000010_2013",
    "YEMP-119400.05~000011_2013",
    "YEMP-119400.05~000012_2013",
    "YEMP-119400.05~000013_2013",
    "YEMP-119400.06~000001_2013",
    "YEMP-119400.06~000002_2013",
    "YEMP-119400.06~000003_2013",
    "YEMP-119400.06~000004_2013",
    "YEMP-119400.06~000005_2013",
    "YEMP-119400.06~000006_2013",
    "YEMP-119400.06~000007_2013",
    "YEMP-119400.06~000008_2013",
    "YEMP-119400.06~000009_2013",
    "YEMP-119400.06~000010_2013",
    "YEMP-119400.06~000011_2013",
    "YEMP-119400.06~000012_2013",
    "YEMP-119400.06~000013_2013",
    "YEMP-119400.07~000001_2013",
    "YEMP-119400.07~000002_2013",
    "YEMP-119400.07~000003_2013",
    "YEMP-119400.07~000004_2013",
    "YEMP-119400.07~000005_2013",
    "YEMP-119400.07~000006_2013",
    "YEMP-119400.07~000007_2013",
    "YEMP-119400.07~000008_2013",
    "YEMP-119400.07~000009_2013",
    "YEMP-119400.07~000010_2013",
    "YEMP-119400.07~000011_2013",
    "YEMP-119400.07~000012_2013",
    "YEMP-119400.07~000013_2013",
    "YEMP-119400.01~000001_2015",
    "YEMP-119400.01~000002_2015",
    "YEMP-119400.01~000003_2015",
    "YEMP-119400.01~000004_2015",
    "YEMP-119400.01~000005_2015",
    "YEMP-119400.01~000006_2015",
    "YEMP-119400.01~000007_2015",
    "YEMP-119400.01~000008_2015",
    "YEMP-119400.01~000009_2015",
    "YEMP-119400.01~000010_2015",
    "YEMP-119400.01~000011_2015",
    "YEMP-119400.01~000012_2015",
    "YEMP-119400.01~000013_2015",
    "YEMP-119400.02~000001_2015",
    "YEMP-119400.02~000002_2015",
    "YEMP-119400.02~000003_2015",
    "YEMP-119400.02~000004_2015",
    "YEMP-119400.02~000005_2015",
    "YEMP-119400.02~000006_2015",
    "YEMP-119400.02~000007_2015",
    "YEMP-119400.02~000008_2015",
    "YEMP-119400.02~000009_2015",
    "YEMP-119400.02~000010_2015",
    "YEMP-119400.02~000011_2015",
    "YEMP-119400.02~000012_2015",
    "YEMP-119400.02~000013_2015",
    "YEMP-119400.03~000001_2015",
    "YEMP-119400.03~000002_2015",
    "YEMP-119400.03~000003_2015",
    "YEMP-119400.03~000004_2015",
    "YEMP-119400.03~000005_2015",
    "YEMP-119400.03~000006_2015",
    "YEMP-119400.03~000007_2015",
    "YEMP-119400.03~000008_2015",
    "YEMP-119400.03~000009_2015",
    "YEMP-119400.03~000010_2015",
    "YEMP-119400.03~000011_2015",
    "YEMP-119400.03~000012_2015",
    "YEMP-119400.03~000013_2015",
    "YEMP-119400.04~000001_2015",
    "YEMP-119400.04~000002_2015",
    "YEMP-119400.04~000003_2015",
    "YEMP-119400.04~000004_2015",
    "YEMP-119400.04~000005_2015",
    "YEMP-119400.04~000006_2015",
    "YEMP-119400.04~000007_2015",
    "YEMP-119400.04~000008_2015",
    "YEMP-119400.04~000009_2015",
    "YEMP-119400.04~000010_2015",
    "YEMP-119400.04~000011_2015",
    "YEMP-119400.04~000012_2015",
    "YEMP-119400.04~000013_2015",
    "YEMP-119400.05~000001_2015",
    "YEMP-119400.05~000002_2015",
    "YEMP-119400.05~000003_2015",
    "YEMP-119400.05~000004_2015",
    "YEMP-119400.05~000005_2015",
    "YEMP-119400.05~000006_2015",
    "YEMP-119400.05~000007_2015",
    "YEMP-119400.05~000008_2015",
    "YEMP-119400.05~000009_2015",
    "YEMP-119400.05~000010_2015",
    "YEMP-119400.05~000011_2015",
    "YEMP-119400.05~000012_2015",
    "YEMP-119400.05~000013_2015",
    "YEMP-119400.06~000001_2015",
    "YEMP-119400.06~000002_2015",
    "YEMP-119400.06~000003_2015",
    "YEMP-119400.06~000004_2015",
    "YEMP-119400.06~000005_2015",
    "YEMP-119400.06~000006_2015",
    "YEMP-119400.06~000007_2015",
    "YEMP-119400.06~000008_2015",
    "YEMP-119400.06~000009_2015",
    "YEMP-119400.06~000010_2015",
    "YEMP-119400.06~000011_2015",
    "YEMP-119400.06~000012_2015",
    "YEMP-119400.06~000013_2015",
    "YEMP-119400.08~000001_2015",
    "YEMP-119400.08~000002_2015",
    "YEMP-119400.08~000003_2015",
    "YEMP-119400.08~000004_2015",
    "YEMP-119400.08~000005_2015",
    "YEMP-119400.08~000006_2015",
    "YEMP-119400.08~000007_2015",
    "YEMP-119400.08~000008_2015",
    "YEMP-119400.08~000009_2015",
    "YEMP-119400.08~000010_2015",
    "YEMP-119400.08~000011_2015",
    "YEMP-119400.08~000012_2015",
    "YEMP-119400.08~000013_2015",
    "YEMP-119400.01~000001_2017",
    "YEMP-119400.01~000002_2017",
    "YEMP-119400.01~000003_2017",
    "YEMP-119400.01~000004_2017",
    "YEMP-119400.01~000005_2017",
    "YEMP-119400.01~000006_2017",
    "YEMP-119400.01~000007_2017",
    "YEMP-119400.01~000008_2017",
    "YEMP-119400.01~000009_2017",
    "YEMP-119400.01~000010_2017",
    "YEMP-119400.01~000011_2017",
    "YEMP-119400.01~000012_2017",
    "YEMP-119400.01~000013_2017",
    "YEMP-119400.02~000001_2017",
    "YEMP-119400.02~000002_2017",
    "YEMP-119400.02~000003_2017",
    "YEMP-119400.02~000004_2017",
    "YEMP-119400.02~000005_2017",
    "YEMP-119400.02~000006_2017",
    "YEMP-119400.02~000007_2017",
    "YEMP-119400.02~000008_2017",
    "YEMP-119400.02~000009_2017",
    "YEMP-119400.02~000010_2017",
    "YEMP-119400.02~000011_2017",
    "YEMP-119400.02~000012_2017",
    "YEMP-119400.02~000013_2017",
    "YEMP-119400.03~000001_2017",
    "YEMP-119400.03~000002_2017",
    "YEMP-119400.03~000003_2017",
    "YEMP-119400.03~000004_2017",
    "YEMP-119400.03~000005_2017",
    "YEMP-119400.03~000006_2017",
    "YEMP-119400.03~000007_2017",
    "YEMP-119400.03~000008_2017",
    "YEMP-119400.03~000009_2017",
    "YEMP-119400.03~000010_2017",
    "YEMP-119400.03~000011_2017",
    "YEMP-119400.03~000012_2017",
    "YEMP-119400.03~000013_2017",
    "YEMP-119400.04~000001_2017",
    "YEMP-119400.04~000002_2017",
    "YEMP-119400.04~000003_2017",
    "YEMP-119400.04~000004_2017",
    "YEMP-119400.04~000005_2017",
    "YEMP-119400.04~000006_2017",
    "YEMP-119400.04~000007_2017",
    "YEMP-119400.04~000008_2017",
    "YEMP-119400.04~000009_2017",
    "YEMP-119400.04~000010_2017",
    "YEMP-119400.04~000011_2017",
    "YEMP-119400.04~000012_2017",
    "YEMP-119400.04~000013_2017",
    "YEMP-119400.05~000001_2017",
    "YEMP-119400.05~000002_2017",
    "YEMP-119400.05~000003_2017",
    "YEMP-119400.05~000004_2017",
    "YEMP-119400.05~000005_2017",
    "YEMP-119400.05~000006_2017",
    "YEMP-119400.05~000007_2017",
    "YEMP-119400.05~000008_2017",
    "YEMP-119400.05~000009_2017",
    "YEMP-119400.05~000010_2017",
    "YEMP-119400.05~000011_2017",
    "YEMP-119400.05~000012_2017",
    "YEMP-119400.05~000013_2017",
    "YEMP-119400.06~000001_2017",
    "YEMP-119400.06~000002_2017",
    "YEMP-119400.06~000003_2017",
    "YEMP-119400.06~000004_2017",
    "YEMP-119400.06~000005_2017",
    "YEMP-119400.06~000006_2017",
    "YEMP-119400.06~000007_2017",
    "YEMP-119400.06~000008_2017",
    "YEMP-119400.06~000009_2017",
    "YEMP-119400.06~000010_2017",
    "YEMP-119400.06~000011_2017",
    "YEMP-119400.06~000012_2017",
    "YEMP-119400.06~000013_2017",
    "YEMP-119400.07~000001_2017",
    "YEMP-119400.07~000002_2017",
    "YEMP-119400.07~000003_2017",
    "YEMP-119400.07~000004_2017",
    "YEMP-119400.07~000005_2017",
    "YEMP-119400.07~000006_2017",
    "YEMP-119400.07~000007_2017",
    "YEMP-119400.07~000008_2017",
    "YEMP-119400.07~000009_2017",
    "YEMP-119400.07~000010_2017",
    "YEMP-119400.07~000011_2017",
    "YEMP-119400.07~000012_2017",
    "YEMP-119400.07~000013_2017",
    "YEMP-119400.08~000001_2017",
    "YEMP-119400.08~000002_2017",
    "YEMP-119400.08~000003_2017",
    "YEMP-119400.08~000004_2017",
    "YEMP-119400.08~000005_2017",
    "YEMP-119400.08~000006_2017",
    "YEMP-119400.08~000007_2017",
    "YEMP-119400.08~000008_2017",
    "YEMP-119400.08~000009_2017",
    "YEMP-119400.08~000010_2017",
    "YEMP-119400.08~000011_2017",
    "YEMP-119400.08~000012_2017",
    "YEMP-119400.08~000013_2017",
    "YEMP-119400.09~000001_2017",
    "YEMP-119400.09~000002_2017",
    "YEMP-119400.09~000003_2017",
    "YEMP-119400.09~000004_2017",
    "YEMP-119400.09~000005_2017",
    "YEMP-119400.09~000006_2017",
    "YEMP-119400.09~000007_2017",
    "YEMP-119400.09~000008_2017",
    "YEMP-119400.09~000009_2017",
    "YEMP-119400.09~000010_2017",
    "YEMP-119400.09~000011_2017",
    "YEMP-119400.09~000012_2017",
    "YEMP-119400.09~000013_2017")
  return(data)
}


#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels. 
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers

new_data <- qnames(new_data)
#categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#summary(categories)

#************************************************************************************************************

