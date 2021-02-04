import { combineReducers } from 'redux';
import entitiesReducer from './entities';
// Phase 3
import sessionReducer from './session'

export default combineReducers({
  entities: entitiesReducer,
  session: sessionReducer
});
