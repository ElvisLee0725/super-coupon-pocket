import moment from 'moment';

export default coupons => {
  return coupons.filter(coupon => {
    return moment(coupon.expiration_date).diff(moment().startOf('day'), 'days') >= 0;
  });
};
