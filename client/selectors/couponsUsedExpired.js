import moment from 'moment';

export default coupons => {
  return coupons
    .filter(coupon => {
      const isExpired =
        moment(coupon.expiration_date).startOf('day').diff(moment().startOf('day'), 'days') < 0;
      return coupon.used || isExpired;
    })
    .sort((coupon1, coupon2) => {
      return moment(coupon1.expiration_date) < moment(coupon2.expiration_date) ? 1 : -1;
    });
};
