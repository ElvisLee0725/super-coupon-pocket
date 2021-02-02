import React from 'react';
import { Link } from 'react-router-dom';

const NotFound = () => {
  return (
    <div className='container page-container text-center my-5'>
      <img src='https://ubuntu-ec2-s3.s3-us-west-1.amazonaws.com/scp/images/error-404.png' className='error-img mb-3'/>
      <h5 className='not-found__subtitle mb-3'>Error 404: Page Not Found</h5>
      <Link to='/' className='btn btn-themeBlue mt-4'>
        <i className='fas fa-home'></i>&nbsp; GO TO HOMEPAGE
      </Link>
    </div>
  );
};

export default NotFound;
