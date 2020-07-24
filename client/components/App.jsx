import React, { Fragment } from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import setAuthToken from '../utils/setAuthToken';
import Navbar from './Navbar';
import Alert from './Alert';
import Routes from '../routers/Routes';
import { loadUser } from '../actions/auth';

// Redux
import { Provider } from 'react-redux';
import store from '../store';

// Only set the auth token to header when token is in localStorage
if (localStorage.token) {
  setAuthToken(localStorage.token);
}

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      message: null,
      isLoading: true
    };
  }

  componentDidMount() {
    fetch('/api/health-check')
      .then(res => res.json())
      .then(data => this.setState({ message: data.message || data.error }))
      .catch(err => this.setState({ message: err.message }))
      .finally(() => this.setState({ isLoading: false }));

    // Only load the user once the app is mounted
    store.dispatch(loadUser());
  }

  render() {
    return (
      <Provider store={store}>
        <Router>
          <Fragment>
            <Navbar />
            <Alert />
            <Routes />
          </Fragment>
        </Router>
      </Provider>
    );
  }
}
