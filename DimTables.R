# Setup the dimension tables

store_location <- 
  data.frame(store_code=c("CA", "NY", "WA", "ON", "QU"),
             city =c('california city','new york city','washington dc', 'ottawa','montreal'),
             province =c("California", "new York", "Washington", "Ontario", "Quebec"),
             country=c("USA", "USA", "USA", "Canada", "Canada"),
             region= c('North America', 'North America', 'North America', 'North America','North America'))

toppings <- data.frame(topping= c('Tomatoes','Bell Pepper','Onions','Pepproni'), stringsAsFactors = F)

#pizza_size <- data.frame(size= c("Regular", "Small", "Medium", "Large", "Extra Large"), stringsAsFactors = F)

cheese_type <- data.frame(cheese_name= c('Swiss Cheese','Chedder','Mozzarella'), stringsAsFactors = F)

dough <- data.frame(dough_name=c('whole wheat thin','white regular','stuff crust'), stringsAsFactors = F)

month <- data.frame(key=1:12,month =c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

#quantity <- data.frame(no_pizza= c(15,16,17,18,19,20,21,22,23,24,25,26))

pizza_size <- data.frame(size=factor(x=c("Personal", "Small", "Medium", "Large", "Extra_Large"),levels=c("Personal", "Small", "Medium", "Large", "Extra_Large"), ordered = T),
                         price =c(10, 12, 14, 16, 20))


