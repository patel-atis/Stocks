# Welcome to Stocks!

This is a stock trading social media application. Users can follow one another and have a portfolio of assets.

------

##Requirements

  Rails 5.1.5,  

  Ruby 2.4.1,

  PostgreSQL 10.1

##Get up and Running

  Fork and then clone this repository from your terminal like this:

  `
    git clone https://github.com/your-name/Stocks.git
  `

  Then run the following commands to install dependencies and create local database

  `
    bundle install
  `

  and

  `
    rake db:migrate
  `

  hopefully now you can run:

  `
    rails s
  `

  and have a running version of this application running locally.


## Resources:

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
