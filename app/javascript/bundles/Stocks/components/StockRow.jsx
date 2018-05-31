import PropTypes from 'prop-types';
import React from 'react';

export default class StockRow extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      price: 0,
      high: 0,
      low: 0,
      quantity: 0,
      isLoaded: false,
      error: null
    };
  }

  //keep calling price getter method
  componentDidMount() {
    this.priceID = setInterval(
      () => this.pricetick(),
      5000
    );
  }

  componentWillUnmount() {
    clearInterval(this.PriceID);
  }

  //this method should get the current price of the current stock from the iex api
  pricetick() {
    const ticker = this.props.ticker
    fetch(`https://api.iextrading.com/1.0/stock/${ticker}/delayed-quote`)
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({
            price: result.delayedPrice,
            high: result.high,
            low: result.low,
            quantity: result.delayedSize,
            isLoaded: true
          });
        },
      )
  }

  render() {
    const {error, isLoaded, price} = this.state;

    if (error) {
      return <tr>whoops: {error.message} </tr>
    } else if (!isLoaded) {
      return <tr>Loading...</tr>
    } else {
      return(
        <tr>
          <td>{this.props.company}</td>
          <td>{this.props.ticker}</td>
          <td>{this.state.quantity}</td>
          <td>${this.state.high}</td>
          <td>${this.state.low}</td>
          <td>${this.state.price}</td>
        </tr>
      )
    }
  }
}
