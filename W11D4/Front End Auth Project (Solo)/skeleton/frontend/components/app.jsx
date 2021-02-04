// Phases 6 + 9: Signup Route + Auth Protected Route
// vid link: https://vimeo.com/243260623
// password: go_video_go

import React from 'react';
import WelcomeBar from './nav_bar/welcome_bar_container';
import NavBarContainer from './nav_bar/nav_bar_container';
import ChirpIndexContainer from './chirps/chirp_index_container';
// Phase 6
import SignupContainer from './session/signup_container';
//
import Home from './home/home';
import { Route } from 'react-router-dom';
// Phase 9
import { AuthRoute, ProtectedRoute } from '../utils/route_utils';
//

export default () => (
  <div>
    <Route path="/" component={NavBarContainer} />
    <Route exact path="/" component={Home} />

    <ProtectedRoute path="/chirps" component={ChirpIndexContainer} />
    
    <AuthRoute path="/signup" component={SignupContainer} />
  </div>
);
