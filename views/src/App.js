import React, { useState, useEffect } from "react";
import MainLayout from "./shared/MainLayout";
import Registration from "./components/Registration";
import { useSelector, useDispatch } from "react-redux";
import { decrement, increment } from "./store/users.slice";
import { fetchPosts } from "./store/posts.slice";
function App() {
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(fetchPosts());
  }, []);
  // const user = useSelector((state) => state.users.value);
  const user = false;
  return user ? <MainLayout /> : <Registration />;
}

export default App;
