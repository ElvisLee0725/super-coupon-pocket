import React, { Fragment, useState } from 'react';
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import moment from 'moment';
import DeleteModal from './DeleteModal';
import { deleteCoupon, editCouponUsed } from '../actions/coupon';
import { setAlertMiddle } from '../actions/alert';

const CouponItem = ({
  coupon: { id, merchant, discount, expiration_date: expirationDate, used },
  deleteCoupon,
  editCouponUsed,
  history,
  openCouponTab,
  setOpeningCouponId,
  setAlertMiddle
}) => {
  const [markUsed, setUsed] = useState(used);

  const daysBeforeExpire = moment(expirationDate).startOf('day').diff(moment().startOf('day'), 'days');
  let showExpire = '';

  if (daysBeforeExpire === 1) {
    showExpire = 'Tomorrow';
  } else if (daysBeforeExpire === 0) {
    showExpire = 'Today';
  } else {
    showExpire = moment(expirationDate).format('MM/DD/YYYY');
  }

  return (
    <Fragment>
      <div
        className={`coupon-layout mb-3 p-3 ${openCouponTab && 'couponShadow'}`}
      >
        <div className='coupon-container'>
          <div className='coupon-checkUsed'>
            <form>
              <div className='form-group'>
                <input
                  type='checkbox'
                  className='coupon-layout__checkbox'
                  name='markUsed'
                  checked={markUsed}
                  value={markUsed}
                  onChange={() => {
                    setUsed(true);
                    editCouponUsed(id, true);
                    setAlertMiddle('Coupon Used');
                  }}
                />
              </div>
            </form>
          </div>
          <div className='coupon-detail'>
            <h6>{merchant}</h6>
            <p className='lead coupon-layout__discount'>{discount}</p>
            <p className='coupon-layout__expiration'>
              Expiration:{' '}
              <span
                className={`coupon-layout__expiration ${
                  daysBeforeExpire < 7
                    ? 'expireSoon'
                    : ''
                }`}
              >
                { showExpire }
              </span>
            </p>
          </div>

          <div
            className={`coupon-layout__operations ${
              openCouponTab ? 'openBtns' : ''
            }`}
          >
            <div
              className='coupon-layout__arrowArea'
              onClick={() => {
                if (openCouponTab) {
                  setOpeningCouponId(undefined);
                } else {
                  setOpeningCouponId(id);
                }
              }}
            >
              <i
                className={`fas fa-arrow-left coupon-layout__arrow ${
                  openCouponTab ? 'arrowRotate' : ''
                }`}
              ></i>
            </div>

            <Link
              className='btn coupon-layout__button'
              to={`/edit-coupon/${id}`}
            >
              <i className='fas fa-lg fa-pencil-alt'></i>
            </Link>

            <div
              type='button'
              className='btn coupon-layout__button'
              data-toggle='modal'
              data-target={`#deleteCouponModal${id}`}
            >
              <i className='fas fa-lg fa-trash-alt'></i>
            </div>
            <DeleteModal
              deleteCoupon={deleteCoupon}
              couponId={id.toString()}
              history={history}
            />
          </div>
        </div>
      </div>
    </Fragment>
  );
};

CouponItem.propTypes = {
  coupon: PropTypes.object.isRequired,
  deleteCoupon: PropTypes.func.isRequired,
  editCouponUsed: PropTypes.func.isRequired,
  history: PropTypes.object.isRequired,
  openCouponTab: PropTypes.bool.isRequired,
  setOpeningCouponId: PropTypes.func.isRequired,
  setAlertMiddle: PropTypes.func.isRequired
};

export default connect(null, { deleteCoupon, editCouponUsed, setAlertMiddle })(
  withRouter(CouponItem)
);
