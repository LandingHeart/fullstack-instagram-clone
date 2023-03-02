import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import MainLayout from "../shared/MainLayout";
import { fetchPosts } from "../store/posts.slice";
import CardFeed from "../components/CardFeed";
export default function HomePage({ theme }) {
  const dispatch = useDispatch();
  const { loading, posts } = useSelector((state) => state.posts);
  useEffect(() => {
    dispatch(fetchPosts());
  }, []);

  return (
    <>
      {loading === false &&
        posts?.map((ele, index) => (
          <CardFeed
            theme={theme}
            key={index}
            title={ele.title}
            postImgUrl={ele.postImgUrl}
          />
        ))}
    </>
  );
}
