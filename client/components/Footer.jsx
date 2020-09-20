import React from 'react';
import { Link } from 'react-router-dom';
import moment from 'moment';

const Footer = () => {
  return (
    <footer className='text-center footer py-3'>
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

export default Footer;
