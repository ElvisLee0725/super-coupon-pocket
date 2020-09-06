import React, { useState, useEffect } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import Spinner from './Spinner';
import { uploadUserImage } from '../actions/auth';

const Profile = ({ user, loading, uploadUserImage }) => {
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

  return loading || !user ? (
    <Spinner />
  ) : (
    <div className='box-layout'>
      <div className='box-layout__box'>
        <form encType='multipart/form-data' id='profile-image-upload'>
          <div className='form-group'>
            <label htmlFor='profile-image-input'>
              <img
                src={
                  user.profile_image
                    ? `/images/userProfile/${user.profile_image}`
                    : user.avatar_url
                }
                className='mb-4 rounded-circle profile-image'
                alt='User Avatar'
              />
            </label>

            <input
              id='profile-image-input'
              type='file'
              onChange={e => onFileChange(e)}
            />
          </div>
        </form>

        <h3>{user.name}</h3>
        <h5>{user.email}</h5>
      </div>
    </div>
  );
};

Profile.propTypes = {
  user: PropTypes.object.isRequired,
  loading: PropTypes.bool.isRequired,
  uploadUserImage: PropTypes.func.isRequired
};

const mapStateToProps = state => ({
  user: state.auth.user,
  loading: state.auth.loading
});

export default connect(mapStateToProps, { uploadUserImage })(Profile);
