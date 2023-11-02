library(data.table)
options(jupyter.rich_display = F)
options(repr.matrix.max.cols = 30, repr.matrix.max.rows = 200)
orders <- fread("/anvil/projects/tdm/data/restaurant/orders.csv")
vendors <- fread("/anvil/projects/tdm/data/restaurant/vendors.csv")

head(vendors$vendor_tag_name)
grep("Fries", vendors$vendor_tag_name)
grepl("Fries", vendors$vendor_tag_name)
a_1 <- subset(vendors, grepl("Fries", vendor_tag_name))
b_1 <- vendors[grep("Fries", vendors$vendor_tag_name),]
dim(a_1)
dim(b_1)
head(a_1)
head(b_1)

table(vendors$delivery_charge)
prop.table(table(a_3$delivery_charge))

a_3 <- subset (vendors, vendor_category_id == 2)
head(a_3)
prop.table(table(a_3$delivery_charge))
b_3 <- subset (vendors, vendor_category_id == 3)
prop.table(table(b_3$delivery_charge))

tapply(vendors$delivery_charge, vendors$vendor_category_id, table)
tapply(vendors$delivery_charge, vendors$vendor_category_id, function(x) {prop.table(table(x))})

sapply(tapply(vendors$delivery_charge, vendors$vendor_category_id, table), prop.table, simplify=FALSE)