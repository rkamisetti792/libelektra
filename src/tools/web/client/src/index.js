/**
 * @file
 *
 * @brief this is the main entry point of the application
 *
 * here we fetch all data and initialize redux and react
 *
 * @copyright BSD License (see LICENSE.md or https://www.libelektra.org)
 */

import React from 'react'
import ReactDOM from 'react-dom'
import injectTapEventPlugin from 'react-tap-event-plugin'
import { Provider } from 'react-redux'

import configureStore from './store'
import { fetchInstances } from './actions'
import App from './components/App.jsx'

import './css/main.css'

// enable onTouchTap events
//   this makes it possible to listen to events from mobile phone taps as well
//   as clicks on machines that don't have a touch screen
injectTapEventPlugin()

// initialize redux store
const store = configureStore()

// fetch instances when the app is loaded
store.dispatch(fetchInstances())

// load and render the app
ReactDOM.render(
  <Provider store={store}>
    <App store={store} />
  </Provider>,
  document.getElementById('root')
)
