state_table <- 
  data.frame(key=c("CA", "NY", "WA", "ON", "QU"),
             name=c("California", "new York", "Washington", "Ontario", "Quebec"),
             country=c("USA", "USA", "USA", "Canada", "Canada"))

month_table <- 
  data.frame(key=1:12,
             desc=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
             quarter=c("Q1","Q1","Q1","Q2","Q2","Q2","Q3","Q3","Q3","Q4","Q4","Q4"))

prod_table <- 
  data.frame(key=c("Printer", "Tablet", "Laptop"),
             price=c(225, 570, 1120))

# Function to generate the Sales table
gen_sales <- function(no_of_recs) {
  
  # Generate transaction data randomly
  loc <- sample(state_table$key, no_of_recs, 
                replace=T, prob=c(2,2,1,1,1))
  time_month <- sample(month_table$key, no_of_recs, replace=T)
  time_year <- sample(c(2012, 2013), no_of_recs, replace=T)
  prod <- sample(prod_table$key, no_of_recs, replace=T, prob=c(1, 3, 2))
  unit <- sample(c(1,2), no_of_recs, replace=T, prob=c(10, 3))
  amount <- unit*prod_table[prod,]$price
  
  sales <- data.frame(month=time_month,
                      year=time_year,
                      loc=loc,
                      prod=prod,
                      unit=unit,
                      amount=amount)
  
  # Sort the records by time order
  sales <- sales[order(sales$year, sales$month),]
  row.names(sales) <- NULL
  return(sales)
}

# Now create the sales fact table
sales_fact <- gen_sales(500)
# Build up a cube
revenue_cube <- 
  tapply(sales_fact$amount, 
         sales_fact[,c("prod", "month", "year", "loc")], 
         FUN=function(x){return(sum(x))})

# Showing the cells of the cude
revenue_cube

dimnames(revenue_cube)

var<-revenue_cube[c("Tablet","Laptop"), 
             c("1","2","3"), 
             ,
             c("CA","NY")]
var

# Look at a few records
head(sales_fact)