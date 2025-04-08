Library = {}

local assets = {
	["accessibility"] = "rbxassetid://10709751939",
	["activity"] = "rbxassetid://10709752035",
	["air-vent"] = "rbxassetid://10709752131",
	["airplay"] = "rbxassetid://10709752254",
	["alarm-check"] = "rbxassetid://10709752405",
	["alarm-clock"] = "rbxassetid://10709752630",
	["alarm-clock-off"] = "rbxassetid://10709752508",
	["alarm-minus"] = "rbxassetid://10709752732",
	["alarm-plus"] = "rbxassetid://10709752825",
	["album"] = "rbxassetid://10709752906",
	["alert-circle"] = "rbxassetid://10709752996",
	["alert-octagon"] = "rbxassetid://10709753064",
	["alert-triangle"] = "rbxassetid://10709753149",
	["align-center"] = "rbxassetid://10709753570",
	["align-center-horizontal"] = "rbxassetid://10709753272",
	["align-center-vertical"] = "rbxassetid://10709753421",
	["align-end-horizontal"] = "rbxassetid://10709753692",
	["align-end-vertical"] = "rbxassetid://10709753808",
	["align-horizontal-distribute-center"] = "rbxassetid://10747779791",
	["align-horizontal-distribute-end"] = "rbxassetid://10747784534",
	["align-horizontal-distribute-start"] = "rbxassetid://10709754118",
	["align-horizontal-justify-center"] = "rbxassetid://10709754204",
	["align-horizontal-justify-end"] = "rbxassetid://10709754317",
	["align-horizontal-justify-start"] = "rbxassetid://10709754436",
	["align-horizontal-space-around"] = "rbxassetid://10709754590",
	["align-horizontal-space-between"] = "rbxassetid://10709754749",
	["align-justify"] = "rbxassetid://10709759610",
	["align-left"] = "rbxassetid://10709759764",
	["align-right"] = "rbxassetid://10709759895",
	["align-start-horizontal"] = "rbxassetid://10709760051",
	["align-start-vertical"] = "rbxassetid://10709760244",
	["align-vertical-distribute-center"] = "rbxassetid://10709760351",
	["align-vertical-distribute-end"] = "rbxassetid://10709760434",
	["align-vertical-distribute-start"] = "rbxassetid://10709760612",
	["align-vertical-justify-center"] = "rbxassetid://10709760814",
	["align-vertical-justify-end"] = "rbxassetid://10709761003",
	["align-vertical-justify-start"] = "rbxassetid://10709761176",
	["align-vertical-space-around"] = "rbxassetid://10709761324",
	["align-vertical-space-between"] = "rbxassetid://10709761434",
	["anchor"] = "rbxassetid://10709761530",
	["angry"] = "rbxassetid://10709761629",
	["annoyed"] = "rbxassetid://10709761722",
	["aperture"] = "rbxassetid://10709761813",
	["apple"] = "rbxassetid://10709761889",
	["archive"] = "rbxassetid://10709762233",
	["archive-restore"] = "rbxassetid://10709762058",
	["armchair"] = "rbxassetid://10709762327",
	["arrow-big-down"] = "rbxassetid://10747796644",
	["arrow-big-left"] = "rbxassetid://10709762574",
	["arrow-big-right"] = "rbxassetid://10709762727",
	["arrow-big-up"] = "rbxassetid://10709762879",
	["arrow-down"] = "rbxassetid://10709767827",
	["arrow-down-circle"] = "rbxassetid://10709763034",
	["arrow-down-left"] = "rbxassetid://10709767656",
	["arrow-down-right"] = "rbxassetid://10709767750",
	["arrow-left"] = "rbxassetid://10709768114",
	["arrow-left-circle"] = "rbxassetid://10709767936",
	["arrow-left-right"] = "rbxassetid://10709768019",
	["arrow-right"] = "rbxassetid://10709768347",
	["arrow-right-circle"] = "rbxassetid://10709768226",
	["arrow-up"] = "rbxassetid://10709768939",
	["arrow-up-circle"] = "rbxassetid://10709768432",
	["arrow-up-down"] = "rbxassetid://10709768538",
	["arrow-up-left"] = "rbxassetid://10709768661",
	["arrow-up-right"] = "rbxassetid://10709768787",
	["asterisk"] = "rbxassetid://10709769095",
	["at-sign"] = "rbxassetid://10709769286",
	["award"] = "rbxassetid://10709769406",
	["axe"] = "rbxassetid://10709769508",
	["axis-3d"] = "rbxassetid://10709769598",
	["baby"] = "rbxassetid://10709769732",
	["backpack"] = "rbxassetid://10709769841",
	["baggage-claim"] = "rbxassetid://10709769935",
	["banana"] = "rbxassetid://10709770005",
	["banknote"] = "rbxassetid://10709770178",
	["bar-chart"] = "rbxassetid://10709773755",
	["bar-chart-2"] = "rbxassetid://10709770317",
	["bar-chart-3"] = "rbxassetid://10709770431",
	["bar-chart-4"] = "rbxassetid://10709770560",
	["bar-chart-horizontal"] = "rbxassetid://10709773669",
	["barcode"] = "rbxassetid://10747360675",
	["baseline"] = "rbxassetid://10709773863",
	["bath"] = "rbxassetid://10709773963",
	["battery"] = "rbxassetid://10709774640",
	["battery-charging"] = "rbxassetid://10709774068",
	["battery-full"] = "rbxassetid://10709774206",
	["battery-low"] = "rbxassetid://10709774370",
	["battery-medium"] = "rbxassetid://10709774513",
	["beaker"] = "rbxassetid://10709774756",
	["bed"] = "rbxassetid://10709775036",
	["bed-double"] = "rbxassetid://10709774864",
	["bed-single"] = "rbxassetid://10709774968",
	["beer"] = "rbxassetid://10709775167",
	["bell"] = "rbxassetid://10709775704",
	["bell-minus"] = "rbxassetid://10709775241",
	["bell-off"] = "rbxassetid://10709775320",
	["bell-plus"] = "rbxassetid://10709775448",
	["bell-ring"] = "rbxassetid://10709775560",
	["bike"] = "rbxassetid://10709775894",
	["binary"] = "rbxassetid://10709776050",
	["bitcoin"] = "rbxassetid://10709776126",
	["bluetooth"] = "rbxassetid://10709776655",
	["bluetooth-connected"] = "rbxassetid://10709776240",
	["bluetooth-off"] = "rbxassetid://10709776344",
	["bluetooth-searching"] = "rbxassetid://10709776501",
	["bold"] = "rbxassetid://10747813908",
	["bomb"] = "rbxassetid://10709781460",
	["bone"] = "rbxassetid://10709781605",
	["book"] = "rbxassetid://10709781824",
	["book-open"] = "rbxassetid://10709781717",
	["bookmark"] = "rbxassetid://10709782154",
	["bookmark-minus"] = "rbxassetid://10709781919",
	["bookmark-plus"] = "rbxassetid://10709782044",
	["bot"] = "rbxassetid://10709782230",
	["box"] = "rbxassetid://10709782497",
	["box-select"] = "rbxassetid://10709782342",
	["boxes"] = "rbxassetid://10709782582",
	["briefcase"] = "rbxassetid://10709782662",
	["brush"] = "rbxassetid://10709782758",
	["bug"] = "rbxassetid://10709782845",
	["building"] = "rbxassetid://10709783051",
	["building-2"] = "rbxassetid://10709782939",
	["bus"] = "rbxassetid://10709783137",
	["cake"] = "rbxassetid://10709783217",
	["calculator"] = "rbxassetid://10709783311",
	["calendar"] = "rbxassetid://10709789505",
	["calendar-check"] = "rbxassetid://10709783474",
	["calendar-check-2"] = "rbxassetid://10709783392",
	["calendar-clock"] = "rbxassetid://10709783577",
	["calendar-days"] = "rbxassetid://10709783673",
	["calendar-heart"] = "rbxassetid://10709783835",
	["calendar-minus"] = "rbxassetid://10709783959",
	["calendar-off"] = "rbxassetid://10709788784",
	["calendar-plus"] = "rbxassetid://10709788937",
	["calendar-range"] = "rbxassetid://10709789053",
	["calendar-search"] = "rbxassetid://10709789200",
	["calendar-x"] = "rbxassetid://10709789407",
	["calendar-x-2"] = "rbxassetid://10709789329",
	["camera"] = "rbxassetid://10709789686",
	["camera-off"] = "rbxassetid://10747822677",
	["car"] = "rbxassetid://10709789810",
	["carrot"] = "rbxassetid://10709789960",
	["cast"] = "rbxassetid://10709790097",
	["charge"] = "rbxassetid://10709790202",
	["check"] = "rbxassetid://10709790644",
	["check-circle"] = "rbxassetid://10709790387",
	["check-circle-2"] = "rbxassetid://10709790298",
	["check-square"] = "rbxassetid://10709790537",
	["chef-hat"] = "rbxassetid://10709790757",
	["cherry"] = "rbxassetid://10709790875",
	["chevron-down"] = "rbxassetid://10709790948",
	["chevron-first"] = "rbxassetid://10709791015",
	["chevron-last"] = "rbxassetid://10709791130",
	["chevron-left"] = "rbxassetid://10709791281",
	["chevron-right"] = "rbxassetid://10709791437",
	["chevron-up"] = "rbxassetid://10709791523",
	["chevrons-down"] = "rbxassetid://10709796864",
	["chevrons-down-up"] = "rbxassetid://10709791632",
	["chevrons-left"] = "rbxassetid://10709797151",
	["chevrons-left-right"] = "rbxassetid://10709797006",
	["chevrons-right"] = "rbxassetid://10709797382",
	["chevrons-right-left"] = "rbxassetid://10709797274",
	["chevrons-up"] = "rbxassetid://10709797622",
	["chevrons-up-down"] = "rbxassetid://10709797508",
	["chrome"] = "rbxassetid://10709797725",
	["circle"] = "rbxassetid://10709798174",
	["circle-dot"] = "rbxassetid://10709797837",
	["circle-ellipsis"] = "rbxassetid://10709797985",
	["circle-slashed"] = "rbxassetid://10709798100",
	["citrus"] = "rbxassetid://10709798276",
	["clapperboard"] = "rbxassetid://10709798350",
	["clipboard"] = "rbxassetid://10709799288",
	["clipboard-check"] = "rbxassetid://10709798443",
	["clipboard-copy"] = "rbxassetid://10709798574",
	["clipboard-edit"] = "rbxassetid://10709798682",
	["clipboard-list"] = "rbxassetid://10709798792",
	["clipboard-signature"] = "rbxassetid://10709798890",
	["clipboard-type"] = "rbxassetid://10709798999",
	["clipboard-x"] = "rbxassetid://10709799124",
	["clock"] = "rbxassetid://10709805144",
	["clock-1"] = "rbxassetid://10709799535",
	["clock-10"] = "rbxassetid://10709799718",
	["clock-11"] = "rbxassetid://10709799818",
	["clock-12"] = "rbxassetid://10709799962",
	["clock-2"] = "rbxassetid://10709803876",
	["clock-3"] = "rbxassetid://10709803989",
	["clock-4"] = "rbxassetid://10709804164",
	["clock-5"] = "rbxassetid://10709804291",
	["clock-6"] = "rbxassetid://10709804435",
	["clock-7"] = "rbxassetid://10709804599",
	["clock-8"] = "rbxassetid://10709804784",
	["clock-9"] = "rbxassetid://10709804996",
	["cloud"] = "rbxassetid://10709806740",
	["cloud-cog"] = "rbxassetid://10709805262",
	["cloud-drizzle"] = "rbxassetid://10709805371",
	["cloud-fog"] = "rbxassetid://10709805477",
	["cloud-hail"] = "rbxassetid://10709805596",
	["cloud-lightning"] = "rbxassetid://10709805727",
	["cloud-moon"] = "rbxassetid://10709805942",
	["cloud-moon-rain"] = "rbxassetid://10709805838",
	["cloud-off"] = "rbxassetid://10709806060",
	["cloud-rain"] = "rbxassetid://10709806277",
	["cloud-rain-wind"] = "rbxassetid://10709806166",
	["cloud-snow"] = "rbxassetid://10709806374",
	["cloud-sun"] = "rbxassetid://10709806631",
	["cloud-sun-rain"] = "rbxassetid://10709806475",
	["cloudy"] = "rbxassetid://10709806859",
	["clover"] = "rbxassetid://10709806995",
	["code"] = "rbxassetid://10709810463",
	["code-2"] = "rbxassetid://10709807111",
	["codepen"] = "rbxassetid://10709810534",
	["codesandbox"] = "rbxassetid://10709810676",
	["coffee"] = "rbxassetid://10709810814",
	["cog"] = "rbxassetid://10709810948",
	["coins"] = "rbxassetid://10709811110",
	["columns"] = "rbxassetid://10709811261",
	["command"] = "rbxassetid://10709811365",
	["compass"] = "rbxassetid://10709811445",
	["component"] = "rbxassetid://10709811595",
	["concierge-bell"] = "rbxassetid://10709811706",
	["connection"] = "rbxassetid://10747361219",
	["contact"] = "rbxassetid://10709811834",
	["contrast"] = "rbxassetid://10709811939",
	["cookie"] = "rbxassetid://10709812067",
	["copy"] = "rbxassetid://10709812159",
	["copyleft"] = "rbxassetid://10709812251",
	["copyright"] = "rbxassetid://10709812311",
	["corner-down-left"] = "rbxassetid://10709812396",
	["corner-down-right"] = "rbxassetid://10709812485",
	["corner-left-down"] = "rbxassetid://10709812632",
	["corner-left-up"] = "rbxassetid://10709812784",
	["corner-right-down"] = "rbxassetid://10709812939",
	["corner-right-up"] = "rbxassetid://10709813094",
	["corner-up-left"] = "rbxassetid://10709813185",
	["corner-up-right"] = "rbxassetid://10709813281",
	["cpu"] = "rbxassetid://10709813383",
	["croissant"] = "rbxassetid://10709818125",
	["crop"] = "rbxassetid://10709818245",
	["cross"] = "rbxassetid://10709818399",
	["crosshair"] = "rbxassetid://10709818534",
	["crown"] = "rbxassetid://10709818626",
	["cup-soda"] = "rbxassetid://10709818763",
	["curly-braces"] = "rbxassetid://10709818847",
	["currency"] = "rbxassetid://10709818931",
	["database"] = "rbxassetid://10709818996",
	["delete"] = "rbxassetid://10709819059",
	["diamond"] = "rbxassetid://10709819149",
	["dice-1"] = "rbxassetid://10709819266",
	["dice-2"] = "rbxassetid://10709819361",
	["dice-3"] = "rbxassetid://10709819508",
	["dice-4"] = "rbxassetid://10709819670",
	["dice-5"] = "rbxassetid://10709819801",
	["dice-6"] = "rbxassetid://10709819896",
	["dices"] = "rbxassetid://10723343321",
	["diff"] = "rbxassetid://10723343416",
	["disc"] = "rbxassetid://10723343537",
	["divide"] = "rbxassetid://10723343805",
	["divide-circle"] = "rbxassetid://10723343636",
	["divide-square"] = "rbxassetid://10723343737",
	["dollar-sign"] = "rbxassetid://10723343958",
	["download"] = "rbxassetid://10723344270",
	["download-cloud"] = "rbxassetid://10723344088",
	["droplet"] = "rbxassetid://10723344432",
	["droplets"] = "rbxassetid://10734883356",
	["drumstick"] = "rbxassetid://10723344737",
	["edit"] = "rbxassetid://10734883598",
	["edit-2"] = "rbxassetid://10723344885",
	["edit-3"] = "rbxassetid://10723345088",
	["egg"] = "rbxassetid://10723345518",
	["egg-fried"] = "rbxassetid://10723345347",
	["electricity"] = "rbxassetid://10723345749",
	["electricity-off"] = "rbxassetid://10723345643",
	["equal"] = "rbxassetid://10723345990",
	["equal-not"] = "rbxassetid://10723345866",
	["eraser"] = "rbxassetid://10723346158",
	["euro"] = "rbxassetid://10723346372",
	["expand"] = "rbxassetid://10723346553",
	["external-link"] = "rbxassetid://10723346684",
	["eye"] = "rbxassetid://10723346959",
	["eye-off"] = "rbxassetid://10723346871",
	["factory"] = "rbxassetid://10723347051",
	["fan"] = "rbxassetid://10723354359",
	["fast-forward"] = "rbxassetid://10723354521",
	["feather"] = "rbxassetid://10723354671",
	["figma"] = "rbxassetid://10723354801",
	["file"] = "rbxassetid://10723374641",
	["file-archive"] = "rbxassetid://10723354921",
	["file-audio"] = "rbxassetid://10723355148",
	["file-audio-2"] = "rbxassetid://10723355026",
	["file-axis-3d"] = "rbxassetid://10723355272",
	["file-badge"] = "rbxassetid://10723355622",
	["file-badge-2"] = "rbxassetid://10723355451",
	["file-bar-chart"] = "rbxassetid://10723355887",
	["file-bar-chart-2"] = "rbxassetid://10723355746",
	["file-box"] = "rbxassetid://10723355989",
	["file-check"] = "rbxassetid://10723356210",
	["file-check-2"] = "rbxassetid://10723356100",
	["file-clock"] = "rbxassetid://10723356329",
	["file-code"] = "rbxassetid://10723356507",
	["file-cog"] = "rbxassetid://10723356830",
	["file-cog-2"] = "rbxassetid://10723356676",
	["file-diff"] = "rbxassetid://10723357039",
	["file-digit"] = "rbxassetid://10723357151",
	["file-down"] = "rbxassetid://10723357322",
	["file-edit"] = "rbxassetid://10723357495",
	["file-heart"] = "rbxassetid://10723357637",
	["file-image"] = "rbxassetid://10723357790",
	["file-input"] = "rbxassetid://10723357933",
	["file-json"] = "rbxassetid://10723364435",
	["file-json-2"] = "rbxassetid://10723364361",
	["file-key"] = "rbxassetid://10723364605",
	["file-key-2"] = "rbxassetid://10723364515",
	["file-line-chart"] = "rbxassetid://10723364725",
	["file-lock"] = "rbxassetid://10723364957",
	["file-lock-2"] = "rbxassetid://10723364861",
	["file-minus"] = "rbxassetid://10723365254",
	["file-minus-2"] = "rbxassetid://10723365086",
	["file-output"] = "rbxassetid://10723365457",
	["file-pie-chart"] = "rbxassetid://10723365598",
	["file-plus"] = "rbxassetid://10723365877",
	["file-plus-2"] = "rbxassetid://10723365766",
	["file-question"] = "rbxassetid://10723365987",
	["file-scan"] = "rbxassetid://10723366167",
	["file-search"] = "rbxassetid://10723366550",
	["file-search-2"] = "rbxassetid://10723366340",
	["file-signature"] = "rbxassetid://10723366741",
	["file-spreadsheet"] = "rbxassetid://10723366962",
	["file-symlink"] = "rbxassetid://10723367098",
	["file-terminal"] = "rbxassetid://10723367244",
	["file-text"] = "rbxassetid://10723367380",
	["file-type"] = "rbxassetid://10723367606",
	["file-type-2"] = "rbxassetid://10723367509",
	["file-up"] = "rbxassetid://10723367734",
	["file-video"] = "rbxassetid://10723373884",
	["file-video-2"] = "rbxassetid://10723367834",
	["file-volume"] = "rbxassetid://10723374172",
	["file-volume-2"] = "rbxassetid://10723374030",
	["file-warning"] = "rbxassetid://10723374276",
	["file-x"] = "rbxassetid://10723374544",
	["file-x-2"] = "rbxassetid://10723374378",
	["files"] = "rbxassetid://10723374759",
	["film"] = "rbxassetid://10723374981",
	["filter"] = "rbxassetid://10723375128",
	["fingerprint"] = "rbxassetid://10723375250",
	["flag"] = "rbxassetid://10723375890",
	["flag-off"] = "rbxassetid://10723375443",
	["flag-triangle-left"] = "rbxassetid://10723375608",
	["flag-triangle-right"] = "rbxassetid://10723375727",
	["flame"] = "rbxassetid://10723376114",
	["flashlight"] = "rbxassetid://10723376471",
	["flashlight-off"] = "rbxassetid://10723376365",
	["flask-conical"] = "rbxassetid://10734883986",
	["flask-round"] = "rbxassetid://10723376614",
	["flip-horizontal"] = "rbxassetid://10723376884",
	["flip-horizontal-2"] = "rbxassetid://10723376745",
	["flip-vertical"] = "rbxassetid://10723377138",
	["flip-vertical-2"] = "rbxassetid://10723377026",
	["flower"] = "rbxassetid://10747830374",
	["flower-2"] = "rbxassetid://10723377305",
	["focus"] = "rbxassetid://10723377537",
	["folder"] = "rbxassetid://10723387563",
	["folder-archive"] = "rbxassetid://10723384478",
	["folder-check"] = "rbxassetid://10723384605",
	["folder-clock"] = "rbxassetid://10723384731",
	["folder-closed"] = "rbxassetid://10723384893",
	["folder-cog"] = "rbxassetid://10723385213",
	["folder-cog-2"] = "rbxassetid://10723385036",
	["folder-down"] = "rbxassetid://10723385338",
	["folder-edit"] = "rbxassetid://10723385445",
	["folder-heart"] = "rbxassetid://10723385545",
	["folder-input"] = "rbxassetid://10723385721",
	["folder-key"] = "rbxassetid://10723385848",
	["folder-lock"] = "rbxassetid://10723386005",
	["folder-minus"] = "rbxassetid://10723386127",
	["folder-open"] = "rbxassetid://10723386277",
	["folder-output"] = "rbxassetid://10723386386",
	["folder-plus"] = "rbxassetid://10723386531",
	["folder-search"] = "rbxassetid://10723386787",
	["folder-search-2"] = "rbxassetid://10723386674",
	["folder-symlink"] = "rbxassetid://10723386930",
	["folder-tree"] = "rbxassetid://10723387085",
	["folder-up"] = "rbxassetid://10723387265",
	["folder-x"] = "rbxassetid://10723387448",
	["folders"] = "rbxassetid://10723387721",
	["form-input"] = "rbxassetid://10723387841",
	["forward"] = "rbxassetid://10723388016",
	["frame"] = "rbxassetid://10723394389",
	["framer"] = "rbxassetid://10723394565",
	["frown"] = "rbxassetid://10723394681",
	["fuel"] = "rbxassetid://10723394846",
	["function-square"] = "rbxassetid://10723395041",
	["gamepad"] = "rbxassetid://10723395457",
	["gamepad-2"] = "rbxassetid://10723395215",
	["gauge"] = "rbxassetid://10723395708",
	["gavel"] = "rbxassetid://10723395896",
	["gem"] = "rbxassetid://10723396000",
	["ghost"] = "rbxassetid://10723396107",
	["gift"] = "rbxassetid://10723396402",
	["gift-card"] = "rbxassetid://10723396225",
	["git-branch"] = "rbxassetid://10723396676",
	["git-branch-plus"] = "rbxassetid://10723396542",
	["git-commit"] = "rbxassetid://10723396812",
	["git-compare"] = "rbxassetid://10723396954",
	["git-fork"] = "rbxassetid://10723397049",
	["git-merge"] = "rbxassetid://10723397165",
	["git-pull-request"] = "rbxassetid://10723397431",
	["git-pull-request-closed"] = "rbxassetid://10723397268",
	["git-pull-request-draft"] = "rbxassetid://10734884302",
	["glass"] = "rbxassetid://10723397788",
	["glass-2"] = "rbxassetid://10723397529",
	["glass-water"] = "rbxassetid://10723397678",
	["glasses"] = "rbxassetid://10723397895",
	["globe"] = "rbxassetid://10723404337",
	["globe-2"] = "rbxassetid://10723398002",
	["grab"] = "rbxassetid://10723404472",
	["graduation-cap"] = "rbxassetid://10723404691",
	["grape"] = "rbxassetid://10723404822",
	["grid"] = "rbxassetid://10723404936",
	["grip-horizontal"] = "rbxassetid://10723405089",
	["grip-vertical"] = "rbxassetid://10723405236",
	["hammer"] = "rbxassetid://10723405360",
	["hand"] = "rbxassetid://10723405649",
	["hand-metal"] = "rbxassetid://10723405508",
	["hard-drive"] = "rbxassetid://10723405749",
	["hard-hat"] = "rbxassetid://10723405859",
	["hash"] = "rbxassetid://10723405975",
	["haze"] = "rbxassetid://10723406078",
	["headphones"] = "rbxassetid://10723406165",
	["heart"] = "rbxassetid://10723406885",
	["heart-crack"] = "rbxassetid://10723406299",
	["heart-handshake"] = "rbxassetid://10723406480",
	["heart-off"] = "rbxassetid://10723406662",
	["heart-pulse"] = "rbxassetid://10723406795",
	["help-circle"] = "rbxassetid://10723406988",
	["hexagon"] = "rbxassetid://10723407092",
	["highlighter"] = "rbxassetid://10723407192",
	["history"] = "rbxassetid://10723407335",
	["home"] = "rbxassetid://10723407389",
	["hourglass"] = "rbxassetid://10723407498",
	["ice-cream"] = "rbxassetid://10723414308",
	["image"] = "rbxassetid://10723415040",
	["image-minus"] = "rbxassetid://10723414487",
	["image-off"] = "rbxassetid://10723414677",
	["image-plus"] = "rbxassetid://10723414827",
	["import"] = "rbxassetid://10723415205",
	["inbox"] = "rbxassetid://10723415335",
	["indent"] = "rbxassetid://10723415494",
	["indian-rupee"] = "rbxassetid://10723415642",
	["infinity"] = "rbxassetid://10723415766",
	["info"] = "rbxassetid://10723415903",
	["inspect"] = "rbxassetid://10723416057",
	["italic"] = "rbxassetid://10723416195",
	["japanese-yen"] = "rbxassetid://10723416363",
	["joystick"] = "rbxassetid://10723416527",
	["key"] = "rbxassetid://10723416652",
	["keyboard"] = "rbxassetid://10723416765",
	["lamp"] = "rbxassetid://10723417513",
	["lamp-ceiling"] = "rbxassetid://10723416922",
	["lamp-desk"] = "rbxassetid://10723417016",
	["lamp-floor"] = "rbxassetid://10723417131",
	["lamp-wall-down"] = "rbxassetid://10723417240",
	["lamp-wall-up"] = "rbxassetid://10723417356",
	["landmark"] = "rbxassetid://10723417608",
	["languages"] = "rbxassetid://10723417703",
	["laptop"] = "rbxassetid://10723423881",
	["laptop-2"] = "rbxassetid://10723417797",
	["lasso"] = "rbxassetid://10723424235",
	["lasso-select"] = "rbxassetid://10723424058",
	["laugh"] = "rbxassetid://10723424372",
	["layers"] = "rbxassetid://10723424505",
	["layout"] = "rbxassetid://10723425376",
	["layout-dashboard"] = "rbxassetid://10723424646",
	["layout-grid"] = "rbxassetid://10723424838",
	["layout-list"] = "rbxassetid://10723424963",
	["layout-template"] = "rbxassetid://10723425187",
	["leaf"] = "rbxassetid://10723425539",
	["library"] = "rbxassetid://10723425615",
	["life-buoy"] = "rbxassetid://10723425685",
	["lightbulb"] = "rbxassetid://10723425852",
	["lightbulb-off"] = "rbxassetid://10723425762",
	["line-chart"] = "rbxassetid://10723426393",
	["link"] = "rbxassetid://10723426722",
	["link-2"] = "rbxassetid://10723426595",
	["link-2-off"] = "rbxassetid://10723426513",
	["list"] = "rbxassetid://10723433811",
	["list-checks"] = "rbxassetid://10734884548",
	["list-end"] = "rbxassetid://10723426886",
	["list-minus"] = "rbxassetid://10723426986",
	["list-music"] = "rbxassetid://10723427081",
	["list-ordered"] = "rbxassetid://10723427199",
	["list-plus"] = "rbxassetid://10723427334",
	["list-start"] = "rbxassetid://10723427494",
	["list-video"] = "rbxassetid://10723427619",
	["list-x"] = "rbxassetid://10723433655",
	["loader"] = "rbxassetid://10723434070",
	["loader-2"] = "rbxassetid://10723433935",
	["locate"] = "rbxassetid://10723434557",
	["locate-fixed"] = "rbxassetid://10723434236",
	["locate-off"] = "rbxassetid://10723434379",
	["lock"] = "rbxassetid://10723434711",
	["log-in"] = "rbxassetid://10723434830",
	["log-out"] = "rbxassetid://10723434906",
	["luggage"] = "rbxassetid://10723434993",
	["magnet"] = "rbxassetid://10723435069",
	["mail"] = "rbxassetid://10734885430",
	["mail-check"] = "rbxassetid://10723435182",
	["mail-minus"] = "rbxassetid://10723435261",
	["mail-open"] = "rbxassetid://10723435342",
	["mail-plus"] = "rbxassetid://10723435443",
	["mail-question"] = "rbxassetid://10723435515",
	["mail-search"] = "rbxassetid://10734884739",
	["mail-warning"] = "rbxassetid://10734885015",
	["mail-x"] = "rbxassetid://10734885247",
	["mails"] = "rbxassetid://10734885614",
	["map"] = "rbxassetid://10734886202",
	["map-pin"] = "rbxassetid://10734886004",
	["map-pin-off"] = "rbxassetid://10734885803",
	["maximize"] = "rbxassetid://10734886735",
	["maximize-2"] = "rbxassetid://10734886496",
	["medal"] = "rbxassetid://10734887072",
	["megaphone"] = "rbxassetid://10734887454",
	["megaphone-off"] = "rbxassetid://10734887311",
	["meh"] = "rbxassetid://10734887603",
	["menu"] = "rbxassetid://10734887784",
	["message-circle"] = "rbxassetid://10734888000",
	["message-square"] = "rbxassetid://10734888228",
	["mic"] = "rbxassetid://10734888864",
	["mic-2"] = "rbxassetid://10734888430",
	["mic-off"] = "rbxassetid://10734888646",
	["microscope"] = "rbxassetid://10734889106",
	["microwave"] = "rbxassetid://10734895076",
	["milestone"] = "rbxassetid://10734895310",
	["minimize"] = "rbxassetid://10734895698",
	["minimize-2"] = "rbxassetid://10734895530",
	["minus"] = "rbxassetid://10734896206",
	["minus-circle"] = "rbxassetid://10734895856",
	["minus-square"] = "rbxassetid://10734896029",
	["monitor"] = "rbxassetid://10734896881",
	["monitor-off"] = "rbxassetid://10734896360",
	["monitor-speaker"] = "rbxassetid://10734896512",
	["moon"] = "rbxassetid://10734897102",
	["more-horizontal"] = "rbxassetid://10734897250",
	["more-vertical"] = "rbxassetid://10734897387",
	["mountain"] = "rbxassetid://10734897956",
	["mountain-snow"] = "rbxassetid://10734897665",
	["mouse"] = "rbxassetid://10734898592",
	["mouse-pointer"] = "rbxassetid://10734898476",
	["mouse-pointer-2"] = "rbxassetid://10734898194",
	["mouse-pointer-click"] = "rbxassetid://10734898355",
	["move"] = "rbxassetid://10734900011",
	["move-3d"] = "rbxassetid://10734898756",
	["move-diagonal"] = "rbxassetid://10734899164",
	["move-diagonal-2"] = "rbxassetid://10734898934",
	["move-horizontal"] = "rbxassetid://10734899414",
	["move-vertical"] = "rbxassetid://10734899821",
	["music"] = "rbxassetid://10734905958",
	["music-2"] = "rbxassetid://10734900215",
	["music-3"] = "rbxassetid://10734905665",
	["music-4"] = "rbxassetid://10734905823",
	["navigation"] = "rbxassetid://10734906744",
	["navigation-2"] = "rbxassetid://10734906332",
	["navigation-2-off"] = "rbxassetid://10734906144",
	["navigation-off"] = "rbxassetid://10734906580",
	["network"] = "rbxassetid://10734906975",
	["newspaper"] = "rbxassetid://10734907168",
	["octagon"] = "rbxassetid://10734907361",
	["option"] = "rbxassetid://10734907649",
	["outdent"] = "rbxassetid://10734907933",
	["package"] = "rbxassetid://10734909540",
	["package-2"] = "rbxassetid://10734908151",
	["package-check"] = "rbxassetid://10734908384",
	["package-minus"] = "rbxassetid://10734908626",
	["package-open"] = "rbxassetid://10734908793",
	["package-plus"] = "rbxassetid://10734909016",
	["package-search"] = "rbxassetid://10734909196",
	["package-x"] = "rbxassetid://10734909375",
	["paint-bucket"] = "rbxassetid://10734909847",
	["paintbrush"] = "rbxassetid://10734910187",
	["paintbrush-2"] = "rbxassetid://10734910030",
	["palette"] = "rbxassetid://10734910430",
	["palmtree"] = "rbxassetid://10734910680",
	["paperclip"] = "rbxassetid://10734910927",
	["party-popper"] = "rbxassetid://10734918735",
	["pause"] = "rbxassetid://10734919336",
	["pause-circle"] = "rbxassetid://10735024209",
	["pause-octagon"] = "rbxassetid://10734919143",
	["pen-tool"] = "rbxassetid://10734919503",
	["pencil"] = "rbxassetid://10734919691",
	["percent"] = "rbxassetid://10734919919",
	["person-standing"] = "rbxassetid://10734920149",
	["phone"] = "rbxassetid://10734921524",
	["phone-call"] = "rbxassetid://10734920305",
	["phone-forwarded"] = "rbxassetid://10734920508",
	["phone-incoming"] = "rbxassetid://10734920694",
	["phone-missed"] = "rbxassetid://10734920845",
	["phone-off"] = "rbxassetid://10734921077",
	["phone-outgoing"] = "rbxassetid://10734921288",
	["pie-chart"] = "rbxassetid://10734921727",
	["piggy-bank"] = "rbxassetid://10734921935",
	["pin"] = "rbxassetid://10734922324",
	["pin-off"] = "rbxassetid://10734922180",
	["pipette"] = "rbxassetid://10734922497",
	["pizza"] = "rbxassetid://10734922774",
	["plane"] = "rbxassetid://10734922971",
	["play"] = "rbxassetid://10734923549",
	["play-circle"] = "rbxassetid://10734923214",
	["plus"] = "rbxassetid://10734924532",
	["plus-circle"] = "rbxassetid://10734923868",
	["plus-square"] = "rbxassetid://10734924219",
	["podcast"] = "rbxassetid://10734929553",
	["pointer"] = "rbxassetid://10734929723",
	["pound-sterling"] = "rbxassetid://10734929981",
	["power"] = "rbxassetid://10734930466",
	["power-off"] = "rbxassetid://10734930257",
	["printer"] = "rbxassetid://10734930632",
	["puzzle"] = "rbxassetid://10734930886",
	["quote"] = "rbxassetid://10734931234",
	["radio"] = "rbxassetid://10734931596",
	["radio-receiver"] = "rbxassetid://10734931402",
	["rectangle-horizontal"] = "rbxassetid://10734931777",
	["rectangle-vertical"] = "rbxassetid://10734932081",
	["recycle"] = "rbxassetid://10734932295",
	["redo"] = "rbxassetid://10734932822",
	["redo-2"] = "rbxassetid://10734932586",
	["refresh-ccw"] = "rbxassetid://10734933056",
	["refresh-cw"] = "rbxassetid://10734933222",
	["refrigerator"] = "rbxassetid://10734933465",
	["regex"] = "rbxassetid://10734933655",
	["repeat"] = "rbxassetid://10734933966",
	["repeat-1"] = "rbxassetid://10734933826",
	["reply"] = "rbxassetid://10734934252",
	["reply-all"] = "rbxassetid://10734934132",
	["rewind"] = "rbxassetid://10734934347",
	["rocket"] = "rbxassetid://10734934585",
	["rocking-chair"] = "rbxassetid://10734939942",
	["rotate-3d"] = "rbxassetid://10734940107",
	["rotate-ccw"] = "rbxassetid://10734940376",
	["rotate-cw"] = "rbxassetid://10734940654",
	["rss"] = "rbxassetid://10734940825",
	["ruler"] = "rbxassetid://10734941018",
	["russian-ruble"] = "rbxassetid://10734941199",
	["sailboat"] = "rbxassetid://10734941354",
	["save"] = "rbxassetid://10734941499",
	["scale"] = "rbxassetid://10734941912",
	["scale-3d"] = "rbxassetid://10734941739",
	["scaling"] = "rbxassetid://10734942072",
	["scan"] = "rbxassetid://10734942565",
	["scan-face"] = "rbxassetid://10734942198",
	["scan-line"] = "rbxassetid://10734942351",
	["scissors"] = "rbxassetid://10734942778",
	["screen-share"] = "rbxassetid://10734943193",
	["screen-share-off"] = "rbxassetid://10734942967",
	["scroll"] = "rbxassetid://10734943448",
	["search"] = "rbxassetid://10734943674",
	["send"] = "rbxassetid://10734943902",
	["separator-horizontal"] = "rbxassetid://10734944115",
	["separator-vertical"] = "rbxassetid://10734944326",
	["server"] = "rbxassetid://10734949856",
	["server-cog"] = "rbxassetid://10734944444",
	["server-crash"] = "rbxassetid://10734944554",
	["server-off"] = "rbxassetid://10734944668",
	["settings"] = "rbxassetid://10734950309",
	["settings-2"] = "rbxassetid://10734950020",
	["share"] = "rbxassetid://10734950813",
	["share-2"] = "rbxassetid://10734950553",
	["sheet"] = "rbxassetid://10734951038",
	["shield"] = "rbxassetid://10734951847",
	["shield-alert"] = "rbxassetid://10734951173",
	["shield-check"] = "rbxassetid://10734951367",
	["shield-close"] = "rbxassetid://10734951535",
	["shield-off"] = "rbxassetid://10734951684",
	["shirt"] = "rbxassetid://10734952036",
	["shopping-bag"] = "rbxassetid://10734952273",
	["shopping-cart"] = "rbxassetid://10734952479",
	["shovel"] = "rbxassetid://10734952773",
	["shower-head"] = "rbxassetid://10734952942",
	["shrink"] = "rbxassetid://10734953073",
	["shrub"] = "rbxassetid://10734953241",
	["shuffle"] = "rbxassetid://10734953451",
	["sidebar"] = "rbxassetid://10734954301",
	["sidebar-close"] = "rbxassetid://10734953715",
	["sidebar-open"] = "rbxassetid://10734954000",
	["sigma"] = "rbxassetid://10734954538",
	["signal"] = "rbxassetid://10734961133",
	["signal-high"] = "rbxassetid://10734954807",
	["signal-low"] = "rbxassetid://10734955080",
	["signal-medium"] = "rbxassetid://10734955336",
	["signal-zero"] = "rbxassetid://10734960878",
	["siren"] = "rbxassetid://10734961284",
	["skip-back"] = "rbxassetid://10734961526",
	["skip-forward"] = "rbxassetid://10734961809",
	["skull"] = "rbxassetid://10734962068",
	["slack"] = "rbxassetid://10734962339",
	["slash"] = "rbxassetid://10734962600",
	["slice"] = "rbxassetid://10734963024",
	["sliders"] = "rbxassetid://10734963400",
	["sliders-horizontal"] = "rbxassetid://10734963191",
	["smartphone"] = "rbxassetid://10734963940",
	["smartphone-charging"] = "rbxassetid://10734963671",
	["smile"] = "rbxassetid://10734964441",
	["smile-plus"] = "rbxassetid://10734964188",
	["snowflake"] = "rbxassetid://10734964600",
	["sofa"] = "rbxassetid://10734964852",
	["sort-asc"] = "rbxassetid://10734965115",
	["sort-desc"] = "rbxassetid://10734965287",
	["speaker"] = "rbxassetid://10734965419",
	["sprout"] = "rbxassetid://10734965572",
	["square"] = "rbxassetid://10734965702",
	["star"] = "rbxassetid://10734966248",
	["star-half"] = "rbxassetid://10734965897",
	["star-off"] = "rbxassetid://10734966097",
	["stethoscope"] = "rbxassetid://10734966384",
	["sticker"] = "rbxassetid://10734972234",
	["sticky-note"] = "rbxassetid://10734972463",
	["stop-circle"] = "rbxassetid://10734972621",
	["stretch-horizontal"] = "rbxassetid://10734972862",
	["stretch-vertical"] = "rbxassetid://10734973130",
	["strikethrough"] = "rbxassetid://10734973290",
	["subscript"] = "rbxassetid://10734973457",
	["sun"] = "rbxassetid://10734974297",
	["sun-dim"] = "rbxassetid://10734973645",
	["sun-medium"] = "rbxassetid://10734973778",
	["sun-moon"] = "rbxassetid://10734973999",
	["sun-snow"] = "rbxassetid://10734974130",
	["sunrise"] = "rbxassetid://10734974522",
	["sunset"] = "rbxassetid://10734974689",
	["superscript"] = "rbxassetid://10734974850",
	["swiss-franc"] = "rbxassetid://10734975024",
	["switch-camera"] = "rbxassetid://10734975214",
	["sword"] = "rbxassetid://10734975486",
	["swords"] = "rbxassetid://10734975692",
	["syringe"] = "rbxassetid://10734975932",
	["table"] = "rbxassetid://10734976230",
	["table-2"] = "rbxassetid://10734976097",
	["tablet"] = "rbxassetid://10734976394",
	["tag"] = "rbxassetid://10734976528",
	["tags"] = "rbxassetid://10734976739",
	["target"] = "rbxassetid://10734977012",
	["tent"] = "rbxassetid://10734981750",
	["terminal"] = "rbxassetid://10734982144",
	["terminal-square"] = "rbxassetid://10734981995",
	["text-cursor"] = "rbxassetid://10734982395",
	["text-cursor-input"] = "rbxassetid://10734982297",
	["thermometer"] = "rbxassetid://10734983134",
	["thermometer-snowflake"] = "rbxassetid://10734982571",
	["thermometer-sun"] = "rbxassetid://10734982771",
	["thumbs-down"] = "rbxassetid://10734983359",
	["thumbs-up"] = "rbxassetid://10734983629",
	["ticket"] = "rbxassetid://10734983868",
	["timer"] = "rbxassetid://10734984606",
	["timer-off"] = "rbxassetid://10734984138",
	["timer-reset"] = "rbxassetid://10734984355",
	["toggle-left"] = "rbxassetid://10734984834",
	["toggle-right"] = "rbxassetid://10734985040",
	["tornado"] = "rbxassetid://10734985247",
	["toy-brick"] = "rbxassetid://10747361919",
	["train"] = "rbxassetid://10747362105",
	["trash"] = "rbxassetid://10747362393",
	["trash-2"] = "rbxassetid://10747362241",
	["tree-deciduous"] = "rbxassetid://10747362534",
	["tree-pine"] = "rbxassetid://10747362748",
	["trees"] = "rbxassetid://10747363016",
	["trending-down"] = "rbxassetid://10747363205",
	["trending-up"] = "rbxassetid://10747363465",
	["triangle"] = "rbxassetid://10747363621",
	["trophy"] = "rbxassetid://10747363809",
	["truck"] = "rbxassetid://10747364031",
	["tv"] = "rbxassetid://10747364593",
	["tv-2"] = "rbxassetid://10747364302",
	["type"] = "rbxassetid://10747364761",
	["umbrella"] = "rbxassetid://10747364971",
	["underline"] = "rbxassetid://10747365191",
	["undo"] = "rbxassetid://10747365484",
	["undo-2"] = "rbxassetid://10747365359",
	["unlink"] = "rbxassetid://10747365771",
	["unlink-2"] = "rbxassetid://10747397871",
	["unlock"] = "rbxassetid://10747366027",
	["upload"] = "rbxassetid://10747366434",
	["upload-cloud"] = "rbxassetid://10747366266",
	["usb"] = "rbxassetid://10747366606",
	["user"] = "rbxassetid://10747373176",
	["user-check"] = "rbxassetid://10747371901",
	["user-cog"] = "rbxassetid://10747372167",
	["user-minus"] = "rbxassetid://10747372346",
	["user-plus"] = "rbxassetid://10747372702",
	["user-x"] = "rbxassetid://10747372992",
	["users"] = "rbxassetid://10747373426",
	["utensils"] = "rbxassetid://10747373821",
	["utensils-crossed"] = "rbxassetid://10747373629",
	["venetian-mask"] = "rbxassetid://10747374003",
	["verified"] = "rbxassetid://10747374131",
	["vibrate"] = "rbxassetid://10747374489",
	["vibrate-off"] = "rbxassetid://10747374269",
	["video"] = "rbxassetid://10747374938",
	["video-off"] = "rbxassetid://10747374721",
	["view"] = "rbxassetid://10747375132",
	["voicemail"] = "rbxassetid://10747375281",
	["volume"] = "rbxassetid://10747376008",
	["volume-1"] = "rbxassetid://10747375450",
	["volume-2"] = "rbxassetid://10747375679",
	["volume-x"] = "rbxassetid://10747375880",
	["wallet"] = "rbxassetid://10747376205",
	["wand"] = "rbxassetid://10747376565",
	["wand-2"] = "rbxassetid://10747376349",
	["watch"] = "rbxassetid://10747376722",
	["waves"] = "rbxassetid://10747376931",
	["webcam"] = "rbxassetid://10747381992",
	["wifi"] = "rbxassetid://10747382504",
	["wifi-off"] = "rbxassetid://10747382268",
	["wind"] = "rbxassetid://10747382750",
	["wrap-text"] = "rbxassetid://10747383065",
	["wrench"] = "rbxassetid://10747383470",
	["x"] = "rbxassetid://10747384394",
	["x-circle"] = "rbxassetid://10747383819",
	["x-octagon"] = "rbxassetid://10747384037",
	["x-square"] = "rbxassetid://10747384217",
	["zoom-in"] = "rbxassetid://10747384552",
	["zoom-out"] = "rbxassetid://10747384679"
}

