import React, { Fragment } from 'react';

const Spinner = () => {
  return (
    <Fragment>
      <img
        src='https://ubuntu-ec2-s3.s3-us-west-1.amazonaws.com/scp/images/loading-spinner.gif'
        className='m-auto d-block'
        style={{ width: '300px' }}
        alt='Loading...'
      />
    </Fragment>
  );
};

export default Spinner;
