import React from "react";
import { withStyles } from "@mui/styles";
import { Container, Typography } from "@mui/material";
import { People } from "@mui/icons-material";
const styles = (theme) => ({
  cardContainer: {
    width: "400px",
    height: "500px",
    borderRadius: "3px",
  },
  img: {
    height: "400px",
    width: "400px",
  },
  iconWrap: {
    borderRadius: "50%",
    backgroundColor: "#f3f3f3",
    padding: "3px",
  },
});
function CardFeed({ title, postImgUrl, classes }) {
  return (
    <Container className={classes.cardContainer}>
      <People className={classes.iconWrap} />
      <img className={classes.img} src={postImgUrl}></img>
      <Typography variant="body1">{title}</Typography>
    </Container>
  );
}
export default withStyles(styles)(CardFeed);
