library(eurostat)


estat <- get_eurostat("rd_e_gerdtot", time_format = "raw", stringsAsFactors = FALSE)

estat[estat$unit == "PC_GDP" & estat$sectperf == "BES", "var"] <-"Business sector"
estat[estat$unit == "PC_GDP" & estat$sectperf == "HES", "var"] <-"Higher Education sector"
estat[estat$unit == "PC_GDP" & estat$sectperf == "GOV", "var"] <-"Government sector"
estat[estat$unit == "PC_GDP" & estat$sectperf == "PNP", "var"] <-"Private non-profit sector"


lookup  <- c(AT = "Austria", BE = "Belgium", CZ = "Czech Republic",
             DK = "Denmark", FI = "Finland", FR = "France", DE = "Germany",
             EL = "Greece", HU = "Hungary", HR = "Croatia", IE = "Ireland",
             IT = "Italy", LU = "Luxembourg", NL = "Netherlands",
             PL = "Poland", PT = "Portugal", SK = "Slovakia",
             ES = "Spain", SE = "Sweden", UK = "United Kingdom", EE = "Estonia",
             SI = "Slovenia", BG = "Bulgaria", CY = "Cyprus",
             LT = "Lithuania", LV = "Latvia", MT = "Malta", RO = "Romania")

estat$cou <- lookup[estat$geo]

estat <- estat[complete.cases(estat[,c("cou","var","time","values")]),]
