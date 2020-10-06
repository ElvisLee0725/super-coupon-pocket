import { GET_PERSONAL_HISTORY, HISTORY_ERROR } from './types';
import axios from 'axios';

export const getPersonalHistory = () => async dispatch => {
  try {
    const resAll = await axios.get('/api/user/history-all');
    const resUsed = await axios.get('/api/user/history-all-used');
    dispatch({
      type: GET_PERSONAL_HISTORY,
      payload: { ...resAll.data, ...resUsed.data }
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
