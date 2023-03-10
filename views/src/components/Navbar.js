import React from "react";
import { AppBar, Typography, Grid } from "@mui/material";
import { withStyles } from "@mui/styles";
const logo =
  "https://firebasestorage.googleapis.com/v0/b/livegoods-78a2f.appspot.com/o/d564266a62bbc9539ca70b3d9d5dc3d9.png?alt=media&token=e282d290-f54d-4aca-88e3-aa991c4bd16f";
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
