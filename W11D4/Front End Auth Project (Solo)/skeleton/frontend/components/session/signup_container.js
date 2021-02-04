// Phase 4 - Signup Container
// vid link: https://vimeo.com/243258947
// password: go_video_go

import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session';
import Signup from './signup';

const mapDispatchToProps = dispatch => ({
    createNewUser: formUser => dispatch(createNewUser(formUser))
})

export default connect(null, mapDispatchToProps)(Signup);
