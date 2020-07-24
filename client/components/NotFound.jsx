import React from 'react';
import { Link } from 'react-router-dom';

const NotFound = () => {
  return (
    <div className='container text-center my-5'>
      <span className='not-found__title font-weight-bold'>Oops!</span>
      <h5 className='not-found__subtitle mb-3'>Error 404: Page Not Found</h5>
      <Link to='/' className='btn btn-themeBlue mt-4'>
        <i className='fas fa-home'></i>&nbsp; GO TO HOMEPAGE
      </Link>
    </div>
  );
};

export default NotFound;
