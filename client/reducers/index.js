import { combineReducers } from 'redux';
import alert from './alert';
import alertMiddle from './alertMiddle';
import auth from './auth';
import coupon from './coupon';
import filter from './filter';
import history from './history';

export default combineReducers({
  alert,
  alertMiddle,
  auth,
  coupon,
  filter,
  history
});
