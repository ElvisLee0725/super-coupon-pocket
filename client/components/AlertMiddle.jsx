import React from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';

const AlertMiddle = ({ msg }) => {
  return (
    <div className="alert-viewport">
      <div className="coupon-used-alert">{ msg }</div>
    </div>
  );
};

AlertMiddle.propTypes = {
  msg: PropTypes.string.isRequired
};

const mapStateToProps = state => ({
  msg: state.alertMiddle.msg
});

export default connect(mapStateToProps)(AlertMiddle);
