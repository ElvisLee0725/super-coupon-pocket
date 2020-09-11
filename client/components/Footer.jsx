import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import moment from 'moment';
import PropTypes from 'prop-types';

const Footer = ({ location }) => {
  const pathMatch =
    location.pathname === '/dashboard' ||
    location.pathname === '/privacy-policy' ||
    location.pathname === '/terms-of-use';
  return (
    <footer
      className='text-center footer py-3'
      style={{
        position: `${pathMatch ? 'relative' : ''}`
      }}
    >
      <span>
        &copy; {moment().format('YYYY')} All Rights Reserved |&nbsp;
        <Link to='/privacy-policy' target='_blank' className='footer-link'>
          Privacy Policy
        </Link>
        &nbsp;|&nbsp;
        <Link to='terms-of-use' target='_blank' className='footer-link'>
          Terms of Use
        </Link>
      </span>
    </footer>
  );
};

Footer.propTypes = {
  location: PropTypes.object.isRequired
};

export default withRouter(Footer);
