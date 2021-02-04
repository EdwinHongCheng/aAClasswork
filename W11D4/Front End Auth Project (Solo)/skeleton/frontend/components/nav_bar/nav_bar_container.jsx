// Phase 7 - Nav Bar
// vid link: https://vimeo.com/243259859
// password: go_video_go

import React from 'react';
import { connect } from 'react-redux';
import NavBar from './nav_bar';

// Comment this back in after you have built the login functionality

import { logout } from '../../actions/session';

const mapStateToProps = state => ({
  currentUser: state.session.currentUser,
});

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout()),
});


// Comment this out when you have built the login functionality
// const mapStateToProps = null;
// const mapDispatchToProps = null;

export default connect(mapStateToProps, mapDispatchToProps)(NavBar);
