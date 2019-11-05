# Function to generate the Sales table
gen_sales <- function(no_of_recs) {
  
  # Generate transaction data randomly
  StoreLocation <- sample(store_location$store_code, no_of_recs, 
                          replace=T, prob=c(2,2,1,1,1))
  
  Month <- sample(profit$key, no_of_recs, replace=T)
  
  Year <- sample(c(2017, 2018), no_of_recs, replace=T)
  
  PizzaSize <- sample(pizza_size$size, no_of_recs, replace=T, prob = c(2,1,1,3,3))
  
  Dough <- sample(dough$dough_name, no_of_recs, replace=T)
  
  CheeseType <- sample(cheese_type$cheese_name, no_of_recs, replace=T)
  
  Toppings <- sample(toppings$topping, no_of_recs, replace=T)
  
  Quantity <- sample(c(1,2,3), no_of_recs, replace=T, prob=c(2, 3, 4))
  
  Profit <- Quantity * pizza_size[PizzaSize,]$price
  
  pizza_sales <- data.frame(storeloc= StoreLocation,
                            month=Month,
                            year=Year,
                            Pizza_Size=PizzaSize,
                            Dough=Dough,
                            Cheese_Type= CheeseType,
                            Topping=Toppings,
                            Quantity= Quantity,
                            Profit= Profit)
  
  # Sort the records by time order
  pizza_sales <- pizza_sales[order(pizza_sales$year, pizza_sales$month),]
  row.names(pizza_sales) <- NULL
  return(pizza_sales)
}


# Now create the sales fact table
orders <- gen_sales(500)

# Look at a few records
head(orders)

