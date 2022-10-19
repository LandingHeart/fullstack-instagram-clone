import { combineReducers } from "redux";
import users from "./users.slice";
import posts from "./posts.slice";
import { configureStore } from "@reduxjs/toolkit";

const reducer = combineReducers({
  users,
  posts,
});

export const store = configureStore({
  reducer,
});
