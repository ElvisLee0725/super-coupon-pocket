import React, { Fragment, useState } from 'react';
import { Link, Redirect } from 'react-router-dom';
import { connect } from 'react-redux';
import { login, guestLogin } from '../actions/auth';
import PropTypes from 'prop-types';

const Login = ({ login, guestLogin, isAuthenticated }) => {
  const [formData, setFormData] = useState({
    email: '',
    password: ''
  });

  const { email, password } = formData;

  const handleChange = e => {
    // setFormData is like this.setState to set state fields equal to the inputs
    return setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = e => {
    e.preventDefault();
    login(email, password);
  };

  // Redirect to /dashboard if user is logged in
  if (isAuthenticated) {
    return <Redirect to='/dashboard' />;
  }

  return (
    <Fragment>
      <div className='container'>
        <div className='row'>
          <div className='d-none d-md-block col-md-6'>
            <div className='box-layout'>
              <div>
                <h1>Introduction</h1>
                <p className='lead text-justify'>Have you ever got a coupon from one of your favorite stores, and you are excited to use it next time when you have a chance, then, you just totally forget about it?
              What’s even worse is, when you finally recall you got that coupon, it’s after you made your purchase!
              So here comes the Super Coupon Pocket. With this app, you can record all those coupons you ever received and you can easily search and see when it will expire. Just create an account and start saving today!</p>
              </div>
            </div>
          </div>
          <div className='col-12 col-md-6'>
            <div className='box-layout'>
              <div className='box-layout__box'>
                <a className='d-block d-md-none mb-3' data-toggle="modal" data-target="#appIntro">
                  <u>What is this?</u>
                </a>
                <div className="modal fade" id="appIntro" tabIndex="-1" role="dialog" aria-labelledby="appIntro" aria-hidden="true">
                  <div className="modal-dialog" role="document">
                    <div className="modal-content">
                      <div className="modal-header">
                        <h5 className="modal-title" id="appIntro">Introduction</h5>
                        <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div className="modal-body">
                        <p className='lead text-justify'>Have you ever got a coupon from one of your favorite stores, and you are excited to use it next time when you have a chance, then, you just totally forget about it?
                    What’s even worse is, when you finally recall you got that coupon, it’s after you made your purchase!
                    So here comes the Super Coupon Pocket. With this app, you can record all those coupons you ever received and you can easily search and see when it will expire. Just create an account and start saving today!</p>
                      </div>
                      <div className="modal-footer">
                        <button type="button" className="btn btn-themeBlue" data-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </div>
                </div>

                <img
                  src='https://ubuntu-ec2-s3.s3-us-west-1.amazonaws.com/scp/images/scp-logo.png'
                  className='img-fluid mb-5'
                  alt='SCP Logo'
                />

                <form onSubmit={e => handleSubmit(e)}>
                  <div className='form-group form-group--insertIcon insertIcon-left'>
                    <input
                      type='email'
                      className='form-control input-field font-italic'
                      placeholder='Email'
                      name='email'
                      value={email}
                      onChange={e => handleChange(e)}
                      required
                    />
                    <i className='far fa-envelope'></i>
                  </div>
                  <div className='form-group form-group--insertIcon insertIcon-left'>
                    <input
                      type='password'
                      className='form-control input-field font-italic'
                      placeholder='Password'
                      name='password'
                      value={password}
                      onChange={e => handleChange(e)}
                      minLength='6'
                    />
                    <i className='fas fa-lock'></i>
                  </div>
                  <button type='submit' className='btn btn-themeBlue btn-block'>
                  Login
                  </button>
                </form>
                <button
                  className='btn btn-themeBlue btn-block mt-3'
                  onClick={() => guestLogin()}
                >
                Guest login (Demo)
                </button>
                <div className='my-4 font-weight-bold'>OR</div>
                <Link to='/register' className='btn btn-themeBlue btn-block'>
                Sign up
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Fragment>
  );
};

Login.propTypes = {
  login: PropTypes.func.isRequired,
  guestLogin: PropTypes.func.isRequired,
  isAuthenticated: PropTypes.bool
};

const mapStateToProps = state => ({
  isAuthenticated: state.auth.isAuthenticated
});

export default connect(mapStateToProps, { login, guestLogin })(Login);
