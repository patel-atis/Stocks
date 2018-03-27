import React from 'react';

const alpha = require('alphavantage')({ key: 'GQPMNMMW4CDIAYQK' });

alpha.data.intraday(`msft`).then(data => {
  console.log(data);
});
