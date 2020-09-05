import React, { useState } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import Spinner from './Spinner';
import { uploadUserImage } from '../actions/auth';

const Profile = ({ user, loading, uploadUserImage }) => {
  const [profileImg, setFile] = useState(null);

  const onFileChange = e => {
    setFile(e.target.files[0]);
  };

  const handleSubmit = e => {
    e.preventDefault();
    uploadUserImage(profileImg);
  };

  return loading || !user ? (
    <Spinner />
  ) : (
    <div className='box-layout'>
      <div className='box-layout__box'>
        <img
          src={
            user.profile_image
              ? `/images/userProfile/${user.profile_image}`
              : user.avatar_url
          }
          className='mb-4 rounded-circle'
          alt='User Avatar'
        />
        <h3>{user.name}</h3>
        <h5>{user.email}</h5>
      </div>
      <form onSubmit={e => handleSubmit(e)} encType='multipart/form-data'>
        <div className='form-group'>
          <input type='file' onChange={e => onFileChange(e)} />
        </div>
        <div className='form-group'>
          <button type='submit'>Upload</button>
        </div>
      </form>
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
