# Welcome to Stocks!

This is a stock trading social media application. Users can follow one another and have a portfolio of assets.

------

### Tables:

##### Users
  Represents users who create an account on this site

##### Posts
  Represents microposts by users, must be about a stock that is tagged

#### Stocks
  Represents each tradeable assets

##### Ledgers
  Represents who is 'holding' each asset and when they added/dropped it

##### Relationships
  creates user Relationships through following and followed


### Static pages
"home" : welcome page when not logged in

"alternatives" : Supposed to explain equity investment alternatives

"issues": Bug reporting page

### External Sourcing

Stocks is currently seeded with the 100 most active stocks (name and ticker) according to WSJ.

Stocks/index created with 'StockList' & "StockRow" React components

Pulling stock data from IEX api
