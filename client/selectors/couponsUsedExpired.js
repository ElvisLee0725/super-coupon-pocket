import moment from 'moment';

export default coupons => {
  return coupons
    .filter(coupon => {
      const isExpired =
        moment(coupon.expiration_date).diff(moment(), 'days') < 0;
      return coupon.used || isExpired;
    })
    .sort((coupon1, coupon2) => {
      return moment(coupon1.update_at) < moment(coupon2.update_at) ? 1 : -1;
    });
};
