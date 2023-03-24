import React from "react";
import { AppBar, Typography, Grid } from "@mui/material";
import { withStyles } from "@mui/styles";
import AddIcon from "./Icons/AddIcon";
const logo =
  "https://firebasestorage.googleapis.com/v0/b/livegoods-78a2f.appspot.com/o/d564266a62bbc9539ca70b3d9d5dc3d9.png?alt=media&token=e282d290-f54d-4aca-88e3-aa991c4bd16f";
const styles = (theme) => ({
  navbar: {
    display: "flex",
    alignItems: "center",
    flexDirection: "column",
    borderRight: "0.5px solid rgb(200, 200, 200, 1)",
    height: "100vh",
    width: "245px",
    position: "fixed",
    left: 0, // add this to position the side nav to the left
  },
  iconlistContainer: {
    listStyle: "none",
    display: "flex",
    flexDirection: "column",
    width: "100%",
    margin: "0px",
    padding: "0px",
    overflowX: "hidden",
    overflowY: "hidden",
  },
});

const handleOnclick = () => {
  console.log("clicked");
};

function Navbar({ classes }) {
  return (
    <nav className={classes.navbar}>
      <img
        src={logo}
        style={{ width: "102.41px", height: "28.99px", padding: "50px" }}
      />
      <ul className={classes.iconlistContainer}>
        <AddIcon />
        <AddIcon />
        <AddIcon />
        <AddIcon />
      </ul>
    </nav>
  );
}

export default withStyles(styles)(Navbar);
