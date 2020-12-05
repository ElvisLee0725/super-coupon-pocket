import { v4 as uuidv4 } from 'uuid';
import { SET_ALERT, REMOVE_ALERT, SET_ALERT_MESSAGE, REMOVE_ALERT_MESSAGE } from './types';

export const setAlert = (msg, alertType, timeout = 5000) => dispatch => {
  const id = uuidv4();

  dispatch({
    type: SET_ALERT,
    payload: { id, msg, alertType }
  });

  // Remove the alert after 5 seconds
  setTimeout(() => dispatch({ type: REMOVE_ALERT, payload: id }), timeout);
};

export const setAlertMiddle = (msg, timeout = 2000) => dispatch => {
  dispatch({ type: SET_ALERT_MESSAGE, payload: msg });
  const alertView = document.querySelector('.alert-viewport');
  alertView.classList.add('alert-viewport--visible');

  setTimeout(() => {
    alertView.classList.remove('alert-viewport--visible');
    dispatch({ type: REMOVE_ALERT_MESSAGE, payload: '' });
  }, timeout);
};
