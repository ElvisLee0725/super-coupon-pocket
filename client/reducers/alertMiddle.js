import { SET_ALERT_MESSAGE } from '../actions/types';

const initialState = {
  msg: ''
};

export default (state = initialState, action) => {
  const { type, payload } = action;
  switch (type) {
    case SET_ALERT_MESSAGE:
      return { ...state, msg: payload };

    default:
      return state;
  }
};
