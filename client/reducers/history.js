import { GET_PERSONAL_HISTORY, HISTORY_ERROR } from '../actions/types';

const initialState = {
  totalCouponsCount: 0,
  totalUsedCouponsCount: 0,
  ranking: null
};

export default (state = initialState, action) => {
  const { type, payload } = action;
  switch (type) {
    case GET_PERSONAL_HISTORY:
      return {
        ...state,
        totalCouponsCount: payload.totalCouponsCount,
        totalUsedCouponsCount: payload.totalUsedCouponsCount,
        ranking: payload.ranking
      };

    case HISTORY_ERROR:
      return {
        totalCouponsCount: 0,
        totalUsedCouponsCount: 0,
        ranking: null
      };

    default:
      return state;
  }
};
