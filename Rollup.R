# annual revenue for conclusion that customers are beginning to prefer bigger pizzas;
apply(revenue_cube_pizza_components, c("Pizza_Size"),
      FUN=function(x) {return(sum(x, na.rm=TRUE))})
