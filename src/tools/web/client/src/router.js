import { CONFIGURE_INSTANCE_SUCCESS, RETURN_TO_MAIN } from './actions'

export const PAGE_MAIN = 'PAGE_MAIN'
export const PAGE_CONFIGURE = 'PAGE_CONFIGURE'

export const routerReducer = (
  state = { page: PAGE_MAIN },
  action
) => {
  switch (action.type) {
    case CONFIGURE_INSTANCE_SUCCESS:
      return { ...action.result, page: PAGE_CONFIGURE }
    case RETURN_TO_MAIN:
      return { page: PAGE_MAIN }
    default:
      return state
  }
}
