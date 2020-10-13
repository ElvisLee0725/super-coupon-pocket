import React, { useState, useEffect, Fragment } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import Spinner from './Spinner';
import { uploadUserImage } from '../actions/auth';
import { getPersonalHistory } from '../actions/history';
import { setAlert } from '../actions/alert';
import axios from 'axios';

const Profile = ({
  user,
  loading,
  totalCouponsCount,
  totalUsedCouponsCount,
  setAlert,
  uploadUserImage,
  getPersonalHistory
}) => {
  const [profileImg, setFile] = useState(null);

  const onFileChange = e => {
    setFile(e.target.files[0]);
  };

  useEffect(() => {
    // Only upload user's image when profileImg is set up. No need a submit button
    if (profileImg) {
      uploadUserImage(profileImg);
    }
  }, [profileImg]);

  useEffect(() => {
    getPersonalHistory();
  }, []);

  const [passwordData, setPasswordData] = useState({
    curPassword: '',
    newPassword: '',
    rePassword: ''
  });

  const { curPassword, newPassword, rePassword } = passwordData;

  const handlePasswordChange = e => {
    setPasswordData({ ...passwordData, [e.target.name]: e.target.value });
  };

  const passwordUpdate = async e => {
    e.preventDefault();
    if (newPassword !== rePassword) {
      setAlert('New password does not match', 'danger');
    } else {
      const config = { headers: { 'Content-Type': 'application/json' } };
      const body = JSON.stringify({
        curPassword,
        newPassword
      });
      try {
        const res = await axios.patch('/api/users/new-password', body, config);
        setAlert(res.data.msg, 'success');
        setPasswordData({
          curPassword: '',
          newPassword: '',
          rePassword: ''
        });

        $('#passwordChangeForm').collapse('hide');
      } catch (err) {
        const errors = err.response.data.error;
        if (errors) {
          errors.forEach(error => {
            setAlert(error.msg, 'danger');
          });
        }
      }
    }
  };

  return loading || !user ? (
    <Spinner />
  ) : (
    <Fragment>
      <div className='container page-container'>
        <Link to='/dashboard' style={{ color: '#000' }}>
          <i className='fas fa-chevron-left'></i> &nbsp;Back
        </Link>
        <div className='text-center mt-4'>
          <form encType='multipart/form-data' id='profile-image-upload'>
            <label htmlFor='profile-image-input'>
              <div className='profile-image__frame rounded-circle'>
                <img
                  src={
                    user.profile_image
                      ? `https://ubuntu-ec2-s3.s3-us-west-1.amazonaws.com/${user.profile_image}`
                      : user.avatar_url
                  }
                  className='profile-image'
                  alt='User Avatar'
                />

                <input
                  id='profile-image-input'
                  type='file'
                  onChange={e => onFileChange(e)}
                />

                <div className='profile-image__overlay'>
                  <div>
                    <i className='fas fa-camera fa-3x'></i>
                    <br />
                    <span style={{ fontSize: '0.8rem' }}>
                      Use Square Image <br />
                      Max Size: 1 MB
                    </span>
                  </div>
                </div>
              </div>
            </label>
          </form>

          <h3 className='my-4'>{user.name}</h3>
          <h5 className='mb-5'>{user.email}</h5>

          <a
            className='btn btn-themeBlue'
            data-toggle='collapse'
            href='#passwordChangeForm'
            role='button'
            aria-expanded='false'
            aria-controls='passwordChangeForm'
          >
            Change Password
          </a>

          <div className='collapse' id='passwordChangeForm'>
            <form
              className='my-3 mx-auto profile-change-pw__form'
              onSubmit={e => passwordUpdate(e)}
            >
              <div className='form-group'>
                <input
                  type='password'
                  className='form-control input-field font-italic'
                  placeholder='Current Password'
                  name='curPassword'
                  value={curPassword}
                  onChange={e => handlePasswordChange(e)}
                />
              </div>
              <div className='form-group'>
                <input
                  type='password'
                  className='form-control input-field font-italic'
                  placeholder='New Password'
                  name='newPassword'
                  value={newPassword}
                  onChange={e => handlePasswordChange(e)}
                />
              </div>
              <div className='form-group'>
                <input
                  type='password'
                  className='form-control input-field font-italic'
                  placeholder='Confirm Password'
                  name='rePassword'
                  value={rePassword}
                  onChange={e => handlePasswordChange(e)}
                />
              </div>
              <button type='submit' className='btn btn-delete btn-block'>
                Update
              </button>
            </form>
          </div>

          <div className='mt-3'>
            <p>Total Coupons: {totalCouponsCount}</p>
            <p>Coupons Used: {totalUsedCouponsCount}</p>
            <p>
              {totalCouponsCount > 0 &&
                `Usage Rate: ${(
                  (totalUsedCouponsCount / totalCouponsCount) *
                  100
                ).toFixed(2)}%`}
            </p>
          </div>
        </div>
      </div>
    </Fragment>
  );
};

Profile.propTypes = {
  loading: PropTypes.bool.isRequired,
  setAlert: PropTypes.func.isRequired,
  uploadUserImage: PropTypes.func.isRequired,
  getPersonalHistory: PropTypes.func.isRequired
};

const mapStateToProps = state => ({
  user: state.auth.user,
  loading: state.auth.loading,
  totalCouponsCount: state.history.totalCouponsCount,
  totalUsedCouponsCount: state.history.totalUsedCouponsCount
});

export default connect(mapStateToProps, {
  setAlert,
  uploadUserImage,
  getPersonalHistory
})(Profile);
