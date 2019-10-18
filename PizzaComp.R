
# Build up a cube for pizza components
revenue_cube_pizza_components <- 
  tapply(orders$Profit, 
         orders[,c("Pizza_Size","Topping","Dough","Cheese_Type","month", "year", "storeloc")],
         FUN=function(x){return(sum(x))})

revenue_cube_pizza_components
dimnames(revenue_cube_pizza_components)
