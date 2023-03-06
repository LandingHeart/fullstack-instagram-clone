import React from "react";
import { AppBar, Typography, Grid } from "@mui/material";
import { withStyles } from "@mui/styles";
import logo from "../../public/logo.png";
const styles = (theme) => ({
  // example break points screen size, extra small  small medium large stylings
  [theme.breakpoints.only("xs")]: {},
  [theme.breakpoints.only("sm")]: {},
  [theme.breakpoints.only("md")]: {},
  [theme.breakpoints.only("lg")]: {},

  appbar: {
    backgroundColor: "white",
    display: "flex",
    justifyContent: "center",
    flex: "1",
    flexDirection: "column",
  },
});
function Navbar({ classes }) {
  return (
    <AppBar position="static" className={classes.appbar}>
      <Grid className={classes.appbar}>
        <img src={logo} style={{ width: "102.41px", height: "28.99px" }} />
        <Typography style={{ color: "black" }}></Typography>
      </Grid>
    </AppBar>
  );
}

export default withStyles(styles)(Navbar);