local Tw = game:GetService("TweenService")
local Tf = TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
local Tf2 = TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local Patinum = Instance.new("ScreenGui")

if game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Patinum") then 
	game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Patinum"):Destroy()
end

Patinum.Parent = game.CoreGui
Patinum.Name = "Patinum"
Patinum.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Patinum.ResetOnSpawn = false

local CloseUIClick_1 = Instance.new("ImageButton")
local UICorner_1 = Instance.new("UICorner")

CloseUIClick_1.Name = "CloseUIClick"
CloseUIClick_1.Parent = Patinum
CloseUIClick_1.Active = true
CloseUIClick_1.AnchorPoint = Vector2.new(0.5, 0.5)
CloseUIClick_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
CloseUIClick_1.BackgroundTransparency = 1
CloseUIClick_1.BorderColor3 = Color3.fromRGB(0,0,0)
CloseUIClick_1.BorderSizePixel = 0
CloseUIClick_1.Position = UDim2.new(0.064, 0,0.232, 0)
CloseUIClick_1.Size = UDim2.new(0, 30,0, 30)
CloseUIClick_1.Image = "rbxassetid://16384956178"

UICorner_1.Parent = CloseUIClick_1
UICorner_1.CornerRadius = UDim.new(0,9)

local UserInputService = game:GetService("UserInputService")

