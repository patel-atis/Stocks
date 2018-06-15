import ReactOnRails from 'react-on-rails';

import StockRow from '../bundles/Stocks/components/StockRow';
import StockList from '../bundles/Stocks/components/StockList';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  StockRow,
  StockList
});
