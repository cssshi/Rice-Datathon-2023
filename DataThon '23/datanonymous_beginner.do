//Heat map of FDA Certified Mammogram Facilities

//import data from CSV file 
import delimited "/Users/christophershi/Desktop/DataThon '23/export.csv", varnames(1) encoding(UTF-8) clear

br

//create new categorical variable for all 50 states
encode state, generate(state_cat)
sort state_cat //sort facilities by state

//remove Puerto Rico (since not continguous)
drop if ustrregexm(state,"PR")
br

//state_cat count of facilities
tab state_cat

//zip_code
encode zipcode, generate(zipcode_cat)

drop abbrev_zipcode
gen abbrev_zipcode = substr(zipcode, 1, 5)
encode abbrev_zipcode, gen(abbrev_zipcode_cat)

gen abbrev_zipcode_count = .
ssc install heatplot
ssc install hexplot

gen three_zip = substr(zipcode, 1, 3)
encode three_zip, gen(three_zip_cat)
tab three_zip_cat

