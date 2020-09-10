import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Login from '../components/Login';
import Register from '../components/Register';
import Dashboard from '../components/Dashboard';
import Profile from '../components/Profile';
import AddCoupon from '../components/AddCoupon';
import EditCoupon from '../components/EditCoupon';
import NotFound from '../components/NotFound';
import PrivateRoute from './PrivateRoute';
import PrivacyPolicy from '../components/PrivacyPolicy';

const Routes = () => {
  return (
    <Switch>
      <Route exact path='/' component={Login} />
      <Route exact path='/register' component={Register} />
      <PrivateRoute exact path='/dashboard' component={Dashboard} />
      <PrivateRoute exact path='/profile' component={Profile} />
      <PrivateRoute exact path='/add-coupon' component={AddCoupon} />
      <PrivateRoute
        exact
        path='/edit-coupon/:couponId'
        component={EditCoupon}
      />
      <Route exact path='/privacy-policy' component={PrivacyPolicy} />
      <Route component={NotFound} />
    </Switch>
  );
};

export default Routes;
