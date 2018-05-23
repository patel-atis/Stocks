import PropTypes from 'prop-types';
import React from 'react';
import StockRow from './StockRow';

export default class StockList extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {

    const rows = []

    this.props.stocks.forEach((item) => {

      rows.push(<StockRow key={item.id} company={item.company} ticker={item.ticker} price={item.price} dividend={item.dividend} type={item.type} rating={item.rating}/>)

    });

    return(
      <table>
        <thead>
          <tr>
            <th>Company</th>
            <th>Ticker</th>
            <th>Price</th>
            <th>High</th>
            <th>Low</th>
            <th>Quantity</th>
          </tr>
        </thead>
        <tbody>
          {rows}
        </tbody>
      </table>
    )
  }
}
