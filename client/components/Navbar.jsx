import React, { Fragment } from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import { logout } from '../actions/auth';
import PropTypes from 'prop-types';

const Navbar = ({ logout, isAuthenticated }) => {
  const authNavbar = (
    <nav className='navbar sticky-top navbar-expand-lg navbar-light navbar-color'>
      <div className='container'>
        <button
          className='navbar-toggler'
          type='button'
          data-toggle='collapse'
          data-target='#SCP-navbar'
          aria-controls='SCP-navbar'
          aria-expanded='false'
          aria-label='Toggle navigation'
        >
          <span className='navbar-toggler-icon'></span>
        </button>
        <div className='collapse navbar-collapse' id='SCP-navbar'>
          <Link className='navbar-brand mr-auto' to='/'>
            <div
              style={{ width: '100px' }}
              data-toggle='collapse'
              data-target='.navbar-collapse.show'
            >
              <img
                src='https://ubuntu-ec2-s3.s3-us-west-1.amazonaws.com/scp/images/scp-logo.png'
                className='img-fluid'
                alt='SCP Logo'
              />
            </div>
          </Link>

          <ul className='navbar-nav'>
            <li data-toggle='collapse' data-target='.navbar-collapse.show'>
              <Link className='nav-item nav-link' to='/'>
                <i className='fas fa-tachometer-alt'></i>&nbsp;Dashboard
              </Link>
            </li>
            <li data-toggle='collapse' data-target='.navbar-collapse.show'>
              <Link className='nav-item nav-link' to='/profile'>
                <i className='fas fa-user'></i>&nbsp;Profile
              </Link>
            </li>
            <li>
              <a onClick={logout} className='nav-item nav-link' href='#!'>
                <i className='fas fa-sign-out-alt'></i>&nbsp;Logout
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  );

  return <Fragment>{isAuthenticated && authNavbar}</Fragment>;
};

Navbar.propTypes = {
  logout: PropTypes.func.isRequired,
  isAuthenticated: PropTypes.bool
};

const mapStateToProps = state => ({
  isAuthenticated: state.auth.isAuthenticated
});

export default connect(mapStateToProps, { logout })(Navbar);
