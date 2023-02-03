import React from "react";
import { withStyles } from "@mui/styles";

const styles = (theme) => ({
  container: {
    width: "400px",
    height: "500px",
    borderRadius: "3px",
  },
  img: {
    height: "400px",
    width: "400px",
  },
});
function CardFeed({ title, postImgUrl, classes }) {
  return (
    <div className={classes.container}>
      <img className={classes.img} src={postImgUrl}></img>
      <div>{title}</div>
    </div>
  );
}
export default withStyles(styles)(CardFeed);
