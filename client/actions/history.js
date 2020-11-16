import { GET_PERSONAL_HISTORY, HISTORY_ERROR } from './types';
import axios from 'axios';

export const getPersonalHistory = () => async dispatch => {
  try {
    const resAll = await axios.get('/api/users/history-all');
    const resUsed = await axios.get('/api/users/history-all-used');
    const ranking = await axios.get('/api/users/ranking');
    dispatch({
      type: GET_PERSONAL_HISTORY,
      payload: { ...resAll.data, ...resUsed.data, ...ranking.data }
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
