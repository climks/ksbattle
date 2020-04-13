import 'babel-polyfill';
import errorReducer from '../errorReducer.js';

test('has init state', () => {
  const outcomeState = errorReducer();
  expect(Object.keys(outcomeState)).toHaveLength(0)
});

test('ignore invalid actions', () => {
  const outcomeState = errorReducer(
    {},
    {
      type: 'INVALID_ACTIOIN'
    }
  );
  expect(Object.keys(outcomeState)).toHaveLength(0)
});

test('store error', () => {
  const outcomeState = errorReducer(
    {},
    {
      type: 'MY_ACTION_FAILURE',
      payload: new Error('Ooops 4523456')
    }
  );
  expect(outcomeState).toHaveProperty('MY_ACTION', 'Ooops 4523456')
});

test('clear error', () => {
  const state1 = errorReducer(
    {},
    {
      type: 'MY_ACTION_FAILURE',
      payload: new Error('Ooops 4523456')
    }
  );
  const state2 = errorReducer(
    {},
    {
      type: 'MY_ACTION_CLEAR_ERROR'
    }
  );
  expect(!!state2.MY_ACTION).toBe(false)
});

test('clear error on another request', () => {
  const state1 = errorReducer(
    {},
    {
      type: 'MY_ACTION_FAILURE',
      payload: new Error('Ooops 4523456')
    }
  );
  const state2 = errorReducer(
    {},
    {
      type: 'MY_ACTION_REQUEST'
    }
  );
  expect(!!state2.MY_ACTION).toBe(false)
});
