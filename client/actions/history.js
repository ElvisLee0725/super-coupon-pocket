import { GET_PERSONAL_HISTORY, HISTORY_ERROR } from './types';
import axios from 'axios';

export const getPersonalHistory = () => async dispatch => {
  try {
    const res = await axios.get('/api/users/profile-statistics');

    dispatch({
      type: GET_PERSONAL_HISTORY,
      payload: res.data
    });
  } catch (err) {
    dispatch({
      type: HISTORY_ERROR,
      payload: {
        msg: err.response.data.statusText,
        status: err.response.data.status
      }
    });
  }
};
