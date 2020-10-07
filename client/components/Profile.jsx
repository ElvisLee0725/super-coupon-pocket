import React, { useState, useEffect, Fragment } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import Spinner from './Spinner';
import { uploadUserImage } from '../actions/auth';
import { getPersonalHistory } from '../actions/history';

const Profile = ({
  user,
  loading,
  coupons,
  totalCouponsCount,
  totalUsedCouponsCount,
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

  // const usedCount = coupons.filter((coupon) => coupon.used).length;
  // const useRate = (usedCount / coupons.length) * 100;

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
    </Fragment>
  );
};

Profile.propTypes = {
  loading: PropTypes.bool.isRequired,
  coupons: PropTypes.array.isRequired,
  uploadUserImage: PropTypes.func.isRequired,
  getPersonalHistory: PropTypes.func.isRequired
};

const mapStateToProps = state => ({
  user: state.auth.user,
  loading: state.auth.loading,
  coupons: state.coupon.coupons,
  totalCouponsCount: state.history.totalCouponsCount,
  totalUsedCouponsCount: state.history.totalUsedCouponsCount
});

export default connect(mapStateToProps, {
  uploadUserImage,
  getPersonalHistory
})(Profile);
