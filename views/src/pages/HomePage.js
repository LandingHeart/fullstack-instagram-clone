import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchPosts } from "../store/posts.slice";
import CardFeed from "../components/CardFeed";
import { Container } from "@mui/material";
import { withStyles } from "@mui/styles";
const styles = (theme) => ({
  main_content_row_container: {},
});
function HomePage({ classes }) {
  const dispatch = useDispatch();
  const { loading, posts } = useSelector((state) => state.posts);
  useEffect(() => {
    dispatch(fetchPosts());
  }, []);

  return (
    <div className={classes.main_content_row_container}>
      {loading === false &&
        posts?.map((ele, index) => (
          <CardFeed key={index} title={ele.title} postImgUrl={ele.postImgUrl} />
        ))}
    </div>
  );
}

export default withStyles(styles)(HomePage);
