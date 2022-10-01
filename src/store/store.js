import { combineReducers } from "redux";
import users from "./users.slice";
import { Action, configureStore, ThunkAction } from "@reduxjs/toolkit";

const reducer = combineReducers({
  users
});

export const store = configureStore({
  reducer
});