local gui = CloseUIClick_1

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.04, true) -- This is what I changed
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

function Library:CreateWindow(a)
	local BackGround = Instance.new("CanvasGroup")
	local UICorner =  Instance.new("UICorner")

	BackGround.Parent = Patinum
	BackGround.Active = true
	BackGround.BorderSizePixel = 0
	BackGround.BackgroundColor3 = Color3.fromRGB(242, 242, 242)
	BackGround.AnchorPoint = Vector2.new(0.5, 0.5)
	BackGround.GroupColor3 = Color3.fromRGB(242, 242, 242)
	BackGround.Size = UDim2.new(0, 0, 0, 0)
	BackGround.Position = UDim2.new(0.5, 0, 0.5, 0)
	BackGround.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BackGround.Name = "BackGround"



	local function OpenUI()
		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local tweenOpenMin = Tw:Create(BackGround, tweenInfo, {Size = UDim2.new(0, 475, 0, 10)})
		tweenOpenMin:Play()
		tweenOpenMin.Completed:Connect(function()
			local tweenOpenMax = Tw:Create(BackGround, tweenInfo, {Size = UDim2.new(0, 475, 0, 300)})
			tweenOpenMax:Play()
		end)
	end

	OpenUI()


	CloseUIClick_1.MouseButton1Click:Connect(function()
		if BackGround.Visible then
			BackGround.Visible = false
		else
			BackGround.Visible = true
		end
	end)

	local UserInputService = game:GetService("UserInputService")

	local gui = BackGround

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.04, true) -- This is what I changed
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	UICorner.Parent = BackGround
	UICorner.CornerRadius = UDim.new(0, 9)

	local Credit = Instance.new("Frame")
	local UICorner2 = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local UIListLayout = Instance.new("UIListLayout")
	local PatinumText = Instance.new("TextLabel")
	local Keed1 = Instance.new("Frame")
	local Bang1 = Instance.new("Frame")
	local UserIcon = Instance.new("ImageLabel")
	local CreditText = Instance.new("TextLabel")
	local Keed2 = Instance.new("Frame")
	local Bang2 = Instance.new("Frame")
	local Bang3 = Instance.new("Frame")
	local FPSValue = Instance.new("TextLabel")
	local FPSText = Instance.new("TextLabel")

	Credit.Parent = BackGround
	Credit.BorderSizePixel = 0
	Credit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Credit.Size = UDim2.new(0, 217, 0, 43)
	Credit.Position = UDim2.new(0.38737, 0, 0.05667, 0)
	Credit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Credit.Name = "Credit"

	UICorner2.Parent = Credit
	UICorner2.CornerRadius = UDim.new(0, 9)

	UIStroke.Parent = Credit
	UIStroke.Transparency = 0.6
	UIStroke.Color = Color3.fromRGB(223, 223, 223)

	UIListLayout.Parent = Credit
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal

	PatinumText.Parent = Credit
	PatinumText.BorderSizePixel = 0
	PatinumText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PatinumText.TextSize = 11
	PatinumText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	PatinumText.TextColor3 = Color3.fromRGB(0, 0, 0)
	PatinumText.BackgroundTransparency = 1
	PatinumText.Size = UDim2.new(0, 63, 0, 17)
	PatinumText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PatinumText.Text = "Patinum"
	PatinumText.Name = "PatinumText"

	Keed1.Parent = Credit
	Keed1.BorderSizePixel = 0
	Keed1.BackgroundColor3 = Color3.fromRGB(223, 223, 223)
	Keed1.Size = UDim2.new(0, 1, 0, 23)
	Keed1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Keed1.Name = "Keed1"
	Keed1.LayoutOrder = 1
	Keed1.BackgroundTransparency = 0.4

	Bang1.Parent = Credit
	Bang1.BorderSizePixel = 0
	Bang1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bang1.Size = UDim2.new(0, 7, 0, 15)
	Bang1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bang1.Name = "Bang1"
	Bang1.LayoutOrder = 3
	Bang1.BackgroundTransparency = 1

	UserIcon.Parent = Credit
	UserIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserIcon.ImageTransparency = 0.5
	UserIcon.ImageColor3 = Color3.fromRGB(0, 0, 0)
	UserIcon.Image = "rbxassetid://2790547157"
	UserIcon.Size = UDim2.new(0, 20, 0, 20)
	UserIcon.BackgroundTransparency = 1
	UserIcon.LayoutOrder = 4
	UserIcon.Name = "UserIcon"
	UserIcon.Position = UDim2.new(0, 0, 0.68605, 0)

	CreditText.Parent = Credit
	CreditText.BorderSizePixel = 0
	CreditText.TextTransparency = 0.5
	CreditText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CreditText.TextSize = 9
	CreditText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	CreditText.TextColor3 = Color3.fromRGB(0, 0, 0)
	CreditText.BackgroundTransparency = 1
	CreditText.Size = UDim2.new(0, 55, 0, 17)
	CreditText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CreditText.Text = a.Credit
	CreditText.LayoutOrder = 5
	CreditText.Name = "CreditText"
	CreditText.Position = UDim2.new(0.41935, 0, 0.30233, 0)

	Keed2.Parent = Credit
	Keed2.BorderSizePixel = 0
	Keed2.BackgroundColor3 = Color3.fromRGB(223, 223, 223)
	Keed2.Size = UDim2.new(0, 1, 0, 23)
	Keed2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Keed2.Name = "Keed2"
	Keed2.LayoutOrder = 7
	Keed2.BackgroundTransparency = 0.4

	Bang2.Parent = Credit
	Bang2.BorderSizePixel = 0
	Bang2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bang2.Size = UDim2.new(0, 7, 0, 15)
	Bang2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bang2.Name = "Bang1"
	Bang2.LayoutOrder = 6
	Bang2.BackgroundTransparency = 1

	Bang3.Parent = Credit
	Bang3.BorderSizePixel = 0
	Bang3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bang3.Size = UDim2.new(0, 7, 0, 15)
	Bang3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bang3.Name = "Bang1"
	Bang3.LayoutOrder = 8
	Bang3.BackgroundTransparency = 1

	FPSValue.Parent = Credit
	FPSValue.BorderSizePixel = 0
	FPSValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FPSValue.TextSize = 9
	FPSValue.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	FPSValue.TextColor3 = Color3.fromRGB(11, 192, 57)
	FPSValue.BackgroundTransparency = 1
	FPSValue.Size = UDim2.new(0, 22, 0, 17)
	FPSValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FPSValue.Text = "60"
	FPSValue.LayoutOrder = 10
	FPSValue.Name = "FPSValue"
	FPSValue.Position = UDim2.new(0.82488, 0, 0.30233, 0)

	local fps = 0
	local lastTime = tick()
	local Runser = game:GetService("RunService")
	local rs = Runser.RenderStepped

	rs:Connect(function()
		local currentTime = tick()
		local deltaTime = currentTime - lastTime
		lastTime = currentTime
		fps = 1 / deltaTime
	end)

	task.defer(function()
		while wait(.5) do
			pcall(function()
				if fps >= 35 then
					FPSValue.TextColor3 = Color3.fromRGB(11, 192, 57)
				elseif fps >= 15 then
					FPSValue.TextColor3 = Color3.fromRGB(195, 163, 0)
				else
					FPSValue.TextColor3 = Color3.fromRGB(195, 0, 3)
				end
				FPSValue.Text = string.format("%.0f", fps)
			end)
		end
	end)

	FPSText.Parent = Credit
	FPSText.BorderSizePixel = 0
	FPSText.TextTransparency = 0.5
	FPSText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FPSText.TextSize = 9
	FPSText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	FPSText.TextColor3 = Color3.fromRGB(0, 0, 0)
	FPSText.BackgroundTransparency = 1
	FPSText.Size = UDim2.new(0, 18, 0, 17)
	FPSText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FPSText.Text = "FPS"
	FPSText.LayoutOrder = 9
	FPSText.Name = "FPSText"
	FPSText.Position = UDim2.new(0.74194, 0, 0.30233, 0)

	local TimeMark = Instance.new("Frame")
	local UICorner3 = Instance.new("UICorner")
	local UIStroke2 = Instance.new("UIStroke")
	local Text = Instance.new("TextLabel")
	local Des = Instance.new("TextLabel")
	local Icon = Instance.new("ImageLabel")

	TimeMark.Parent = BackGround
	TimeMark.BorderSizePixel = 0
	TimeMark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TimeMark.Size = UDim2.new(0, 67, 0, 43)
	TimeMark.Position = UDim2.new(0.22105, 0, 0.05667, 0)
	TimeMark.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TimeMark.Name = "TimeMark"

	UICorner3["Parent"] = TimeMark
	UICorner3["CornerRadius"] = UDim.new(0, 9)

	UIStroke2["Parent"] = TimeMark
	UIStroke2["Transparency"] = 0.6
	UIStroke2["Color"] = Color3.fromRGB(223, 223, 223)

	Text["Parent"] = TimeMark
	Text["BorderSizePixel"] = 0
	Text["TextXAlignment"] = Enum.TextXAlignment.Left
	Text["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	Text["TextSize"] = 10
	Text["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Text["TextColor3"] = Color3.fromRGB(0, 0, 0)
	Text["BackgroundTransparency"] = 1
	Text["Size"] = UDim2.new(0, 53, 0, 17)
	Text["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	Text["Text"] = [[SERVER]]
	Text["Name"] = [[Text]]
	Text["Position"] = UDim2.new(0.10931, 0, 0.12766, 0)

	Des["Parent"] = TimeMark
	Des["BorderSizePixel"] = 0
	Des["TextTransparency"] = 0.5
	Des["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	Des["TextSize"] = 12
	Des["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	Des["TextColor3"] = Color3.fromRGB(0, 0, 0)
	Des["BackgroundTransparency"] = 1
	Des["Size"] = UDim2.new(0, 43, 0, 11)
	Des["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	Des["Text"] = [[00:00:00]]
	Des["Name"] = [[Des]]
	Des["Position"] = UDim2.new(0.23262, 0, 0.5218, 0)

	task.defer(function()
		while wait(.5) do
			pcall(function()
				local scripttime = game.Workspace.DistributedGameTime
				local seconds = scripttime%60
				local minutes = math.floor(scripttime/60%60)
				local hours = math.floor(scripttime/3600)
				local tempo = string.format("%02d:%02d:%02d", hours ,minutes, seconds)
				Des["Text"] = tostring(tempo)
			end)
		end
	end)


	Icon["Parent"] = TimeMark
	Icon["ImageTransparency"] = 0.5
	Icon["ImageColor3"] = Color3.fromRGB(0, 0, 0)
	Icon["Image"] = [[rbxassetid://2774790436]]
	Icon["Size"] = UDim2.new(0, 9, 0, 9)
	Icon["BackgroundTransparency"] = 1
	Icon["Name"] = [[Selected: timer_enabled]]
	Icon["Position"] = UDim2.new(0.1028, 0, 0.55814, 0)

	local Discord = Instance.new("Frame")
	local UICorner4 = Instance.new("UICorner")
	local UIStroke3 = Instance.new("UIStroke")
	local IconDiscord = Instance.new("ImageLabel")
	local DiscordClick = Instance.new("TextButton")

	Discord["Parent"] = BackGround
	Discord["BorderSizePixel"] = 0
	Discord["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	Discord["Size"] = UDim2.new(0, 43, 0, 43)
	Discord["Position"] = UDim2.new(0.86737, 0, 0.05667, 0)
	Discord["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	Discord["Name"] = [[Discord]]

	UICorner4["Parent"] = Discord
	UICorner4["CornerRadius"] = UDim.new(0, 9)

	UIStroke3["Parent"] = Discord
	UIStroke3["Transparency"] = 0.6
	UIStroke3["Color"] = Color3.fromRGB(223, 223, 223)

	IconDiscord["Parent"] = Discord
	IconDiscord["BorderSizePixel"] = 0
	IconDiscord["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	IconDiscord["ImageColor3"] = Color3.fromRGB(0, 0, 0)
	IconDiscord["ImageTransparency"] = 0.5
	IconDiscord["AnchorPoint"] = Vector2.new(0.5, 0.5)
	IconDiscord["Image"] = [[rbxassetid://18977771125]]
	IconDiscord["Size"] = UDim2.new(0.65, 0, 0.5, 0)
	IconDiscord["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	IconDiscord["BackgroundTransparency"] = 1
	IconDiscord["Name"] = [[IconDiscord]]
	IconDiscord["Position"] = UDim2.new(0.5, 0, 0.5, 0)

	DiscordClick["Parent"] = Discord
	DiscordClick["BorderSizePixel"] = 0
	DiscordClick["TextSize"] = 14
	DiscordClick["TextColor3"] = Color3.fromRGB(0, 0, 0)
	DiscordClick["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	DiscordClick["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	DiscordClick["Size"] = UDim2.new(1, 0, 1, 0)
	DiscordClick["BackgroundTransparency"] = 1
	DiscordClick["Name"] = [[DiscordClick]]
	DiscordClick["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	DiscordClick["Text"] = [[]]

	local function tweensize(object, target)
		local targetSize = target
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local tween = Tw:Create(object, tweenInfo, {Size = targetSize})
		tween:Play()
	end

	DiscordClick.MouseButton1Click:Connect(function()
		tweensize(Discord, UDim2.new(0, 35, 0, 35))
		Tw:Create(Discord, Tf2, {Position = UDim2.new(0.863, 0,0.07, 0)}):Play()
		task.delay(0.16, function()
			tweensize(Discord, UDim2.new(0, 43, 0, 43))
			Tw:Create(Discord, Tf2, {Position = UDim2.new(0.867, 0,0.057, 0)}):Play()
		end)
		setclipboard("https://discord.gg/D9YT7p2e5v")
	end)

	local Tab = Instance.new("Frame")
	local UIStroke4 = Instance.new("UIStroke")
	local TabList = Instance.new("Frame")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout2 = Instance.new("UIListLayout")

	Tab["Parent"] = BackGround
	Tab["BorderSizePixel"] = 0
	Tab["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	Tab["Size"] = UDim2.new(0, 85, 0, 300)
	Tab["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	Tab["Name"] = [[Tab]]

	UIStroke4["Parent"] = Tab
	UIStroke4["Transparency"] = 0.6
	UIStroke4["Color"] = Color3.fromRGB(223, 223, 223)

	TabList["Parent"] = Tab
	TabList["BorderSizePixel"] = 0
	TabList["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	TabList["Size"] = UDim2.new(0, 54, 0, 222)
	TabList["Position"] = UDim2.new(0.17647, 0, 0.13, 0)
	TabList["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	TabList["Name"] = [[TabList]]
	TabList["BackgroundTransparency"] = 1

	ScrollingFrame["Parent"] = TabList
	ScrollingFrame["Active"] = true
	ScrollingFrame["BorderSizePixel"] = 0
	ScrollingFrame["CanvasSize"] = UDim2.new(0, 0, 1, 0)
	ScrollingFrame["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	ScrollingFrame["Size"] = UDim2.new(1, 0, 1, 0)
	ScrollingFrame["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
	ScrollingFrame["Transparency"] = 1
	ScrollingFrame["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	ScrollingFrame["ScrollBarThickness"] = 0

	UIListLayout2["Parent"] = ScrollingFrame
	UIListLayout2["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
	UIListLayout2["Padding"] = UDim.new(0, 10)
	UIListLayout2["VerticalAlignment"] = Enum.VerticalAlignment.Center
	UIListLayout2["SortOrder"] = Enum.SortOrder.LayoutOrder

	Library.Page = {
		Value = false
	}

	function Library.Page:AddPage(a)
		local ATab = Instance.new("Frame")
		local UICorner5 = Instance.new("UICorner")
		local UIStroke5 = Instance.new("UIStroke")
		local TabClick = Instance.new("TextButton")
		local IconTab = Instance.new("ImageLabel")
		local TitleTab = Instance.new("TextLabel")
		local tickback = Instance.new("Frame")
		local UICorner6 = Instance.new("UICorner")
		local tick1 = Instance.new("Frame")
		local UICorner7 = Instance.new("UICorner")
		local UIStroke6 = Instance.new("UIStroke")

		ATab["Parent"] = ScrollingFrame
		ATab["BorderSizePixel"] = 0
		ATab["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
		ATab["Size"] = UDim2.new(0, 54, 0, 44)
		ATab["Position"] = UDim2.new(0.86737, 0, 0.05667, 0)
		ATab["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		ATab["Name"] = [[ATab]]

		UICorner5["Parent"] = ATab
		UICorner5["CornerRadius"] = UDim.new(0, 9)

		UIStroke5["Parent"] = ATab
		UIStroke5["Transparency"] = 0.6
		UIStroke5["Color"] = Color3.fromRGB(223, 223, 223)

		TabClick["Parent"] = ATab
		TabClick["BorderSizePixel"] = 0
		TabClick["TextSize"] = 14
		TabClick["TextColor3"] = Color3.fromRGB(0, 0, 0)
		TabClick["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		TabClick["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		TabClick["Size"] = UDim2.new(1, 0, 1, 0)
		TabClick["BackgroundTransparency"] = 1
		TabClick["Name"] = [[TabClick]]
		TabClick["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		TabClick["Text"] = [[]]

		IconTab["Parent"] = ATab
		IconTab["BorderSizePixel"] = 0
		IconTab["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		IconTab["ImageColor3"] = Color3.fromRGB(0, 0, 0)
		IconTab["AnchorPoint"] = Vector2.new(0.5, 0.5)
		if assets[a.Icon] then
			IconTab.Image = assets[a.Icon]
		elseif type(a.Icon) == 'string' and not a.Icon:find('rbxassetid://') then
			IconTab.Image = "rbxassetid://".. a.Icon
		elseif type(a.Icon) == 'number' then
			IconTab.Image = "rbxassetid://".. a.Icon
		else
			IconTab.Image = a.Icon
		end

		IconTab["Size"] = UDim2.new(0, 15, 0, 15)
		IconTab["ClipsDescendants"] = true
		IconTab["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		IconTab["BackgroundTransparency"] = 1
		IconTab["Name"] = [[Icon]]
		IconTab["Position"] = UDim2.new(0.5, 0, 0.3, 0)
		IconTab["ImageTransparency"] = 0.5

		TitleTab["Parent"] = ATab
		TitleTab["TextWrapped"] = true
		TitleTab["BorderSizePixel"] = 0
		TitleTab["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		TitleTab["TextSize"] = 10
		TitleTab["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		TitleTab["TextColor3"] = Color3.fromRGB(0, 0, 0)
		TitleTab["BackgroundTransparency"] = 1
		TitleTab["AnchorPoint"] = Vector2.new(0.5, 0.5)
		TitleTab["Size"] = UDim2.new(0, 40, 0, 15)
		TitleTab["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		TitleTab["Text"] = a.Title
		TitleTab["Name"] = [[Title]]
		TitleTab["Position"] = UDim2.new(0.5, 0, 0.7, 0)
		TitleTab["TextTransparency"] = 0.5

		tickback["Parent"] = ATab
		tickback["BorderSizePixel"] = 0
		tickback["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		tickback["AnchorPoint"] = Vector2.new(0.5, 0.5)
		tickback["Size"] = UDim2.new(0, 10, 0, 10)
		tickback["Position"] = UDim2.new(0.85, 0, 0.2, 0)
		tickback["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		tickback["Name"] = [[tickback]]

		UICorner6["Parent"] = tickback
		UICorner6["CornerRadius"] = UDim.new(1, 0)

		tick1["Parent"] = tickback
		tick1["BorderSizePixel"] = 0
		tick1["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
		tick1["BackgroundTransparency"] = 0.5
		tick1["AnchorPoint"] = Vector2.new(0.5, 0.5)
		tick1["Size"] = UDim2.new(0.8, 0, 0.8, 0)
		tick1["Position"] = UDim2.new(0.5, 0, 0.5, 0)
		tick1["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		tick1["Name"] = [[tick]]

		UICorner7["Parent"] = tick1
		UICorner7["CornerRadius"] = UDim.new(1, 0)

		UIStroke6["Parent"] = tick1
		UIStroke6["Transparency"] = 0.6
		UIStroke6["Color"] = Color3.fromRGB(223, 223, 223)

		local Page = Instance.new("Frame")
		local PageL = Instance.new("Frame")
		local UICorner8 = Instance.new("UICorner")
		local UIStroke7 = Instance.new("UIStroke")
		local SectionFrame = Instance.new("Frame")
		local UIListLayout3 = Instance.new("UIListLayout")
		local IconPageL = Instance.new("ImageLabel")
		local TitlePageL = Instance.new("TextLabel")
		local UnderScore = Instance.new("Frame")

		Page["Parent"] = BackGround
		Page["BorderSizePixel"] = 0
		Page["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Page["Size"] = UDim2.new(0, 350, 0, 208)
		Page["Position"] = UDim2.new(0.22105, 0, 0.27, 0)
		Page["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		Page["Name"] = [[Page]]
		Page["BackgroundTransparency"] = 1
		Page["Visible"] = false

		PageL = Instance.new("Frame", Page)
		PageL["BorderSizePixel"] = 0
		PageL["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		PageL["Size"] = UDim2.new(0, 171, 0, 208)
		PageL["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		PageL["Name"] = [[PageLeft]]

		UICorner8["Parent"] = PageL

		UIStroke7["Parent"] = PageL
		UIStroke7["Transparency"] = 0.6
		UIStroke7["Color"] = Color3.fromRGB(223, 223, 223)

		SectionFrame["Parent"] = PageL
		SectionFrame["BorderSizePixel"] = 0
		SectionFrame["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		SectionFrame["Size"] = UDim2.new(0, 170, 0, 20)
		SectionFrame["Position"] = UDim2.new(0, 0, 0.02885, 0)
		SectionFrame["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		SectionFrame["Name"] = [[SectionFrame]]
		SectionFrame["BackgroundTransparency"] = 1

		UIListLayout3["Parent"] = SectionFrame
		UIListLayout3["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		UIListLayout3["Padding"] = UDim.new(0, 5)
		UIListLayout3["VerticalAlignment"] = Enum.VerticalAlignment.Center
		UIListLayout3["SortOrder"] = Enum.SortOrder.LayoutOrder
		UIListLayout3["FillDirection"] = Enum.FillDirection.Horizontal

		IconPageL["Parent"] = SectionFrame
		IconPageL["BorderSizePixel"] = 0
		IconPageL["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		IconPageL["ImageColor3"] = Color3.fromRGB(0, 0, 0)
		IconPageL["AnchorPoint"] = Vector2.new(0.5, 0.5)
		if assets[a.Page.Left.Icon] then
			IconPageL.Image = assets[a.Page.Left.Icon]
		elseif type(a.Page.Left.Icon) == 'string' and not a.Page.Left.Icon:find('rbxassetid://') then
			IconPageL.Image = "rbxassetid://".. a.Page.Left.Icon
		elseif type(a.Page.Left.Icon) == 'number' then
			IconPageL.Image = "rbxassetid://".. a.Page.Left.Icon
		else
			IconPageL.Image = a.Page.Left.Icon
		end
		IconPageL["Size"] = UDim2.new(0, 10, 0, 10)
		IconPageL["ClipsDescendants"] = true
		IconPageL["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		IconPageL["BackgroundTransparency"] = 1
		IconPageL["Name"] = [[Icon]]
		IconPageL["Position"] = UDim2.new(0.5, 0, 0.3, 0)

		TitlePageL["Parent"] = SectionFrame
		TitlePageL["TextWrapped"] = true
		TitlePageL["BorderSizePixel"] = 0
		TitlePageL["TextXAlignment"] = Enum.TextXAlignment.Left
		TitlePageL["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		TitlePageL["TextSize"] = 10
		TitlePageL["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		TitlePageL["TextColor3"] = Color3.fromRGB(0, 0, 0)
		TitlePageL["BackgroundTransparency"] = 1
		TitlePageL["AnchorPoint"] = Vector2.new(0.5, 0.5)
		TitlePageL["Size"] = UDim2.new(0, 40, 0, 15)
		TitlePageL["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		TitlePageL["Text"] = a.Page.Left.Name
		TitlePageL["LayoutOrder"] = 1
		TitlePageL["Name"] = [[Title]]
		TitlePageL["Position"] = UDim2.new(0.5, 0, 0.7, 0)

		UnderScore["Parent"] = PageL
		UnderScore["BorderSizePixel"] = 0
		UnderScore["BackgroundColor3"] = Color3.fromRGB(223, 223, 223)
		UnderScore["Size"] = UDim2.new(0, 171, 0, 1)
		UnderScore["Position"] = UDim2.new(0, 0, 0.13462, 0)
		UnderScore["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UnderScore["Name"] = [[UnderScore]]
		UnderScore["BackgroundTransparency"] = 0.4

		local PageR = Instance.new("Frame")
		local UICorner9 = Instance.new("UICorner")
		local UIStroke10 = Instance.new("UIStroke")
		local SectionFrame2 = Instance.new("Frame")
		local UIListLayout4 = Instance.new("UIListLayout")
		local IconPageR = Instance.new("ImageLabel")
		local TitlePageR = Instance.new("TextLabel")
		local UnderScore2 = Instance.new("Frame")

		PageR = Instance.new("Frame", Page)
		PageR["BorderSizePixel"] = 0
		PageR["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		PageR["Size"] = UDim2.new(0, 171, 0, 208)
		PageR["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		PageR["Name"] = [[PageRight]]
		PageR["Position"] = UDim2.new(0.51143, 0, 0, 0)

		UICorner9["Parent"] = PageR

		UIStroke10["Parent"] = PageR
		UIStroke10["Transparency"] = 0.6
		UIStroke10["Color"] = Color3.fromRGB(223, 223, 223)

		SectionFrame2["Parent"] = PageR
		SectionFrame2["BorderSizePixel"] = 0
		SectionFrame2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		SectionFrame2["Size"] = UDim2.new(0, 170, 0, 20)
		SectionFrame2["Position"] = UDim2.new(0, 0, 0.02885, 0)
		SectionFrame2["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		SectionFrame2["Name"] = [[SectionFrame]]
		SectionFrame2["BackgroundTransparency"] = 1

		UIListLayout4["Parent"] = SectionFrame2
		UIListLayout4["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		UIListLayout4["Padding"] = UDim.new(0, 5)
		UIListLayout4["VerticalAlignment"] = Enum.VerticalAlignment.Center
		UIListLayout4["SortOrder"] = Enum.SortOrder.LayoutOrder
		UIListLayout4["FillDirection"] = Enum.FillDirection.Horizontal

		IconPageR["Parent"] = SectionFrame2
		IconPageR["BorderSizePixel"] = 0
		IconPageR["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		IconPageR["ImageColor3"] = Color3.fromRGB(0, 0, 0)
		IconPageR["AnchorPoint"] = Vector2.new(0.5, 0.5)
		if assets[a.Page.Right.Icon] then
			IconPageR.Image = assets[a.Page.Right.Icon]
		elseif type(a.Page.Right.Icon) == 'string' and not a.Page.Right.Icon:find('rbxassetid://') then
			IconPageR.Image = "rbxassetid://".. a.Page.Right.Icon
		elseif type(a.Page.Right.Icon) == 'number' then
			IconPageR.Image = "rbxassetid://".. a.Page.Right.Icon
		else
			IconPageR.Image = a.Page.Right.Icon
		end

		IconPageR["Size"] = UDim2.new(0, 10, 0, 10)
		IconPageR["ClipsDescendants"] = true
		IconPageR["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		IconPageR["BackgroundTransparency"] = 1
		IconPageR["Name"] = [[Icon]]
		IconPageR["Position"] = UDim2.new(0.5, 0, 0.3, 0)

		TitlePageR["Parent"] = SectionFrame2
		TitlePageR["TextWrapped"] = true
		TitlePageR["BorderSizePixel"] = 0
		TitlePageR["TextXAlignment"] = Enum.TextXAlignment.Left
		TitlePageR["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		TitlePageR["TextSize"] = 10
		TitlePageR["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		TitlePageR["TextColor3"] = Color3.fromRGB(0, 0, 0)
		TitlePageR["BackgroundTransparency"] = 1
		TitlePageR["AnchorPoint"] = Vector2.new(0.5, 0.5)
		TitlePageR["Size"] = UDim2.new(0, 40, 0, 15)
		TitlePageR["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		TitlePageR["Text"] = a.Page.Right.Name
		TitlePageR["LayoutOrder"] = 1
		TitlePageR["Name"] = [[Title]]
		TitlePageR["Position"] = UDim2.new(0.5, 0, 0.7, 0)

		UnderScore2["Parent"] = PageR
		UnderScore2["BorderSizePixel"] = 0
		UnderScore2["BackgroundColor3"] = Color3.fromRGB(223, 223, 223)
		UnderScore2["Size"] = UDim2.new(0, 171, 0, 1)
		UnderScore2["Position"] = UDim2.new(0, 0, 0.13462, 0)
		UnderScore2["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		UnderScore2["Name"] = [[UnderScore]]
		UnderScore2["BackgroundTransparency"] = 0.4

		local SectionList = Instance.new("Frame")
		local SectionList2 = Instance.new("Frame")
		local ScrollingFrame1 = Instance.new("ScrollingFrame")
		local ScrollingFrame2 = Instance.new("ScrollingFrame")
		local UIListLayout5 = Instance.new("UIListLayout")
		local UIListLayout6 = Instance.new("UIListLayout")

		SectionList["Parent"] = PageL
		SectionList["BorderSizePixel"] = 0
		SectionList["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		SectionList["Size"] = UDim2.new(0, 171, 0, 169)
		SectionList["Position"] = UDim2.new(0, 0, 0.1875, 0)
		SectionList["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		SectionList["Name"] = [[SectionList]]
		SectionList["BackgroundTransparency"] = 1

		SectionList2["Parent"] = PageR
		SectionList2["BorderSizePixel"] = 0
		SectionList2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		SectionList2["Size"] = UDim2.new(0, 171, 0, 169)
		SectionList2["Position"] = UDim2.new(0, 0, 0.1875, 0)
		SectionList2["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		SectionList2["Name"] = [[SectionList]]
		SectionList2["BackgroundTransparency"] = 1

		ScrollingFrame1["Parent"] = SectionList
		ScrollingFrame1["Active"] = true
		ScrollingFrame1["BorderSizePixel"] = 0
		ScrollingFrame1["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		ScrollingFrame1["Size"] = UDim2.new(1, 0, 1, 0)
		ScrollingFrame1["ScrollBarImageColor3"] = Color3.fromRGB(0, 100, 255)
		ScrollingFrame1["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		ScrollingFrame1["ScrollBarThickness"] = 3
		ScrollingFrame1["BackgroundTransparency"] = 1

		ScrollingFrame2["Parent"] = SectionList2
		ScrollingFrame2["Active"] = true
		ScrollingFrame2["BorderSizePixel"] = 0
		ScrollingFrame2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		ScrollingFrame2["Size"] = UDim2.new(1, 0, 1, 0)
		ScrollingFrame2["ScrollBarImageColor3"] = Color3.fromRGB(0, 100, 255)
		ScrollingFrame2["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		ScrollingFrame2["ScrollBarThickness"] = 3
		ScrollingFrame2["BackgroundTransparency"] = 1

		UIListLayout5["Parent"] = ScrollingFrame1
		UIListLayout5["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		UIListLayout5["Padding"] = UDim.new(0, 8)
		UIListLayout5["SortOrder"] = Enum.SortOrder.LayoutOrder

		UIListLayout6["Parent"] = ScrollingFrame2
		UIListLayout6["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		UIListLayout6["Padding"] = UDim.new(0, 8)
		UIListLayout6["SortOrder"] = Enum.SortOrder.LayoutOrder

		TabClick.MouseButton1Click:Connect(function()
			for i,v in pairs(BackGround:GetChildren()) do
				if v.Name == "Page" then
					v.Visible = false
					v.Position = UDim2.new(0.22105, 0, 0.3, 0)
				end
			end

			for i,v in pairs(ScrollingFrame:GetChildren()) do
				if v:IsA("Frame") then
					Tw:Create(v.Title ,Tf ,{TextTransparency = 0.5}):Play()
					Tw:Create(v.tickback.tick ,Tf ,{BackgroundTransparency = 0.5}):Play()
					Tw:Create(v.Icon ,Tf ,{ImageTransparency = 0.5}):Play()
					Tw:Create(v.tickback.tick ,Tf ,{BackgroundColor3 = Color3.fromRGB(0, 0, 0)}):Play()
				end
			end

			Tw:Create(TitleTab ,Tf ,{TextTransparency = 0}):Play()
			Tw:Create(tick1 ,Tf ,{BackgroundTransparency = 0}):Play()
			Tw:Create(IconTab ,Tf ,{ImageTransparency = 0}):Play()
			Tw:Create(tick1 ,Tf ,{BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
			Page["Visible"] = true
			Tw:Create(Page ,Tf2 ,{Position = UDim2.new(0.22105, 0, 0.24667, 0)}):Play()
		end)

		delay(0,function()
			if not Library.Page.Value then
				Tw:Create(TitleTab ,Tf ,{TextTransparency = 0}):Play()
				Tw:Create(tick1 ,Tf ,{BackgroundTransparency = 0}):Play()
				Tw:Create(IconTab ,Tf ,{ImageTransparency = 0}):Play()
				Tw:Create(tick1 ,Tf ,{BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
				Page["Visible"] = true
				Library.Page.Value = true
				Tw:Create(Page ,Tf2 ,{Position = UDim2.new(0.22105, 0, 0.24667, 0)}):Play()
			end
		end)

		UIListLayout5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			ScrollingFrame1.CanvasSize = UDim2.new(0, 0, 0, UIListLayout5.AbsoluteContentSize.Y+5)
		end)

		UIListLayout6:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, UIListLayout6.AbsoluteContentSize.Y+5)
		end)

		local function GetParent(s)
			if s == "Right" or s == "R" or s == "r" or s == "2" or s == "right" then
				return ScrollingFrame2
			elseif s == "Left" or s == "L" or s == "l" or s == "1" or s == "left" then
				return ScrollingFrame1
			else
				return ScrollingFrame1
			end
		end

		Library.Function = {}

		function Library.Function:CreateLabel(s,a)
			local Label = Instance.new("Frame")
			local UIStroke11 = Instance.new("UIStroke")
			local UICorner10 = Instance.new("UICorner")
			local TitleLabel = Instance.new("TextLabel")
			local DesLabel = Instance.new("TextLabel")

			Label["Parent"] = GetParent(s)
			Label["BorderSizePixel"] = 0
			Label["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
			Label["Size"] = UDim2.new(0, 151, 0, 35)
			Label["Position"] = UDim2.new(0.05848, 0, 0, 0)
			Label["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Label["Name"] = [[Label]]

			UIStroke11["Parent"] = Label
			UIStroke11["Transparency"] = 0.6
			UIStroke11["Color"] = Color3.fromRGB(223, 223, 223)

			UICorner10["Parent"] = Label

			TitleLabel["Parent"] = Label
			TitleLabel["BorderSizePixel"] = 0
			TitleLabel["TextXAlignment"] = Enum.TextXAlignment.Left
			TitleLabel["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TitleLabel["TextSize"] = 9
			TitleLabel["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			TitleLabel["TextColor3"] = Color3.fromRGB(0, 0, 0)
			TitleLabel["BackgroundTransparency"] = 1
			TitleLabel["AnchorPoint"] = Vector2.new(0.5, 0.5)
			TitleLabel["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			TitleLabel["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TitleLabel["Name"] = "Title"
			TitleLabel["Position"] = UDim2.new(0.4, 0, 0.35, 0)
			TitleLabel["Text"] = a.Title
			TitleLabel["RichText"] = true

			DesLabel["Parent"] = Label
			DesLabel["BorderSizePixel"] = 0
			DesLabel["TextXAlignment"] = Enum.TextXAlignment.Left
			DesLabel["TextTransparency"] = 0.5
			DesLabel["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			DesLabel["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			DesLabel["TextColor3"] = Color3.fromRGB(0, 0, 0)
			DesLabel["BackgroundTransparency"] = 1
			DesLabel["AnchorPoint"] = Vector2.new(0.5, 0.5)
			DesLabel["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			DesLabel["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			DesLabel["Text"] = a.Desc
			DesLabel["Name"] = "Des"
			DesLabel["Position"] = UDim2.new(0.4, 0, 0.66429, 0)
			DesLabel["RichText"] = true

			local Newtext = {}
			function Newtext:SetTitle(k)
				TitleLabel["Text"] = k
			end
			function Newtext:SetDesc(k)
				DesLabel["Text"] = k
			end

			if #DesLabel["Text"] == 0 then
				TitleLabel["Position"] = UDim2.new(0.4, 0, 0.5, 0)
			end
			return Newtext
		end

		function Library.Function:CreateToggle(s,a)
			local Toggle = Instance.new("Frame")
			local UIStroke12 = Instance.new("UIStroke")
			local UICorner11 = Instance.new("UICorner")
			local TitleToggle = Instance.new("TextLabel")
			local DesToggle = Instance.new("TextLabel")
			local ToggleO = Instance.new("Frame")
			local UICorner12 = Instance.new("UICorner")
			local UIStroke13 = Instance.new("UIStroke")
			local O = Instance.new("Frame")
			local UICorner13 = Instance.new("UICorner")
			local ToggleClick = Instance.new("TextButton")

			local Callback = a.Callback or function() end
			local bool = a.Value or false

			Toggle["BorderSizePixel"] = 0
			Toggle["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
			Toggle["Size"] = UDim2.new(0, 151, 0, 35)
			Toggle["Position"] = UDim2.new(0.05848, 0, 0, 0)
			Toggle["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Toggle["Name"] = [[Toggle]]
			Toggle["Parent"] = GetParent(s)

			UIStroke12["Parent"] = Toggle
			UIStroke12["Transparency"] = 0.6
			UIStroke12["Color"] = Color3.fromRGB(223, 223, 223)

			UICorner11["Parent"] = Toggle

			TitleToggle["Parent"] = Toggle
			TitleToggle["BorderSizePixel"] = 0
			TitleToggle["TextXAlignment"] = Enum.TextXAlignment.Left
			TitleToggle["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TitleToggle["TextSize"] = 9
			TitleToggle["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			TitleToggle["TextColor3"] = Color3.fromRGB(0, 0, 0)
			TitleToggle["BackgroundTransparency"] = 1
			TitleToggle["AnchorPoint"] = Vector2.new(0.5, 0.5)
			TitleToggle["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			TitleToggle["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TitleToggle["Text"] = a.Title
			TitleToggle["Name"] = [[Title]]
			TitleToggle["Position"] = UDim2.new(0.4, 0, 0.35, 0)

			DesToggle["Parent"] = Toggle
			DesToggle["BorderSizePixel"] = 0
			DesToggle["TextXAlignment"] = Enum.TextXAlignment.Left
			DesToggle["TextTransparency"] = 0.5
			DesToggle["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			DesToggle["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			DesToggle["TextColor3"] = Color3.fromRGB(0, 0, 0)
			DesToggle["BackgroundTransparency"] = 1
			DesToggle["AnchorPoint"] = Vector2.new(0.5, 0.5)
			DesToggle["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			DesToggle["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			DesToggle["Text"] = a.Desc
			DesToggle["Name"] = [[Des]]
			DesToggle["Position"] = UDim2.new(0.4, 0, 0.66429, 0)

			if #DesToggle["Text"] == 0 then
				TitleToggle["Position"] = UDim2.new(0.4, 0, 0.5, 0)
			end

			ToggleO["Parent"] = Toggle
			ToggleO["BorderSizePixel"] = 0
			ToggleO["BackgroundColor3"] = Color3.fromRGB(213, 213, 213)
			ToggleO["AnchorPoint"] = Vector2.new(0.5, 0.5)
			ToggleO["Size"] = UDim2.new(0.2, 0, 0.35, 0)
			ToggleO["Position"] = UDim2.new(0.85, 0, 0.5, 0)
			ToggleO["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			ToggleO["Name"] = [[ToggleO]]

			UICorner12["Parent"] = ToggleO

			UIStroke13["Parent"] = ToggleO
			UIStroke13["Transparency"] = 0.6
			UIStroke13["Color"] = Color3.fromRGB(223, 223, 223)

			O["Parent"] = ToggleO
			O["BorderSizePixel"] = 0
			O["BackgroundColor3"] = Color3.fromRGB(156, 156, 156)
			O["AnchorPoint"] = Vector2.new(0.5, 0.5)
			O["Size"] = UDim2.new(0, 9, 0, 9)
			O["Position"] = UDim2.new(0.28, 0, 0.5, 0)
			O["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			O["Name"] = [[O]]

			UICorner13["Parent"] = O

			ToggleClick["Parent"] = ToggleO
			ToggleClick["BorderSizePixel"] = 0
			ToggleClick["TextSize"] = 14
			ToggleClick["TextColor3"] = Color3.fromRGB(0, 0, 0)
			ToggleClick["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			ToggleClick["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			ToggleClick["Size"] = UDim2.new(1, 0, 1, 0)
			ToggleClick["BackgroundTransparency"] = 1
			ToggleClick["Name"] = [[ToggleClick]]
			ToggleClick["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			ToggleClick["Text"] = [[]]

			local function TweenToggle(object, target)
				local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				local tween = Tw:Create(object, tweenInfo, {Position = target})
				tween:Play()
			end

			local function InItBoolCheck(bool : boolean)
				if not bool then 
					Callback(bool)
					O["BackgroundColor3"] = Color3.fromRGB(156, 156, 156)
					TweenToggle(O, UDim2.new(0.28, 0, 0.5, 0))
				elseif bool then 
					Callback(bool)
					O["BackgroundColor3"] = Color3.fromRGB(0, 102, 255)
					TweenToggle(O, UDim2.new(0.7, 0, 0.5, 0))
				end
			end

			ToggleClick.MouseButton1Down:Connect(function()
				bool = not bool 
				if bool then
					Callback(bool)
					O["BackgroundColor3"] = Color3.fromRGB(0, 102, 255)
					TweenToggle(O, UDim2.new(0.7, 0, 0.5, 0))
				elseif not bool then
					Callback(bool)
					O["BackgroundColor3"] = Color3.fromRGB(156, 156, 156)
					TweenToggle(O, UDim2.new(0.28, 0, 0.5, 0))
				end
			end)

			InItBoolCheck(bool)
		end

		function Library.Function:CreateButton(s, info)
			local title = info.Title or "nil"
			local Desc = info.Desc or "nil"
			local secure = info.Secure or false
			local callback = info.Callback or function() end

			local Buttons = {}

			Buttons["bb"] = Instance.new("Frame", GetParent(s))
			Buttons["bb"]["BorderSizePixel"] = 0
			Buttons["bb"]["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
			Buttons["bb"]["Size"] = UDim2.new(0, 151, 0, 35)
			Buttons["bb"]["Position"] = UDim2.new(0.05848, 0, 0, 0)
			Buttons["bb"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Buttons["bb"]["Name"] = [[Button]]

			Buttons["bc"] = Instance.new("UIStroke", Buttons["bb"])
			Buttons["bc"]["Transparency"] = 0.6
			Buttons["bc"]["Color"] = Color3.fromRGB(223, 223, 223)

			Buttons["bd"] = Instance.new("UICorner", Buttons["bb"])

			Buttons["be"] = Instance.new("TextLabel", Buttons["bb"])
			Buttons["be"]["BorderSizePixel"] = 0
			Buttons["be"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Buttons["be"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Buttons["be"]["TextSize"] = 9
			Buttons["be"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Buttons["be"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Buttons["be"]["BackgroundTransparency"] = 1
			Buttons["be"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Buttons["be"]["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			Buttons["be"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Buttons["be"]["Text"] = tostring(title)
			Buttons["be"]["Name"] = [[Title]]
			Buttons["be"]["Position"] = UDim2.new(0.4, 0, 0.35, 0)

			Buttons["bf"] = Instance.new("TextLabel", Buttons["bb"])
			Buttons["bf"]["BorderSizePixel"] = 0
			Buttons["bf"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Buttons["bf"]["TextTransparency"] = 0.5
			Buttons["bf"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Buttons["bf"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Buttons["bf"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Buttons["bf"]["BackgroundTransparency"] = 1
			Buttons["bf"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Buttons["bf"]["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			Buttons["bf"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Buttons["bf"]["Text"] = tostring(Desc)
			Buttons["bf"]["Name"] = [[Des]]
			Buttons["bf"]["Position"] = UDim2.new(0.4, 0, 0.66429, 0)

			if #Buttons["bf"]["Text"] == 0 then
				Buttons["be"]["Position"] = UDim2.new(0.4, 0, 0.5, 0)
			end

			Buttons["c0"] = Instance.new("Frame", Buttons["bb"])
			Buttons["c0"]["BorderSizePixel"] = 0
			Buttons["c0"]["BackgroundColor3"] = Color3.fromRGB(0, 102, 255)
			Buttons["c0"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Buttons["c0"]["Size"] = UDim2.new(0.3, 0, 0.35, 0)
			Buttons["c0"]["Position"] = UDim2.new(0.77715, 0, 0.5, 0)
			Buttons["c0"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Buttons["c0"]["Name"] = [[ButtonClick]]

			Buttons["c1"] = Instance.new("UICorner", Buttons["c0"])

			Buttons["c2"] = Instance.new("UIStroke", Buttons["c0"])
			Buttons["c2"]["Transparency"] = 0.6
			Buttons["c2"]["Color"] = Color3.fromRGB(223, 223, 223)

			Buttons["c3"] = Instance.new("TextButton", Buttons["c0"])
			Buttons["c3"]["BorderSizePixel"] = 0
			Buttons["c3"]["TextSize"] = 14
			Buttons["c3"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Buttons["c3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Buttons["c3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Buttons["c3"]["Size"] = UDim2.new(1, 0, 1, 0)
			Buttons["c3"]["BackgroundTransparency"] = 1
			Buttons["c3"]["Name"] = [[ToggleClick]]
			Buttons["c3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Buttons["c3"]["Text"] = [[]]

			local ConfirmButton = Instance.new("Frame", BackGround)
			local Frame = Instance.new("Frame", ConfirmButton)
			local UICorner16 = Instance.new("UICorner", Frame)
			local UIStroke16 = Instance.new("UIStroke", Frame)
			local Confirm = Instance.new("Frame", Frame)
			local UICorner17 = Instance.new("UICorner", Confirm)
			local UIStroke17 = Instance.new("UIStroke", Confirm)
			local TextLabelC = Instance.new("TextLabel", Confirm)
			local TextButton = Instance.new("TextButton", Confirm)
			local Cancel = Instance.new("Frame", Frame)
			local UICorner18 = Instance.new("UICorner", Cancel)
			local UIStroke18 = Instance.new("UIStroke", Cancel)
			local TextLabel2 = Instance.new("TextLabel", Cancel)
			local TextButton2 = Instance.new("TextButton", Cancel)
			local Des2 = Instance.new("TextLabel", Frame)
			local Title2 = Instance.new("TextLabel", Frame)

			ConfirmButton["Visible"] = false
			ConfirmButton["ZIndex"] = 2
			ConfirmButton["BorderSizePixel"] = 0
			ConfirmButton["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
			ConfirmButton["Size"] = UDim2.new(1, 0, 1, 0)
			ConfirmButton["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			ConfirmButton["Name"] = [[ConfirmButton]]
			ConfirmButton["BackgroundTransparency"] = 0.3

			Frame["BorderSizePixel"] = 0
			Frame["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
			Frame["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Frame["Size"] = UDim2.new(0, 200, 0, 100)
			Frame["Position"] = UDim2.new(0.5, 0, 0.5, 0)
			Frame["BorderColor3"] = Color3.fromRGB(0, 0, 0)

			UICorner16["CornerRadius"] = UDim.new(0, 9)

			UIStroke16["Transparency"] = 0.6
			UIStroke16["Color"] = Color3.fromRGB(223, 223, 223)

			Confirm["BorderSizePixel"] = 0
			Confirm["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Confirm["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Confirm["Size"] = UDim2.new(0, 85, 0, 30)
			Confirm["Position"] = UDim2.new(0.2617, 0, 0.7355, 0)
			Confirm["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Confirm["Name"] = [[Confirm]]

			UICorner17["CornerRadius"] = UDim.new(0, 9)

			UIStroke17["Transparency"] = 0.6
			UIStroke17["Color"] = Color3.fromRGB(223, 223, 223)

			TextLabelC["BorderSizePixel"] = 0
			TextLabelC["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TextLabelC["TextSize"] = 14
			TextLabelC["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			TextLabelC["TextColor3"] = Color3.fromRGB(0, 102, 255)
			TextLabelC["BackgroundTransparency"] = 1
			TextLabelC["AnchorPoint"] = Vector2.new(0.5, 0.5)
			TextLabelC["Size"] = UDim2.new(1, 0, 1, 0)
			TextLabelC["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextLabelC["Text"] = [[Confirm]]
			TextLabelC["Position"] = UDim2.new(0.5, 0, 0.5, 0)

			TextButton["BorderSizePixel"] = 0
			TextButton["TextSize"] = 14
			TextButton["TextColor3"] = Color3.fromRGB(0, 0, 0)
			TextButton["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TextButton["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			TextButton["Size"] = UDim2.new(1, 0, 1, 0)
			TextButton["BackgroundTransparency"] = 1
			TextButton["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextButton["Text"] = [[]]

			Cancel["BorderSizePixel"] = 0
			Cancel["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Cancel["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Cancel["Size"] = UDim2.new(0, 85, 0, 30)
			Cancel["Position"] = UDim2.new(0.7367, 0, 0.7355, 0)
			Cancel["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Cancel["Name"] = [[Cancel]]

			UICorner18["CornerRadius"] = UDim.new(0, 9)

			UIStroke18["Transparency"] = 0.6
			UIStroke18["Color"] = Color3.fromRGB(223, 223, 223)

			TextLabel2["BorderSizePixel"] = 0
			TextLabel2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TextLabel2["TextSize"] = 14
			TextLabel2["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			TextLabel2["TextColor3"] = Color3.fromRGB(255, 0, 0)
			TextLabel2["BackgroundTransparency"] = 1
			TextLabel2["AnchorPoint"] = Vector2.new(0.5, 0.5)
			TextLabel2["Size"] = UDim2.new(1, 0, 1, 0)
			TextLabel2["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextLabel2["Text"] = [[Cancel]]
			TextLabel2["Position"] = UDim2.new(0.5, 0, 0.5, 0)

			TextButton2["BorderSizePixel"] = 0
			TextButton2["TextSize"] = 14
			TextButton2["TextColor3"] = Color3.fromRGB(0, 0, 0)
			TextButton2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TextButton2["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			TextButton2["Size"] = UDim2.new(1, 0, 1, 0)
			TextButton2["BackgroundTransparency"] = 1
			TextButton2["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextButton2["Text"] = [[]]

			Des2["BorderSizePixel"] = 0
			Des2["TextTransparency"] = 0.5
			Des2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Des2["TextSize"] = 10
			Des2["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Des2["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Des2["BackgroundTransparency"] = 1
			Des2["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Des2["Size"] = UDim2.new(0.8, 0, 0.2501, 0)
			Des2["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Des2["Text"] = [[Do you want to confirm?]]
			Des2["Name"] = [[Des]]
			Des2["Position"] = UDim2.new(0.5, 0, 0.43495, 0)

			Title2["BorderSizePixel"] = 0
			Title2["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Title2["TextSize"] = 12
			Title2["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Title2["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Title2["BackgroundTransparency"] = 1
			Title2["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Title2["Size"] = UDim2.new(0.8, 0, 0.2501, 0)
			Title2["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Title2["Text"] = [[Button]]
			Title2["Name"] = [[Title]]
			Title2["Position"] = UDim2.new(0.5, 0, 0.17495, 0)

			local function tweensize(object, target)

				local targetSize = target

				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				local tween = Tw:Create(object, tweenInfo, {Size = targetSize})

				tween:Play()
			end

			local secureConnection

			Buttons["c3"].MouseButton1Down:Connect(function()
				if callback then 
					tweensize(Buttons["bb"], UDim2.new(0, 135, 0, 30))
					if not secure then
						callback()
					else
						ConfirmButton["Visible"] = true


						if secureConnection then
							secureConnection:Disconnect()
						end

						TextButton2.MouseButton1Down:Connect(function()
							tweensize(Cancel, UDim2.new(0, 75, 0, 25))
							task.delay(0.16, function()
								ConfirmButton["Visible"] = false
								tweensize(Cancel, UDim2.new(0, 95, 0, 35))
								task.wait(0.05)
								tweensize(Cancel, UDim2.new(0, 85, 0, 30))
								ConfirmButton["Visible"] = false
							end)
						end)

						secureConnection = TextButton.MouseButton1Down:Connect(function()
							tweensize(Confirm, UDim2.new(0, 75, 0, 25))
							task.delay(0.16, function()
								ConfirmButton["Visible"] = false
								tweensize(Confirm, UDim2.new(0, 95, 0, 35))
								task.wait(0.05)
								tweensize(Confirm, UDim2.new(0, 85, 0, 30))
								callback()
								ConfirmButton["Visible"] = false
							end)
						end)
					end
				end

				task.delay(0.16, function()
					tweensize(Buttons["bb"], UDim2.new(0, 160, 0, 35))
					task.wait(0.05)
					tweensize(Buttons["bb"], UDim2.new(0, 151, 0, 35))
				end)
			end)

			return Buttons
		end

		function Library.Function:CreateSlider(s, info)
			local title = info.Title or "nil"
			local Desc = info.Desc or "nil"
			local Callback = info.Callback or function() end

			local Sliders = {}

			Sliders["a3"] = Instance.new("Frame", GetParent(s))
			Sliders["a3"]["BorderSizePixel"] = 0
			Sliders["a3"]["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
			Sliders["a3"]["Size"] = UDim2.new(0, 151, 0, 35)
			Sliders["a3"]["Position"] = UDim2.new(0.05848, 0, 0, 0)
			Sliders["a3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["a3"]["Name"] = [[Slider]]

			Sliders["a4"] = Instance.new("UIStroke", Sliders["a3"])
			Sliders["a4"]["Transparency"] = 0.6
			Sliders["a4"]["Color"] = Color3.fromRGB(223, 223, 223)

			Sliders["a5"] = Instance.new("UICorner", Sliders["a3"])

			Sliders["a6"] = Instance.new("TextLabel", Sliders["a3"])
			Sliders["a6"]["BorderSizePixel"] = 0
			Sliders["a6"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Sliders["a6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Sliders["a6"]["TextSize"] = 9
			Sliders["a6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Sliders["a6"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["a6"]["BackgroundTransparency"] = 1
			Sliders["a6"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Sliders["a6"]["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			Sliders["a6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["a6"]["Text"] = tostring(title)
			Sliders["a6"]["Name"] = [[Title]]
			Sliders["a6"]["Position"] = UDim2.new(0.4, 0, 0.35, 0)

			Sliders["a7"] = Instance.new("TextLabel", Sliders["a3"])
			Sliders["a7"]["BorderSizePixel"] = 0
			Sliders["a7"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Sliders["a7"]["TextTransparency"] = 0.5
			Sliders["a7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Sliders["a7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Sliders["a7"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["a7"]["BackgroundTransparency"] = 1
			Sliders["a7"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Sliders["a7"]["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			Sliders["a7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["a7"]["Text"] = tostring(Desc)
			Sliders["a7"]["Name"] = [[Des]]
			Sliders["a7"]["Position"] = UDim2.new(0.4, 0, 0.66429, 0)

			if #Sliders["a7"]["Text"] == 0 then
				Sliders["a6"]["Position"] = UDim2.new(0.4, 0, 0.5, 0)
			end

			Sliders["a8"] = Instance.new("CanvasGroup", Sliders["a3"])
			Sliders["a8"]["BorderSizePixel"] = 0
			Sliders["a8"]["BackgroundColor3"] = Color3.fromRGB(213, 213, 213)
			Sliders["a8"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Sliders["a8"]["Size"] = UDim2.new(0.53, 0, 0.15, 0)
			Sliders["a8"]["Position"] = UDim2.new(0.682, 0, 0.329, 0)
			Sliders["a8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["a8"]["Name"] = [[SliderBar]]

			Sliders["a9"] = Instance.new("UICorner", Sliders["a8"])

			Sliders["aa"] = Instance.new("UIStroke", Sliders["a8"])
			Sliders["aa"]["Transparency"] = 0.6
			Sliders["aa"]["Color"] = Color3.fromRGB(223, 223, 223)

			Sliders["ab"] = Instance.new("Frame", Sliders["a8"])
			Sliders["ab"]["BorderSizePixel"] = 0
			Sliders["ab"]["BackgroundColor3"] = Color3.fromRGB(0, 102, 255)
			Sliders["ab"]["Size"] = UDim2.new(0.5, 0, 1, 0)
			Sliders["ab"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["ab"]["Name"] = [[BarValue]]

			Sliders["ac"] = Instance.new("UICorner", Sliders["ab"])

			Sliders["ad"] = Instance.new("TextButton", Sliders["a8"])
			Sliders["ad"]["BorderSizePixel"] = 0
			Sliders["ad"]["TextSize"] = 14
			Sliders["ad"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["ad"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Sliders["ad"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Sliders["ad"]["Size"] = UDim2.new(1, 0, 1, 0)
			Sliders["ad"]["BackgroundTransparency"] = 1
			Sliders["ad"]["Name"] = [[SliderButton]]
			Sliders["ad"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["ad"]["Text"] = [[]]

			Sliders["ae"] = Instance.new("TextBox", Sliders["a3"])
			Sliders["ae"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["ae"]["BorderSizePixel"] = 0
			Sliders["ae"]["TextSize"] = 7
			Sliders["ae"]["Name"] = [[ValueBox]]
			Sliders["ae"]["BackgroundColor3"] = Color3.fromRGB(212, 212, 212)
			Sliders["ae"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Sliders["ae"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Sliders["ae"]["Size"] = UDim2.new(0.1, 0, 0.25, 0)
			Sliders["ae"]["Position"] = UDim2.new(0.89868, 0, 0.65, 0)
			Sliders["ae"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Sliders["ae"]["Text"] = [[50]]
			Sliders["ae"]["BackgroundTransparency"] = 1

			Sliders["af"] = Instance.new("UICorner", Sliders["ae"])

			Sliders["b0"] = Instance.new("UIStroke", Sliders["ae"])
			Sliders["b0"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

			local function updateSlider(value)
				value = math.clamp(value, info.Min, info.Max)
				Sliders["ab"]:TweenSize(UDim2.new((value - info.Min) / (info.Max - info.Min), 0, 1, 0), "Out", "Back", 0.2, true)
				Sliders["ae"].Text = tostring(value)
				Sliders["ae"].Size = UDim2.new(0, Sliders["ae"].TextBounds.X + 4, 0.25, 0)
				Callback(value)
			end

			updateSlider(info.Value or 0)

			Sliders["ae"].FocusLost:Connect(function()
				local value = tonumber(Sliders["ae"].Text) or info.Min
				updateSlider(value)
			end)

			local function move(input)
				local sliderBar = Sliders["a8"]
				local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
				local value = math.floor(relativeX * (info.Max - info.Min) + info.Min)
				updateSlider(value)
			end

			local dragging = false

			Sliders["ad"].InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					move(input)
				end
			end)

			Sliders["ad"].InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					move(input)
				end
			end)

			return Sliders
		end

		function Library.Function:CreateDropdown(s, info)
			local title = info.Title or "nil"
			local desc = info.Desc or "nil"
			local listdesc = info.ListDesc or "Select items"
			local value = info.Value or ""
			local list = info.List
			local callback = info.Callback or function() end
			local multi = info.MultiDropdown or false

			local Dropdowns = {}

			Dropdowns["b1"] = Instance.new("Frame", GetParent(s))
			Dropdowns["b1"]["BorderSizePixel"] = 0
			Dropdowns["b1"]["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
			Dropdowns["b1"]["Size"] = UDim2.new(0, 151, 0, 35)
			Dropdowns["b1"]["Position"] = UDim2.new(0.05848, 0, 0, 0)
			Dropdowns["b1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["b1"]["Name"] = [[Dropdown]]

			Dropdowns["b2"] = Instance.new("UIStroke", Dropdowns["b1"])
			Dropdowns["b2"]["Transparency"] = 0.6
			Dropdowns["b2"]["Color"] = Color3.fromRGB(223, 223, 223)

			Dropdowns["b3"] = Instance.new("UICorner", Dropdowns["b1"])

			Dropdowns["b4"] = Instance.new("TextLabel", Dropdowns["b1"])
			Dropdowns["b4"]["BorderSizePixel"] = 0
			Dropdowns["b4"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Dropdowns["b4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdowns["b4"]["TextSize"] = 9
			Dropdowns["b4"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Dropdowns["b4"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["b4"]["BackgroundTransparency"] = 1
			Dropdowns["b4"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Dropdowns["b4"]["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			Dropdowns["b4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["b4"]["Text"] = tostring(title)
			Dropdowns["b4"]["Name"] = [[Title]]
			Dropdowns["b4"]["Position"] = UDim2.new(0.4, 0, 0.35, 0)

			Dropdowns["b5"] = Instance.new("TextLabel", Dropdowns["b1"])
			Dropdowns["b5"]["BorderSizePixel"] = 0
			Dropdowns["b5"]["TextXAlignment"] = Enum.TextXAlignment.Left
			Dropdowns["b5"]["TextTransparency"] = 0.5
			Dropdowns["b5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdowns["b5"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Dropdowns["b5"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["b5"]["BackgroundTransparency"] = 1
			Dropdowns["b5"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Dropdowns["b5"]["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			Dropdowns["b5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["b5"]["Text"] = tostring(desc)
			Dropdowns["b5"]["Name"] = [[Des]]
			Dropdowns["b5"]["Position"] = UDim2.new(0.4, 0, 0.66429, 0)

			if #Dropdowns["b5"]["Text"] == 0 then
				Dropdowns["b4"]["Position"] = UDim2.new(0.4, 0, 0.5, 0)
			end

			Dropdowns["b6"] = Instance.new("Frame", Dropdowns["b1"])
			Dropdowns["b6"]["BorderSizePixel"] = 0
			Dropdowns["b6"]["BackgroundColor3"] = Color3.fromRGB(213, 213, 213)
			Dropdowns["b6"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Dropdowns["b6"]["Size"] = UDim2.new(0.3, 0, 0.35, 0)
			Dropdowns["b6"]["Position"] = UDim2.new(0.7904, 0, 0.5, 0)
			Dropdowns["b6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["b6"]["Name"] = [[Dropdownlist]]

			Dropdowns["b7"] = Instance.new("UICorner", Dropdowns["b6"])

			Dropdowns["b8"] = Instance.new("UIStroke", Dropdowns["b6"])
			Dropdowns["b8"]["Transparency"] = 0.6
			Dropdowns["b8"]["Color"] = Color3.fromRGB(223, 223, 223)

			Dropdowns["b9"] = Instance.new("TextButton", Dropdowns["b6"])
			Dropdowns["b9"]["BorderSizePixel"] = 0
			Dropdowns["b9"]["TextSize"] = 14
			Dropdowns["b9"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["b9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdowns["b9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			Dropdowns["b9"]["Size"] = UDim2.new(1, 0, 1, 0)
			Dropdowns["b9"]["BackgroundTransparency"] = 1
			Dropdowns["b9"]["Name"] = [[DropdownClick]]
			Dropdowns["b9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["b9"]["Text"] = [[]]

			Dropdowns["38"] = Instance.new("Frame", BackGround)
			Dropdowns["38"]["Visible"] = false
			Dropdowns["38"]["ZIndex"] = 2
			Dropdowns["38"]["BorderSizePixel"] = 0
			Dropdowns["38"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["38"]["Size"] = UDim2.new(1, 0, 1, 0)
			Dropdowns["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["38"]["Name"] = [[DropdownSelect]]
			Dropdowns["38"]["BackgroundTransparency"] = 0.3

			Dropdowns["39"] = Instance.new("Frame", Dropdowns["38"])
			Dropdowns["39"]["BorderSizePixel"] = 0
			Dropdowns["39"]["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
			Dropdowns["39"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Dropdowns["39"]["Size"] = UDim2.new(0, 200, 0, 250)
			Dropdowns["39"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
			Dropdowns["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)

			Dropdowns["3a"] = Instance.new("UICorner", Dropdowns["39"])
			Dropdowns["3a"]["CornerRadius"] = UDim.new(0, 9)

			Dropdowns["3b"] = Instance.new("UIStroke", Dropdowns["39"])
			Dropdowns["3b"]["Transparency"] = 0.6
			Dropdowns["3b"]["Color"] = Color3.fromRGB(223, 223, 223)

			local DropdownSelectList = Instance.new("Frame", Dropdowns["39"])
			DropdownSelectList["BorderSizePixel"] = 0
			DropdownSelectList["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			DropdownSelectList["AnchorPoint"] = Vector2.new(0.5, 0.5)
			DropdownSelectList["Size"] = UDim2.new(0.9, 0, 0.7536, 0)
			DropdownSelectList["Position"] = UDim2.new(0.5, 0, 0.5732, 0)
			DropdownSelectList["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			DropdownSelectList["Name"] = [[List]]

			local DropdownSelectListUICorner = Instance.new("UICorner", DropdownSelectList)
			DropdownSelectListUICorner["CornerRadius"] = UDim.new(0, 9)

			local DropdownSelectListUIStroke = Instance.new("UIStroke", DropdownSelectList)
			DropdownSelectListUIStroke["Transparency"] = 0.6
			DropdownSelectListUIStroke["Color"] = Color3.fromRGB(223, 223, 223)

			local CONTAINER = Instance.new("ScrollingFrame", DropdownSelectList)
			CONTAINER["Active"] = true
			CONTAINER["BorderSizePixel"] = 0
			CONTAINER["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			CONTAINER["Size"] = UDim2.new(1, 0, 0.95488, 0)
			CONTAINER["ScrollBarImageColor3"] = Color3.fromRGB(0, 100, 255)
			CONTAINER["Position"] = UDim2.new(0, 0, 0.04512, 0)
			CONTAINER["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			CONTAINER["ScrollBarThickness"] = 3
			CONTAINER["BackgroundTransparency"] = 1

			local DropdownDes = Instance.new("TextLabel", Dropdowns["39"])
			DropdownDes["BorderSizePixel"] = 0
			DropdownDes["TextTransparency"] = 0.5
			DropdownDes["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			DropdownDes["TextSize"] = 10
			DropdownDes["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			DropdownDes["TextColor3"] = Color3.fromRGB(0, 0, 0)
			DropdownDes["BackgroundTransparency"] = 1
			DropdownDes["AnchorPoint"] = Vector2.new(0.5, 0.5)
			DropdownDes["Size"] = UDim2.new(0.8, 0, 0.2501, 0)
			DropdownDes["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			DropdownDes["Text"] = [[Description Dropdown]]
			DropdownDes["Name"] = [[Des]]
			DropdownDes["Position"] = UDim2.new(0.5, 0, 0.12295, 0)

			local DropdownTitle = Instance.new("TextLabel", Dropdowns["39"])
			DropdownTitle["BorderSizePixel"] = 0
			DropdownTitle["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			DropdownTitle["TextSize"] = 12
			DropdownTitle["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			DropdownTitle["TextColor3"] = Color3.fromRGB(0, 0, 0)
			DropdownTitle["BackgroundTransparency"] = 1
			DropdownTitle["AnchorPoint"] = Vector2.new(0.5, 0.5)
			DropdownTitle["Size"] = UDim2.new(0.8, 0, 0.12205, 0)
			DropdownTitle["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			DropdownTitle["Text"] = [[Dropdown]]
			DropdownTitle["Name"] = [[Title]]
			DropdownTitle["Position"] = UDim2.new(0.5, 0, 0.07897, 0)

			Dropdowns["70"] = Instance.new("TextButton", Dropdowns["39"])
			Dropdowns["70"]["BorderSizePixel"] = 0
			Dropdowns["70"]["TextSize"] = 14
			Dropdowns["70"]["TextColor3"] = Color3.fromRGB(255, 0, 0)
			Dropdowns["70"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdowns["70"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Dropdowns["70"]["Size"] = UDim2.new(0, 32, 0, 32)
			Dropdowns["70"]["BackgroundTransparency"] = 1
			Dropdowns["70"]["Name"] = [[X]]
			Dropdowns["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["70"]["Text"] = [[X]]
			Dropdowns["70"]["Position"] = UDim2.new(0.8375, 0, 0.008, 0)

			local itemslist = {}
			local selectedItem

			function itemslist:Clear()
				for _, child in ipairs(CONTAINER:GetChildren()) do
					if child:IsA("Frame") then
						child:Destroy()
					end
				end

				selectedItem = nil
				Dropdowns["ba"]["Text"] = ""
			end

			function itemslist:AddList(text, index)
				local item = {}

				item["40"] = Instance.new("Frame", CONTAINER)
				item["40"]["BorderSizePixel"] = 0
				item["40"]["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
				item["40"]["Size"] = UDim2.new(0, 150, 0, 20)
				item["40"]["Position"] = UDim2.new(0.08333, 0, 0, 0)
				item["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
				item["40"]["Name"] = [[Select]]

				item["41"] = Instance.new("UIStroke", item["40"])
				item["41"]["Transparency"] = 0.6
				item["41"]["Color"] = Color3.fromRGB(223, 223, 223)

				item["42"] = Instance.new("UICorner", item["40"])
				item["42"]["CornerRadius"] = UDim.new(0, 9)

				item["43"] = Instance.new("TextLabel", item["40"])
				item["43"]["BorderSizePixel"] = 0
				item["43"]["TextTransparency"] = 0.5
				item["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				item["43"]["TextSize"] = 11
				item["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
				item["43"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
				item["43"]["BackgroundTransparency"] = 1
				item["43"]["Size"] = UDim2.new(1, 0, 1, 0)
				item["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
				item["43"]["Text"] = tostring(text)

				item["44"] = Instance.new("Frame", item["40"])
				item["44"]["BorderSizePixel"] = 0
				item["44"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				item["44"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
				item["44"]["Size"] = UDim2.new(0, 10, 0, 10)
				item["44"]["Position"] = UDim2.new(0.95, 0, 0.5, 0)
				item["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
				item["44"]["Name"] = [[tickback]]

				item["45"] = Instance.new("UICorner", item["44"])
				item["45"]["CornerRadius"] = UDim.new(1, 0)

				item["46"] = Instance.new("Frame", item["44"])
				item["46"]["BorderSizePixel"] = 0
				item["46"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
				item["46"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
				item["46"]["Size"] = UDim2.new(0.8, 0, 0.8, 0)
				item["46"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
				item["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
				item["46"]["Name"] = [[tick]]
				item["46"]["BackgroundTransparency"] = 0.5

				item["47"] = Instance.new("UICorner", item["46"])
				item["47"]["CornerRadius"] = UDim.new(1, 0)

				item["48"] = Instance.new("UIStroke", item["44"])
				item["48"]["Transparency"] = 0.6
				item["48"]["Color"] = Color3.fromRGB(223, 223, 223)

				item["49"] = Instance.new("TextButton", item["40"])
				item["49"]["BorderSizePixel"] = 0
				item["49"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
				item["49"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
				item["49"]["Size"] = UDim2.new(1, 0, 1, 0)
				item["49"]["Text"] = ""
				item["49"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
				item["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
				item["49"]["Name"] = [[tick]]
				item["49"]["BackgroundTransparency"] = 1

				local selectedItems = {}
				item["49"].MouseButton1Down:Connect(function()
					if multi then
						if selectedItems[index] then
							selectedItems[index]["46"].BackgroundTransparency = 0.5
							selectedItems[index]["46"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							selectedItems[index] = nil
						else
							selectedItems[index] = item
							item["46"].BackgroundColor3 = Color3.fromRGB(0, 102, 255)
							item["46"].BackgroundTransparency = 0
						end

						local selectedTexts = {}
						for _, selectedItem in pairs(selectedItems) do
							table.insert(selectedTexts, selectedItem["43"].Text)
						end
						Dropdowns["ba"]["Text"] = table.concat(selectedTexts, ", ")
						callback(Dropdowns["ba"]["Text"])
					else
						if selectedItem then
							selectedItem["46"].BackgroundTransparency = 0.5
							selectedItem["46"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						end
						selectedItem = item
						value = text
						Dropdowns["ba"]["Text"] = text
						callback(text)

						item["46"].BackgroundColor3 = Color3.fromRGB(0, 102, 255)
						item["46"].BackgroundTransparency = 0
					end
				end)

				if text == value then
					selectedItem = item
					item["46"].BackgroundColor3 = Color3.fromRGB(0, 102, 255)
					item["46"].BackgroundTransparency = 0
				end

				item["4a"] = Instance.new("UICorner", item["49"])
				item["4a"]["CornerRadius"] = UDim.new(1, 0)

				delay(0,function()
					Dropdowns["ba"]["Text"] = value or ""
					callback(value or "")
				end)
			end

			for i, v in ipairs(list) do
				itemslist:AddList(v, i)
			end

			Dropdowns["49"] = Instance.new("UIListLayout", CONTAINER)
			Dropdowns["49"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
			Dropdowns["49"]["Padding"] = UDim.new(0, 8)
			Dropdowns["49"]["SortOrder"] = Enum.SortOrder.LayoutOrder

			Dropdowns["49"]:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				CONTAINER.CanvasSize = UDim2.new(0, 0, 0, Dropdowns["49"].AbsoluteContentSize.Y+5)
			end)

			local function tweensize(object, target)

				local targetSize = target

				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				local tween = Tw:Create(object, tweenInfo, {Size = targetSize})

				tween:Play()
			end

			local function tweenTransparency(object, targetTransparency)
				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local tween = Tw:Create(object, tweenInfo, {BackgroundTransparency = targetTransparency})
				tween:Play()
			end

			Dropdowns["b9"].MouseButton1Down:Connect(function()
				tweensize(Dropdowns["b1"], UDim2.new(0, 135, 0, 30))
				Dropdowns["38"]["Visible"] = true  
				task.delay(0.16, function()
					tweensize(Dropdowns["b1"], UDim2.new(0, 160, 0, 35))
					task.wait(0.05)
					tweensize(Dropdowns["b1"], UDim2.new(0, 151, 0, 35))
				end)
			end)

			Dropdowns["70"].MouseButton1Click:Connect(function()
				Dropdowns["38"]["Visible"] = false
			end)

			DropdownDes["Text"] = tostring(listdesc)

			Dropdowns["ba"] = Instance.new("TextLabel", Dropdowns["b6"])
			Dropdowns["ba"]["TextWrapped"] = true
			Dropdowns["ba"]["BorderSizePixel"] = 0
			Dropdowns["ba"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Dropdowns["ba"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			Dropdowns["ba"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["ba"]["BackgroundTransparency"] = 1
			Dropdowns["ba"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			Dropdowns["ba"]["Size"] = UDim2.new(0.8, 0, 1, 0)
			Dropdowns["ba"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			Dropdowns["ba"]["Text"] = ""
			Dropdowns["ba"]["Name"] = [[SelectDropdown]]
			Dropdowns["ba"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

			return itemslist
		end

		function Library.Function:CreateTextBox(s, info)

			local title = info.Title or "nil"
			local desc = info.Desc or "nil"
			local value = info.Value or ""
			local callback = info.Callback or function() end

			local TextBox = {}

			TextBox["c9"] = Instance.new("Frame", GetParent(s))
			TextBox["c9"]["BorderSizePixel"] = 0
			TextBox["c9"]["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
			TextBox["c9"]["Size"] = UDim2.new(0, 151, 0, 35)
			TextBox["c9"]["Position"] = UDim2.new(0.05848, 0, 0, 0)
			TextBox["c9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["c9"]["Name"] = [[TextBox]]

			TextBox["ca"] = Instance.new("UIStroke", TextBox["c9"])
			TextBox["ca"]["Transparency"] = 0.6
			TextBox["ca"]["Color"] = Color3.fromRGB(223, 223, 223)

			TextBox["cb"] = Instance.new("UICorner", TextBox["c9"])

			TextBox["cc"] = Instance.new("TextLabel", TextBox["c9"])
			TextBox["cc"]["BorderSizePixel"] = 0
			TextBox["cc"]["TextXAlignment"] = Enum.TextXAlignment.Left
			TextBox["cc"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TextBox["cc"]["TextSize"] = 9
			TextBox["cc"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			TextBox["cc"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["cc"]["BackgroundTransparency"] = 1
			TextBox["cc"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			TextBox["cc"]["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			TextBox["cc"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["cc"]["Text"] = tostring(title)
			TextBox["cc"]["Name"] = [[Title]]
			TextBox["cc"]["Position"] = UDim2.new(0.4, 0, 0.35, 0)

			TextBox["cd"] = Instance.new("TextLabel", TextBox["c9"])
			TextBox["cd"]["BorderSizePixel"] = 0
			TextBox["cd"]["TextXAlignment"] = Enum.TextXAlignment.Left
			TextBox["cd"]["TextTransparency"] = 0.5
			TextBox["cd"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			TextBox["cd"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			TextBox["cd"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["cd"]["BackgroundTransparency"] = 1
			TextBox["cd"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			TextBox["cd"]["Size"] = UDim2.new(0.7, 0, 0.7, 0)
			TextBox["cd"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["cd"]["Text"] = tostring(desc)
			TextBox["cd"]["Name"] = [[Des]]
			TextBox["cd"]["Position"] = UDim2.new(0.4, 0, 0.66429, 0)

			if #TextBox["cd"]["Text"] == 0 then
				TextBox["cc"]["Position"] = UDim2.new(0.4, 0, 0.5, 0)
			end

			TextBox["ce"] = Instance.new("TextBox", TextBox["c9"])
			TextBox["ce"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["ce"]["BorderSizePixel"] = 0
			TextBox["ce"]["TextSize"] = 7
			TextBox["ce"]["Name"] = [[ValueBox]]
			TextBox["ce"]["BackgroundColor3"] = Color3.fromRGB(212, 212, 212)
			TextBox["ce"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
			TextBox["ce"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
			TextBox["ce"]["Size"] = UDim2.new(0.26668, 0, 0.45671, 0)
			TextBox["ce"]["Position"] = UDim2.new(0.815, 0, 0.5, 0)
			TextBox["ce"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			TextBox["ce"]["BackgroundTransparency"] = 1
			TextBox["ce"]["Text"] = value

			TextBox["cf"] = Instance.new("UICorner", TextBox["ce"])

			TextBox["d0"] = Instance.new("UIStroke", TextBox["ce"])
			TextBox["d0"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

			TextBox["ce"].FocusLost:Connect(function()
				if value then
					if #TextBox["ce"]["Text"] > 0 then
						pcall(callback,TextBox["ce"]["Text"])
					end
				end
			end)
			delay(.1,function()
				if value then
					if #TextBox["ce"]["Text"] > 0 then
						pcall(callback,TextBox["ce"]["Text"])
					end
				end
			end)
		end

		return Library.Function
	end

	UIListLayout2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout2.AbsoluteContentSize.Y+5)
	end)

	return Library.Page
end

local AUI = {}

AUI[1] = Instance.new("Frame", Patinum)
AUI[1]["BorderSizePixel"] = 0
AUI[1]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
AUI[1]["AnchorPoint"] = Vector2.new(0.5, 0.5)
AUI[1]["Size"] = UDim2.new(0, 25, 0, 309)
AUI[1]["Position"] = UDim2.new(0.9734, 0, 0.57072, 0)
AUI[1]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
AUI[1]["Name"] = [[NotificationList]]
AUI[1]["BackgroundTransparency"] = 1

AUI[2] = Instance.new("UIListLayout", AUI[1])
AUI[2]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
AUI[2]["Padding"] = UDim.new(0, 8)
AUI[2]["VerticalAlignment"] = Enum.VerticalAlignment.Center
AUI[2]["SortOrder"] = Enum.SortOrder.LayoutOrder

function Library:Notify(a)
	local Time = a.Time

	local notify = Instance.new("CanvasGroup", AUI[1])
	notify["BorderSizePixel"] = 0
	notify["BackgroundColor3"] = Color3.fromRGB(242, 242, 242)
	notify["Size"] = UDim2.new(0, 0, 0, 50)
	notify["BorderColor3"] = Color3.fromRGB(0, 0, 0)

	local UICorner = Instance.new("UICorner", notify)
	UICorner["CornerRadius"] = UDim.new(0, 9)

	local UIStroke = Instance.new("UIStroke", notify)
	UIStroke["Transparency"] = 0.6
	UIStroke["Color"] = Color3.fromRGB(223, 223, 223)

	local textList = Instance.new("Frame", notify)
	textList["BorderSizePixel"] = 0
	textList["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	textList["Size"] = UDim2.new(1, 0, 1, 0)
	textList["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	textList["Name"] = "TextList"

	local UIListLayout = Instance.new("UIListLayout", textList)
	UIListLayout["Padding"] = UDim.new(0, 8)
	UIListLayout["VerticalAlignment"] = Enum.VerticalAlignment.Center
	UIListLayout["SortOrder"] = Enum.SortOrder.LayoutOrder
	UIListLayout["FillDirection"] = Enum.FillDirection.Horizontal

	local textFrame = Instance.new("Frame", textList)
	textFrame["BorderSizePixel"] = 0
	textFrame["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	textFrame["Size"] = UDim2.new(0, 154, 0, 50)
	textFrame["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	textFrame["Name"] = "Text"
	textFrame["BackgroundTransparency"] = 1

	local title = Instance.new("TextLabel", textFrame)
	title["BorderSizePixel"] = 0
	title["TextXAlignment"] = Enum.TextXAlignment.Left
	title["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	title["TextSize"] = 13
	title["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	title["TextColor3"] = Color3.fromRGB(0, 0, 0)
	title["BackgroundTransparency"] = 1
	title["Size"] = UDim2.new(0, 154, 0, 15)
	title["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	title["Text"] = a.Title
	title["Name"] = "Title"
	title["Position"] = UDim2.new(0, 0, 0.16, 0)

	local desc = Instance.new("TextLabel", textFrame)
	desc["BorderSizePixel"] = 0
	desc["TextXAlignment"] = Enum.TextXAlignment.Left
	desc["TextTransparency"] = 0.5
	desc["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	desc["TextSize"] = 11
	desc["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	desc["TextColor3"] = Color3.fromRGB(0, 0, 0)
	desc["BackgroundTransparency"] = 1
	desc["Size"] = UDim2.new(0, 154, 0, 15)
	desc["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	desc["Text"] = a.Desc
	desc["Name"] = "Desc"
	desc["Position"] = UDim2.new(0, 0, 0.5, 0)

	local logo = Instance.new("Frame", textList)
	logo["BorderSizePixel"] = 0
	logo["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	logo["Size"] = UDim2.new(0, 45, 0, 50)
	logo["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	logo["Name"] = "Logo"
	logo["LayoutOrder"] = -1

	local logoStroke = Instance.new("UIStroke", logo)
	logoStroke["Transparency"] = 0.6
	logoStroke["Color"] = Color3.fromRGB(223, 223, 223)

	local logoImage = Instance.new("ImageLabel", logo)
	logoImage["BorderSizePixel"] = 0
	logoImage["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	logoImage["ImageTransparency"] = 0.5
	logoImage["ImageColor3"] = Color3.fromRGB(17, 17, 17)
	logoImage["AnchorPoint"] = Vector2.new(0.5, 0.5)
	logoImage["Image"] = [[rbxassetid://2790460444]]
	logoImage["Size"] = UDim2.new(0.8, 0, 0.65, 0)
	logoImage["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	logoImage["BackgroundTransparency"] = 1
	logoImage["Position"] = UDim2.new(0.5, 0, 0.5, 0)

	local timeBar = Instance.new("Frame", notify)
	timeBar["BorderSizePixel"] = 0
	timeBar["BackgroundColor3"] = Color3.fromRGB(0, 102, 255)
	timeBar["AnchorPoint"] = Vector2.new(0, 0.5)
	timeBar["Size"] = UDim2.new(1, 0, 0, 3)
	timeBar["Position"] = UDim2.new(0, 0, 0.9625, 0)
	timeBar["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	timeBar["Name"] = "Time"

	local closeButton = Instance.new("TextButton", notify)
	closeButton["BorderSizePixel"] = 0
	closeButton["TextColor3"] = Color3.fromRGB(0, 0, 0)
	closeButton["BackgroundColor3"] = Color3.fromRGB(255, 0, 0)
	closeButton["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	closeButton["AnchorPoint"] = Vector2.new(0.5, 0.5)
	closeButton["Size"] = UDim2.new(0, 10, 0, 10)
	closeButton["Name"] = "Close"
	closeButton["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	closeButton["Text"] = "X"
	closeButton["Position"] = UDim2.new(0.95894, 0, 0.15, 0)
	closeButton["BackgroundTransparency"] = 1

	local TweenService = game:GetService("TweenService")
	local function TweenS(instance, targetSize)
		local tween = TweenService:Create(instance, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { Size = targetSize })
		tween:Play()
		return tween
	end

	TweenS(notify, UDim2.new(0, 250, 0, 50))

	task.spawn(function()
		local totalDuration = Time
		while Time > 0 do
			wait(1)
			Time = Time - 1
			local targetSize = UDim2.new(Time / totalDuration, 0, 0, 3)
			TweenS(timeBar, targetSize)
		end
		wait(.2)
		TweenS(notify, UDim2.new(0, 0, 0, 50))
		wait(.5)
		notify:Destroy()
	end)

	closeButton.MouseButton1Click:Connect(function()
		TweenS(timeBar, UDim2.new(0, 0, 0, 3))
		Time = 0
	end)
end

return Library